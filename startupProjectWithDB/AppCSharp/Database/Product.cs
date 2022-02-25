using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AppCSharp
{
    public class Product
    {
        public int Id { get; }
        public string Name { get; }

        public Product(int id, string name)
        {
            Id = id;
            Name = name;
        }
    }
}
