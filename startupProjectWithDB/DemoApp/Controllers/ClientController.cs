using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DemoApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ClientController : ControllerBase
    {
        private static readonly string[] Nomes = new[]
        {
            "João", "Pedro", "Larissa", "Milena", "Nelson", "Icaro"
        };

        private readonly ILogger<ClientController> _logger;
         
        public ClientController(ILogger<ClientController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        [Route("")]
        public IEnumerable<Client> Get()
        {
            var rng = new Random();
            return Enumerable.Range(1, 6).Select(index => new Client
            {
                Id = rng.Next(0, 1000),
                Name = Nomes[rng.Next(Nomes.Length)]
            });
        }

        [HttpGet]
        [Route("sql")]
        public object testes()
        {

            using (var connection = new SqlConnection("Server=db;Database=Demo;User Id=sa;Password=JustASimplePass$;"))
            {
                return connection.Query<Client>("SELECT Id, Name FROM Client").ToArray();
            }

        }
    }
}
