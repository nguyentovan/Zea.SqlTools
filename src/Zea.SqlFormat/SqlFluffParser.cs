using System.Diagnostics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Zea.SqlFormat;

internal static class SqlFluffParser
{
    private static readonly JsonSerializerOptions JsonOptions = new JsonSerializerOptions
    {
        MaxDepth = 512
    };

    public static string[] GetDialects()
    {
        var json = Run("--dialects");
        var labels = JsonSerializer.Deserialize<string[]>(json)
            ?? throw new FormatException("SQLFluff did not return a dialect list.");
        return labels;
    }

    public static SqlSegment Parse(string sql, string dialect)
    {
        var json = Run(dialect, sql);
        var tree = JsonSerializer.Deserialize<SqlSegment>(json, JsonOptions)
            ?? throw new FormatException("SQLFluff did not return a parse tree.");
        return tree;
    }

    private static string Run(string dialect, string? sql = null)
    {
#if ZEA_PORTABLE_PYTHON
        // IncludeAllContentForSelfExtract gives this build an extracted app directory.
        var python = Path.Combine(AppContext.BaseDirectory, "python", "python.exe");
#else
        var python = Environment.GetEnvironmentVariable("ZEA_SQLFLUFF_PYTHON") ?? "python";
#endif
        var utf8 = new UTF8Encoding(encoderShouldEmitUTF8Identifier: false);
        var startInfo = new ProcessStartInfo
        {
            FileName = python,
            UseShellExecute = false,
            CreateNoWindow = true,
            RedirectStandardInput = true,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            StandardInputEncoding = utf8,
            StandardOutputEncoding = utf8,
            StandardErrorEncoding = utf8
        };
        startInfo.ArgumentList.Add("-I");
        startInfo.ArgumentList.Add("-B");
        startInfo.ArgumentList.Add("-X");
        startInfo.ArgumentList.Add("utf8");
        startInfo.ArgumentList.Add(Path.Combine(AppContext.BaseDirectory, "SqlFluffBridge.py"));
        if (sql != null)
        {
            startInfo.ArgumentList.Add("--parse");
        }

        startInfo.ArgumentList.Add(dialect);

        using var process = new Process { StartInfo = startInfo };
        try
        {
            process.Start();
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

        var output = process.StandardOutput.ReadToEndAsync();
        var errors = process.StandardError.ReadToEndAsync();
        IOException? writeError = null;
        try
        {
            process.StandardInput.Write(sql);
            process.StandardInput.Close();
        }
        catch (IOException ex)
        {
            writeError = ex;
        }

        process.WaitForExit();
        var diagnostic = errors.GetAwaiter().GetResult().Trim();
        if (process.ExitCode == 2)
        {
            throw new UnsupportedSqlDialectException(diagnostic);
        }

        if (process.ExitCode != 0)
        {
            var message = $"SQLFluff could not parse {dialect}.";
            if (sql == null || diagnostic.Contains("No module named 'sqlfluff'", StringComparison.Ordinal))
            {
                message = "Could not load SQLFluff. Install it for the Python executable used by Zea.";
            }

            throw new FormatException(message + Environment.NewLine + diagnostic);
        }

        if (writeError != null)
        {
            throw new IOException("Could not send the SQL input to SQLFluff.", writeError);
        }

        var json = output.GetAwaiter().GetResult();
        return json;
    }
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
