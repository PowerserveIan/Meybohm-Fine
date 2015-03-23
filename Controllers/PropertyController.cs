/**
 * PropertyController.cs
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

    public class PropertyController : Controller
    {
        #region Methods

        /// <summary>
        /// Displays a specific showcase item (property)
        /// </summary>
        /// <param name="Id">The Id of the showcase item.</param>
        /// <returns></returns>
        public ActionResult Index(long Id)
        {
            var showcaseItem = ShowcaseItem.Get(Id);
            var listShowcaseMedia = ShowcaseMedia.GetCollection(showcaseItem.ShowcaseItemId, true);
            var listAgent = Agent.GetCollectionByTeam(showcaseItem.TeamId);

            this.ViewBag.ShowcaseItem = showcaseItem;
            this.ViewBag.ListShowcaseMedia = listShowcaseMedia;
            this.ViewBag.ListAgent = listAgent;

            return this.View();
        }

        /// <summary>
        /// Displays a new List page.
        /// </summary>
        /// <param name="preLoaded">If null, the page loads with all fine showcase items, else it loads with nothing.</param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult List(string preLoaded)
        {
            var page = 1;
            var pageAmount = 20;
            var sortDirection = -1;

            var listState = State.GetCollection();
            var listCity = Address.GetCities();
            var pagedListShowcaseItem = new PagedList<ShowcaseItem>(new List<ShowcaseItem>(), page, pageAmount, 0, 0);

            if (string.IsNullOrEmpty(preLoaded))
            {
                pagedListShowcaseItem = ShowcaseItem.GetCollection(null, null, null, null, null, null, null, null, null, null, sortDirection, null, page, pageAmount, null);
            }

            var showcaseItemTags = new string[0];

            this.ViewBag.PagedListShowcaseItem = pagedListShowcaseItem;
            this.ViewBag.ListState = listState;
            this.ViewBag.ListCity = listCity;

            this.ViewBag.ShowcaseItemTags = showcaseItemTags;
            this.ViewBag.SortDirection = sortDirection;
            this.ViewBag.Page = page;
            this.ViewBag.PageAmount = pageAmount;

            return this.View();
        }

        /// <summary>
        /// Displays a list of showcase items determined from the filter values passed in.
        /// </summary>
        /// <param name="stateId">The Id of the state</param>
        /// <param name="city">The name of the city</param>
        /// <param name="listPriceMin">The minimum price of the property</param>
        /// <param name="listPriceMax">The maximum price of the property</param>
        /// <param name="bedsMin">The minimum amount of beds - inclusive</param>
        /// <param name="bedsMax">The maximum amount of beds - inclusive</param>
        /// <param name="bathsMin">The minimum amount of baths - inclusive</param>
        /// <param name="bathsMax">The maximum amount of baths - inclusive</param>
        /// <param name="genericFilter">The generic filter to look filter through City, MLSID, State, and Abbreviation</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult List(int? stateId, string city, double? listPriceMin, double? listPriceMax, 
                                 int? bedsMin, int? bedsMax, int? bathsMin, int? bathsMax, string genericFilter,
                                 int? page, int? pageAmount, int? sortDirection, string sortBy, string[] showcaseItemTags)
        {
            page = page ?? 1;
            pageAmount = pageAmount ?? 20;
            sortDirection = sortDirection ?? -1;

            var pagedListShowcaseItem = ShowcaseItem.GetCollection(stateId, city, listPriceMin, listPriceMax, bedsMin, bedsMax, bathsMin, bathsMax, genericFilter, sortBy, sortDirection.Value, null, page, pageAmount, showcaseItemTags);

            var listState = State.GetCollection();
            var listCity = Address.GetCities();
            showcaseItemTags = showcaseItemTags ?? new string[0];

            this.ViewBag.PagedListShowcaseItem = pagedListShowcaseItem;
            this.ViewBag.ListState = listState;
            this.ViewBag.ListCity = listCity;

            this.ViewBag.StateId = stateId;
            this.ViewBag.City = city;
            this.ViewBag.ListPriceMin = listPriceMin;
            this.ViewBag.ListPriceMax = listPriceMax;
            this.ViewBag.BedsMin = bedsMin;
            this.ViewBag.BedsMax = bedsMax;
            this.ViewBag.BathsMin = bathsMin;
            this.ViewBag.BathsMax = bathsMax;
            this.ViewBag.GenericFilter = genericFilter;
            this.ViewBag.ShowcaseItemTags = showcaseItemTags;

            this.ViewBag.SortBy = sortBy;
            this.ViewBag.SortDirection = sortDirection;
            this.ViewBag.Page = page;
            this.ViewBag.PageAmount = pageAmount;

            return this.View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult VirtualMagazine()
        {
            PagedList<ShowcaseItem> pagedListShowcaseItem = ShowcaseItem.GetCollection(1, 6);
            
            this.ViewBag.PagedListShowcaseItem = pagedListShowcaseItem;

            return this.View();
        }

        #endregion
    }
}
