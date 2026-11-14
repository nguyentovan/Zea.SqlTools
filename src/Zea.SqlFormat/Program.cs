using System.Text;

namespace Zea.SqlFormat;

internal static class Program
{
    private const string Usage = "Usage: Zea.SqlFormat [--help]";

    private static int Main(string[] args)
    {
        if (args.Length == 1 && args[0] is "-h" or "--help")
        {
            Console.WriteLine(Usage);
            Console.WriteLine("Send T-SQL to stdin. The formatted SQL is written to stdout.");
            return 0;
        }

        if (args.Length > 0)
        {
            Console.Error.WriteLine(Usage);
            return 2;
        }

        try
        {
            Console.InputEncoding = Encoding.UTF8;
            Console.OutputEncoding = Encoding.UTF8;

            var sql = Console.In.ReadToEnd();
            var formattedSql = SqlFormatter.FormatSql(sql);
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
