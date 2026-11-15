using Zea.SqlFormat.Formatters.RightWay;
using Zea.SqlFormat.Formatters.RightWay.ParseStructure;

namespace Zea.SqlFormat;

internal static class SqlFormatter
{
    public static string FormatSql(string sql, string dialect)
    {
        bool useTsqlFormattingRules = dialect == "tsql";
        var tree = SqlFluffParser.Parse(sql, dialect);
        if (tree.Kind == "verbatim_sqlite")
        {
            return sql;
        }

        Node Reparse(string formatted)
        {
            var parsed = SqlFluffParser.Parse(formatted, dialect);
            var converted = SqlFluffTreeAdapter.Convert(parsed, useTsqlFormattingRules);
            return converted;
        }

        var options = new RightWayFormatterOptions();
        options.KeywordStandardization = useTsqlFormattingRules;
        var formatter = new RightWayFormatter(options);
        var sqlTree = SqlFluffTreeAdapter.Convert(tree, useTsqlFormattingRules);
        var result = formatter.FormatSQLTree(sqlTree, Reparse);

        if (!string.Equals(sql, result, StringComparison.Ordinal))
        {
            var reparsed = SqlFluffParser.Parse(result, dialect);
            SqlFluffTreeAdapter.CheckEquivalent(tree, reparsed, useTsqlFormattingRules);
        }

        return result;
    }
}
