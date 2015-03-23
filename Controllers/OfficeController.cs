using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FineWebsite.Controllers
{
    public class OfficeController : Controller
    {
        //
        // GET: /Office/

        public ActionResult Index()
        {
            return this.View();
        }

        public ActionResult List()
        {
            return this.View();
        }

    }
}
