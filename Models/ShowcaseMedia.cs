/**
 * ShowcaseMedia.cs
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
    /// The media (images/video, etc.) associated with a showcase media collection.
    /// </summary>
    public class ShowcaseMedia
    {
        #region Fields

        /// <summary>
        /// Gets the universal upload folder for custom images.
        /// </summary>
        private string UploadFolder
        {
            get
            {
                if (String.IsNullOrEmpty(ConfigurationManager.AppSettings["SiteWide_UploadFolder"]))
                    return "uploads/";
                return ConfigurationManager.AppSettings["SiteWide_UploadFolder"];
            }
        }

        /// <summary>
        /// Gets absolute path (ends with a /)
        /// </summary>
        private string RootPath
        {
            get 
            {
                return ConfigurationManager.AppSettings["SiteWide_UrlHost"];
            }
        }

        #endregion

        #region Constructors

        public ShowcaseMedia()
        {

        }

        public ShowcaseMedia(IDataReader reader)
        {
            this.ShowcaseMediaId = Convert.ToInt64(reader.GetOrZero("ShowcaseMediaID"));
            this.ShowcaseMediaCollectionId = Convert.ToInt64(reader.GetOrZero("ShowcaseMediaCollectionID"));
            this.URL = (string)reader.GetOrNull("URL");
            this.Caption = (string)reader.GetOrNull("Caption");
            this.Thumbnail = (string)reader.GetOrNull("Thumbnail");
            this.DisplayOrder = Convert.ToInt32(reader.GetOrNull("DisplayOrder"));
            this.Active = (bool)reader.GetOrNull("Active");
        }

        #endregion

        #region Properties

        /// <summary>
        /// The Id of the showcase media item.
        /// </summary>
        public long ShowcaseMediaId { get; set; }

        /// <summary>
        /// The URL of the showcase media item.
        /// </summary>
        public string URL { get; set; }

        /// <summary>
        /// Returns the image link to be used for HREF's for the URL/Image/Video.
        /// </summary>
        public string ImageLink
        {
            get
            {
                if (this.URL.ToLower().StartsWith("http"))
                {
                    return this.URL;
                }
                else
                {
                    return this.RootPath + this.UploadFolder + "images/" + this.URL;
                }
            }
        }

        /// <summary>
        /// The caption to display for the showcase media.
        /// </summary>
        public string Caption { get; set; }

        /// <summary>
        /// The thumnbnail associated with the showcase media.
        /// </summary>
        public string Thumbnail { get; set; }

        /// <summary>
        /// The Id for the showcase media collection.
        /// </summary>
        public long ShowcaseMediaCollectionId { get; set; }

        /// <summary>
        /// The display order of the showcase media.
        /// </summary>
        public int DisplayOrder { get; set; }

        /// <summary>
        /// Whether or not the showcase media collection is active.
        /// </summary>
        public bool Active { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets a showcase media item from the id.
        /// </summary>
        /// <param name="showcaseMediaId">The id of the showcase media item.</param>
        /// <returns></returns>
        public static ShowcaseMedia Get(int showcaseMediaId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseMedia_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("ShowcaseMediaID", showcaseMediaId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new ShowcaseMedia(reader);
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Gets a collection of showcase media items for a showcase item.
        /// </summary>
        /// <param name="showcaseItemId">The id of the showcase item.</param>
        /// <returns></returns>
        public static List<ShowcaseMedia> GetCollection(long showcaseItemId)
        {
            return ShowcaseMedia.GetCollection(showcaseItemId, null);
        }

        /// <summary>
        /// Gets a collection of showcase media items for a showcase item.
        /// </summary>
        /// <param name="showcaseItemId">The id of the showcase item.</param>
        /// <param name="isFine">Determines whether or not to get only images from the fine collection.</param>
        /// <returns></returns>
        public static List<ShowcaseMedia> GetCollection(long showcaseItemId, bool? isFine)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseMedia_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<ShowcaseMedia> listShowcaseMedia = new List<ShowcaseMedia>();

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("ShowcaseItemID", showcaseItemId);
                    command.Parameters.AddWithValue("IsFine", isFine);

                    // Open the connection, read the data (if any), and populate the list.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listShowcaseMedia.Add(new ShowcaseMedia(reader));
                        }
                    }
                }
            }

            return listShowcaseMedia;
        }

        #endregion
    }
}