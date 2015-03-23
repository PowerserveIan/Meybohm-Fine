/**
 * HomeController.cs
 * Copyright (c) Powerserve 2013. All rights reserved.
 * */

namespace FineWebsite.Controllers
{
    #region References

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;
    using FineWebsite.Models;

    #endregion

    public class HomeController : Controller
    {
        #region Methods

        /// <summary>
        /// Displays the basic home page of the Meybohm Fine site.
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            var listFeaturedShowcaseItem = ShowcaseItem.GetCollection(1, true);
            var listState = State.GetCollection();
            var listCity = Address.GetCities();

            this.ViewBag.ListFeaturedShowcaseItem = listFeaturedShowcaseItem;
            this.ViewBag.ListState = listState;
            this.ViewBag.ListCity = listCity;

            return this.View();
        }

        /// <summary>
        /// (Debug View Only)
        /// </summary>
        /// <returns></returns>
        public ActionResult Home2()
        {
            var listFeaturedShowcaseItem = ShowcaseItem.GetCollection(1, true);
            var listState = State.GetCollection();
            var listCity = Address.GetCities();

            this.ViewBag.ListFeaturedShowcaseItem = listFeaturedShowcaseItem;
            this.ViewBag.ListState = listState;
            this.ViewBag.ListCity = listCity;

            return this.View();
        }

        /// <summary>
        /// Displays the Home Contact Form.
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Contact()
        {
            return this.View();
        }

        /// <summary>
        /// Processes and then displays the Home contact Form.
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Contact(ContactTime contactTime, ContactMethod contactMethod, string firstName, string lastName, string phone, string email,
                                    string message)
        {
            Contact contact = new Contact();

            contact.ContactType = ContactType.ContactUs;
            contact.ContactStatus = ContactStatus.Unread;
            contact.ContactTime = contactTime;
            contact.ContactMethod = contactMethod;
            contact.FirstName = firstName;
            contact.LastName = lastName;
            contact.Phone = phone;
            contact.Email = email;
            contact.Message = message;
            contact.Created = DateTime.Now;

            contact.Save();

            this.ViewBag.NewContact = true;

            return RedirectToAction("ContactComplete", "Home");
        }

        /// <summary>
        /// Displays the completed page when a user completes a contact form.
        /// </summary>
        /// <returns></returns>
        public ActionResult ContactComplete()
        {
            return this.View();
        }

        /// <summary>
        /// Displays the about page.
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {
            return this.View();
        }

        #endregion
    }
}
