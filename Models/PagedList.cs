/**
 * PagedList.cs
 * Copyright (c) Powerserve 2013. All rights reserved.
 * */

namespace FineWebsite.Models
{
    #region References

    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Web;
    using FineWebsite.Extensions;

    #endregion

    /// <summary>
    /// Represents information related to a set of paged data.
    /// </summary>
    public abstract class PagedItem
    {
        #region Constructor

        /// <summary>
        /// Creates a new instance of the page context class.
        /// </summary>
        /// <param name="page">The current page's index.</param>
        /// <param name="pageSize">The current page's size.</param>
        /// <param name="count">The total number of data items on the current page.</param>
        /// <param name="itemCount">The total number of data items.</param>
        /// <param name="pageCount">The total number of pages.</param>
        public PagedItem(long page, long pageSize, long count, long itemCount, long pageCount)
        {
            this.Page = page;
            this.PageSize = pageSize;
            this.Count = count;
            this.ItemCount = itemCount;
            this.PageCount = pageCount;
            this.Parameters = new Dictionary<string, object>();
        }

        #endregion

        #region Properties

        /// <summary>
        /// Gets the current page's index.
        /// </summary>
        public long Page { get; private set; }

        /// <summary>
        /// Gets the current page's size.
        /// </summary>
        public long PageSize { get; private set; }

        /// <summary>
        /// Gets the number of data items on the current page.
        /// </summary>
        public long Count { get; private set; }

        /// <summary>
        /// Gets the total number of data items.
        /// </summary>
        public long ItemCount { get; private set; }

        /// <summary>
        /// Gets the total number of pages.
        /// </summary>
        public long PageCount { get; private set; }

        /// <summary>
        /// Gets the collection of additional parameters used to get data for the page context.
        /// </summary>
        public Dictionary<string, object> Parameters { get; private set; }

        /// <summary>
        /// Gets the additional parameters as a query string.
        /// </summary>
        public string ParameterQueryString
        {
            get
            {
                string query = null;

                if (this.Parameters.Count > 0)
                {
                    foreach (var pair in this.Parameters)
                        query += string.Format("{0}={1}&", pair.Key, pair.Value);

                    query.TrimEnd('&');
                }

                return query;
            }
        }

        #endregion

    }

    public sealed class PagedList<T> : PagedItem
    {
        #region Constructors

        /// <summary>
        /// Creates a new instance of the page context class.
        /// </summary>
        /// <param name="data">The current page's data.</param>
        /// <param name="page">The current page's index.</param>
        /// <param name="pageSize">The current page's size.</param>
        /// <param name="itemCount">The total number of data items.</param>
        /// <param name="pageCount">The total number of pages.</param>
        public PagedList(List<T> data, long page, long pageSize, long itemCount, long pageCount)
            : base(page, pageSize, data.Count, itemCount, pageCount)
        {
            this.Data = data;
        }

        #endregion

        #region Properties

        /// <summary>
        /// Gets the current page's data.
        /// </summary>
        public List<T> Data { get; private set; }

        #endregion
    }
}