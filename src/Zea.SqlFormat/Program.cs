using System.Text;

namespace Zea.SqlFormat;

internal static class Program
{
    private const string Usage = "Usage: Zea.SqlFormat --dialect tsql | Zea.SqlFormat --help";

    private static int Main(string[] args)
    {
        if (args.Length == 1 && args[0] is "-h" or "--help")
        {
            Console.WriteLine(Usage);
            Console.WriteLine("Send SQL to stdin. The formatted SQL is written to stdout.");
            return 0;
        }

        if (args.Length != 2 || args[0] != "--dialect")
        {
            Console.Error.WriteLine(Usage);
            return 2;
        }

        if (!string.Equals(args[1], "tsql", StringComparison.OrdinalIgnoreCase))
        {
            Console.Error.WriteLine($"Unsupported SQL dialect: {args[1]}");
            Console.Error.WriteLine(Usage);
            return 2;
        }

        var dialect = SqlDialect.TSql;
        try
        {
            Console.InputEncoding = Encoding.UTF8;
            Console.OutputEncoding = Encoding.UTF8;

            var sql = Console.In.ReadToEnd();
            var formattedSql = SqlFormatter.FormatSql(sql, dialect);
            Console.Write(formattedSql);
            return 0;
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
            return 1;
        }
    }
}
