using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace AppCSharp.Controllers
{
    [Route("")]
    public class ProductsController : ControllerBase
    {
        private readonly ProductsProvider _provider = new ProductsProvider();

        [HttpGet]
        public ActionResult<IEnumerable<Product>> Get()
        {
            Console.WriteLine("foi?");
            return _provider.GetAll();
        }
    }
}