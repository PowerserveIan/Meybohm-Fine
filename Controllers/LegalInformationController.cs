/**
 * LegalInformation.cs
 * Copyright (c) Powerserve 2014. All rights reserved.
 * */
namespace FineWebsite.Controllers
{
    #region References

    using FineWebsite.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;

    #endregion

    public class LegalInformationController : Controller
    {
        //
        // GET: /LegalInformation/

        public ActionResult PrivacyPolicy()
        {
            return View();
        }

        public ActionResult Insurance()
        {
            return View();
        }

        public ActionResult Legal()
        {
            return View();
        }

        public ActionResult Copyright()
        {
            return View();
        }

    }
}
