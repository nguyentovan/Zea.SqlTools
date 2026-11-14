using System.Text.RegularExpressions;

namespace Zea.SqlLogConvert;

internal static class SqlLogConverter
{
    private static readonly Regex PreparedStatementRegex =
        new(@"PreparedStatement\s*:\s*\[(.+)\]", RegexOptions.Singleline | RegexOptions.Compiled);

    private static readonly Regex ParametersLineRegex =
        new(@"Parameters\s*:\s*\[(.+)\]", RegexOptions.Compiled);

    private static readonly Regex TypesLineRegex =
        new(@"Types\s*:\s*\[(.+)\]", RegexOptions.Compiled);

    private static readonly Regex ParamEntryRegex =
        new(@"(@param\d+)=\[(.*?)\](?=,\s*@param\d+=|$)", RegexOptions.Compiled);

    private static readonly string[] NumericLikeTypes =
    {
        "int", "long", "short", "byte", "decimal", "double", "float", "single",
        "number", "numeric", "bool", "bit", "tinyint", "smallint", "bigint",
        "real", "money", "smallmoney",
    };

    public static string ConvertLog(string log)
    {
        var (preparedStatement, parameters, types) = ParseLogLines(log);
        var sql = SubstituteParameters(preparedStatement, parameters, types);
        return sql;
    }

    private static (string PreparedStatement, Dictionary<string, string> Parameters, Dictionary<string, string> Types) ParseLogLines(string log)
    {
        string? preparedStatement = null;
        var parameters = new Dictionary<string, string>(StringComparer.Ordinal);
        var types = new Dictionary<string, string>(StringComparer.Ordinal);

        foreach (var rawLine in log.Split('\n'))
        {
            var line = rawLine.TrimEnd('\r');

            if (line.Contains("PreparedStatement : ["))
            {
                if (preparedStatement is not null)
                {
                    throw new FormatException("Input contains multiple PreparedStatement entries. Pass one log block at a time.");
                }

                var match = PreparedStatementRegex.Match(line);
                if (!match.Success || string.IsNullOrWhiteSpace(match.Groups[1].Value))
                {
                    throw new FormatException("Input contains an empty or incomplete PreparedStatement.");
                }

                preparedStatement = match.Groups[1].Value.Trim();
            }
            else if (line.Contains("Parameters: ["))
            {
                var match = ParametersLineRegex.Match(line);
                if (match.Success)
                {
                    ParseParameters(match.Groups[1].Value, parameters);
                }
            }
            else if (line.Contains("Types: ["))
            {
                var match = TypesLineRegex.Match(line);
                if (match.Success)
                {
                    ParseTypes(match.Groups[1].Value, types);
                }
            }
        }

        if (preparedStatement is null)
        {
            throw new FormatException("Input does not contain a PreparedStatement.");
        }

        return (preparedStatement, parameters, types);
    }

    private static string SubstituteParameters(string preparedStatement, Dictionary<string, string> parameters, Dictionary<string, string> types)
    {
        var sortedKeys = new List<string>(parameters.Keys);
        sortedKeys.Sort((a, b) =>
        {
            var order = b.Length.CompareTo(a.Length);
            return order;
        });

        var result = preparedStatement;
        foreach (var paramName in sortedKeys)
        {
            var value = parameters[paramName];
            types.TryGetValue(paramName, out var paramType);
            var rendered = RenderValue(value, paramType);
            var pattern = Regex.Escape(paramName) + @"\b";
            result = Regex.Replace(result, pattern, _ => rendered, RegexOptions.IgnoreCase);
        }

        return result;
    }

    private static void ParseParameters(string content, IDictionary<string, string> sink)
    {
        foreach (Match entry in ParamEntryRegex.Matches(content))
        {
            var raw = entry.Groups[2].Value;
            var separator = raw.IndexOf(',');
            if (separator >= 0)
            {
                raw = raw.Substring(separator + 1);
            }

            sink[entry.Groups[1].Value] = raw.Trim();
        }
    }

    private static void ParseTypes(string content, IDictionary<string, string> sink)
    {
        foreach (Match entry in ParamEntryRegex.Matches(content))
        {
            var raw = entry.Groups[2].Value;
            var separator = raw.IndexOf(',');
            if (separator >= 0)
            {
                raw = raw.Substring(0, separator);
            }

            sink[entry.Groups[1].Value] = raw.Trim().ToLowerInvariant();
        }
    }

    private static string RenderValue(string value, string? paramType)
    {
        // System.DBNull always maps to SQL NULL regardless of value.
        if (string.Equals(paramType, "system.dbnull", StringComparison.OrdinalIgnoreCase))
        {
            return "null";
        }

        if (string.IsNullOrEmpty(paramType))
        {
            if (IsBareLiteral(value))
            {
                return value;
            }
        }
        else if (ContainsAny(paramType, NumericLikeTypes))
        {
            return value;
        }

        var quotedValue = Quote(value);
        return quotedValue;
    }

    private static bool IsBareLiteral(string value)
    {
        var isBareLiteral = string.Equals(value, "null", StringComparison.OrdinalIgnoreCase)
            || string.Equals(value, "true", StringComparison.OrdinalIgnoreCase)
            || string.Equals(value, "false", StringComparison.OrdinalIgnoreCase)
            || Regex.IsMatch(value, @"^\d+(\.\d+)?$");
        return isBareLiteral;
    }

    private static string Quote(string value)
    {
        var quotedValue = "'" + value.Replace("'", "''") + "'";
        return quotedValue;
    }

    private static bool ContainsAny(string paramType, string[] needles)
    {
        foreach (var needle in needles)
        {
            if (paramType.IndexOf(needle, StringComparison.OrdinalIgnoreCase) >= 0)
            {
                return true;
            }
        }

        return false;
    }
}
