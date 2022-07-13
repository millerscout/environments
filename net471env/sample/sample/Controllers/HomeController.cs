using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace sample.Controllers
{
    public class HomeController : ApiController
    {
        [HttpGet]
        public HttpResponseMessage Index()
        {
            return Request.CreateResponse(HttpStatusCode.OK, "Hello World");
        }
    }
}