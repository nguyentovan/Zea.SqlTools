using Zea.SqlFormat.Formatters.TSql;

namespace Zea.SqlFormat;

internal static class SqlFormatter
{
    public static string FormatSql(string sql, SqlDialect dialect)
    {
        if (string.IsNullOrWhiteSpace(sql))
        {
            throw new FormatException("Input does not contain any SQL.");
        }

        switch (dialect)
        {
            case SqlDialect.TSql:
                var formattedSql = TSqlFormatter.FormatSql(sql);
                return formattedSql;
            default:
                throw new ArgumentOutOfRangeException(nameof(dialect), dialect, "Unsupported SQL dialect.");
        }
    }
}
