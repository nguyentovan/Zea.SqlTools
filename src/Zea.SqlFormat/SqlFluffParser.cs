using System.Diagnostics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Zea.SqlFormat;

internal sealed class SqlFluffParser : IDisposable
{
    private static readonly JsonSerializerOptions JsonOptions = new JsonSerializerOptions
    {
        MaxDepth = 512
    };

    private readonly string _dialect;
    private readonly Process _process;
    private readonly Task<string> _errors;

    public SqlFluffParser(string dialect)
    {
        _dialect = dialect;
        _process = StartProcess("--serve", dialect);
        _errors = _process.StandardError.ReadToEndAsync();
    }

    public static string[] GetDialects()
    {
        using var process = StartProcess("--dialects");
        var errors = process.StandardError.ReadToEndAsync();
        process.StandardInput.Close();
        var json = process.StandardOutput.ReadToEnd();
        process.WaitForExit();
        if (process.ExitCode != 0)
        {
            var diagnostic = errors.GetAwaiter().GetResult().Trim();
            throw new FormatException("Could not load SQLFluff. Install it for the Python executable used by Zea."
                + Environment.NewLine + diagnostic);
        }

        var labels = JsonSerializer.Deserialize<string[]>(json)
            ?? throw new FormatException("SQLFluff did not return a dialect list.");
        return labels;
    }

    public SqlSegment Parse(string sql)
    {
        // A JSON string keeps embedded newlines from ending the request.
        var request = JsonSerializer.Serialize(sql);
        try
        {
            _process.StandardInput.WriteLine(request);
            _process.StandardInput.Flush();
        }
        catch (IOException ex)
        {
            _process.WaitForExit();
            if (_process.ExitCode != 0)
            {
                throw GetBridgeFailure();
            }

            throw new IOException("Could not send the SQL input to SQLFluff.", ex);
        }

        var line = _process.StandardOutput.ReadLine();
        if (line == null)
        {
            _process.WaitForExit();
            throw GetBridgeFailure();
        }

        var reply = JsonSerializer.Deserialize<ParseReply>(line, JsonOptions);
        if (reply != null && reply.ExitCode != 0)
        {
            FinishBridge();
            var bridgeErrors = _errors.GetAwaiter().GetResult();
            var parseError = (reply.Diagnostic ?? string.Empty).Replace("\n", Environment.NewLine);
            var diagnostic = (bridgeErrors + parseError).Trim();
            if (reply.ExitCode == 2)
            {
                throw new UnsupportedSqlDialectException(diagnostic);
            }

            throw new FormatException($"SQLFluff could not parse {_dialect}." + Environment.NewLine + diagnostic);
        }

        var tree = reply?.Tree ?? throw new FormatException("SQLFluff did not return a parse tree.");
        return tree;
    }

    public void Dispose()
    {
        using var process = _process;
        FinishBridge();
    }

    private void FinishBridge()
    {
        try
        {
            _process.StandardInput.Close();
        }
        catch (IOException)
        {
            // The pipe can already be closed if the bridge failed during a request.
        }

        _process.WaitForExit();
    }

    private FormatException GetBridgeFailure()
    {
        var diagnostic = _errors.GetAwaiter().GetResult().Trim();
        var message = $"SQLFluff could not parse {_dialect}.";
        if (diagnostic.Contains("No module named 'sqlfluff'", StringComparison.Ordinal))
        {
            message = "Could not load SQLFluff. Install it for the Python executable used by Zea.";
        }

        var error = new FormatException(message + Environment.NewLine + diagnostic);
        return error;
    }

    private static Process StartProcess(string mode, string? dialect = null)
    {
#if ZEA_PORTABLE_PYTHON
        // IncludeAllContentForSelfExtract gives this build an extracted app directory.
        var python = Path.Combine(AppContext.BaseDirectory, "python", "python.exe");
#else
        var python = Environment.GetEnvironmentVariable("ZEA_SQLFLUFF_PYTHON") ?? "python";
#endif
        var utf8 = new UTF8Encoding(encoderShouldEmitUTF8Identifier: false);
        var startInfo = new ProcessStartInfo();
        startInfo.FileName = python;
        startInfo.UseShellExecute = false;
        startInfo.CreateNoWindow = true;
        startInfo.RedirectStandardInput = true;
        startInfo.RedirectStandardOutput = true;
        startInfo.RedirectStandardError = true;
        startInfo.StandardInputEncoding = utf8;
        startInfo.StandardOutputEncoding = utf8;
        startInfo.StandardErrorEncoding = utf8;
        startInfo.ArgumentList.Add("-I");
        startInfo.ArgumentList.Add("-B");
        startInfo.ArgumentList.Add("-X");
        startInfo.ArgumentList.Add("utf8");
        startInfo.ArgumentList.Add(Path.Combine(AppContext.BaseDirectory, "SqlFluffBridge.py"));
        startInfo.ArgumentList.Add(mode);
        if (dialect != null)
        {
            startInfo.ArgumentList.Add(dialect);
        }

        Process process;
        try
        {
            process = Process.Start(startInfo)
                ?? throw new InvalidOperationException("Could not start the SQLFluff bridge.");
        }
        catch (System.ComponentModel.Win32Exception ex)
        {
#if ZEA_PORTABLE_PYTHON
            throw new InvalidOperationException("Could not start the Python runtime packaged with Zea.", ex);
#else
            throw new InvalidOperationException(
                "Could not start Python. Install SQLFluff and set ZEA_SQLFLUFF_PYTHON to its Python executable.", ex);
#endif
        }

        return process;
    }

    private sealed record ParseReply(
        [property: JsonPropertyName("exitCode")] int ExitCode,
        [property: JsonPropertyName("diagnostic")] string? Diagnostic,
        [property: JsonPropertyName("tree")] SqlSegment? Tree);
}

internal sealed class UnsupportedSqlDialectException(string message) : Exception(message);

internal sealed record SqlSegment(
    [property: JsonPropertyName("kind")] string Kind,
    [property: JsonPropertyName("text")] string? Text,
    [property: JsonPropertyName("children")] SqlSegment[]? Children)
{
    public IReadOnlyList<SqlSegment> Parts
    {
        get
        {
            var parts = Children ?? Array.Empty<SqlSegment>();
            return parts;
        }
    }

    public string Raw()
    {
        if (Text != null)
        {
            return Text;
        }

        var raw = string.Concat(Parts.Select(part => part.Raw()));
        return raw;
    }
}
