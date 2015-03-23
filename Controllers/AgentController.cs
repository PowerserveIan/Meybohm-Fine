/**
 * AgentController.cs
 * Copyright (c) Powerserve 2013. All rights reserved.
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

    public class AgentController : Controller
    {
        #region Methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Index(long id)
        {
            var agent = Agent.Get(id);
            var listAgentTestimonial = AgentTestimonial.GetCollection(id);

            this.ViewBag.Agent = agent;
            this.ViewBag.ListAgentTestimonial = listAgentTestimonial;

            return this.View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="agentName"></param>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public ActionResult List(string agentName, int? page, int? pageSize)
        {
            page = page ?? 1;
            pageSize = pageSize ?? 8;
            agentName = agentName ?? "";

            var pagedListAgent = Agent.GetCollection(agentName.Trim(), page, pageSize);

            this.ViewBag.PagedListAgent = pagedListAgent;

            this.ViewBag.AgentName = agentName;
            this.ViewBag.Page = page;
            this.ViewBag.PageSize = pageSize;

            return this.View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Listing(long id)
        {
            var agent = Agent.Get(id);
            var listShowcaseItem = ShowcaseItem.GetCollectionByAgent(id);

            this.ViewBag.Agent = agent;
            this.ViewBag.ListShowcaseItem = listShowcaseItem;

            return this.View();
        }

        #endregion
    }
}
