using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace AppCSharp
{
    public class ProductsProvider
    {
        public Product[] GetAll()
        {
            using (var connection = new SqlConnection("Server=db;Database=Main;User Id=sa;Password=abc123456@@;"))
            {
                return connection.Query<Product>("SELECT Id, Name FROM Products").ToArray();
            }
        }
    }
}
