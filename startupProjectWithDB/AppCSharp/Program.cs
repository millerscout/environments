using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace AppCSharp
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            System.Console.WriteLine("started");
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>();
    }
}
