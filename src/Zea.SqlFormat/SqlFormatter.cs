using PoorMansTSqlFormatterLib;
using PoorMansTSqlFormatterLib.Formatters;
using PoorMansTSqlFormatterLib.Interfaces;
using PoorMansTSqlFormatterLib.Parsers;
using PoorMansTSqlFormatterLib.Tokenizers;

namespace Zea.SqlFormat;

internal static class SqlFormatter
{
    public static string FormatSql(string sql)
    {
        if (string.IsNullOrWhiteSpace(sql))
        {
            throw new FormatException("Input does not contain any SQL.");
        }

        var tokenizer = new TSqlStandardTokenizer();
        var tokens = tokenizer.TokenizeSQL(sql);
        var parser = new TSqlStandardParser();
        var sqlTree = parser.ParseSQL(tokens);
        if (sqlTree.GetAttributeValue(SqlStructureConstants.ANAME_ERRORFOUND) == "1")
        {
            var descriptions = ParseErrorAnalyzer.GetErrorDescriptions(sqlTree, tokens);
            var message = string.Join(Environment.NewLine, descriptions);
            throw new FormatException("Could not parse T-SQL." + Environment.NewLine + message);
        }

        var options = new TSqlStandardFormatterOptions();
        options.KeywordStandardization = true;
        var formatter = new TSqlStandardFormatter(options);
        var formattedSql = formatter.FormatSQLTree(sqlTree);
        return formattedSql;
    }
}
