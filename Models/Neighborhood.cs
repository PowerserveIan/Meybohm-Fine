/**
 * Neighborhood.cs
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
    /// The neighborhood associated with the address/property.
    /// </summary>
    public class Neighborhood
    {
        #region Fields

        /// <summary>
        /// The address associated with the neighborhood.
        /// </summary>
        private Address Address = null;

        #endregion

        #region Constructors

        public Neighborhood()
        {

        }

        public Neighborhood(IDataReader reader)
        {
            this.NeighborhoodId = Convert.ToInt64(reader.GetOrNull("NeighborhoodID"));
            this.CMMicrositeId = Convert.ToInt64(reader.GetOrNull("CMMicrositeID"));
            this.Name = (string)reader.GetOrNull("Name");
            this.Image = (string)reader.GetOrNull("Image");
            this.PriceRange = (string)reader.GetOrNull("PriceRange");
            this.Overview = (string)reader.GetOrNull("Overview");
            this.Directions = (string)reader.GetOrNull("Directions");
            this.Amenities = (string)reader.GetOrNull("Amenities");
            this.Website = (string)reader.GetOrNull("Website");
            this.Active = (bool)reader.GetOrNull("Active");
            this.Featured = (bool)reader.GetOrNull("Featured");
            this.ShowLotsLand = (bool)reader.GetOrNull("ShowLotsLand");

            this.AddressId = Convert.ToInt64(reader.GetOrZero("AddressID"));
        }

        #endregion

        #region Properties

        /// <summary>
        /// The Id neighborhood.
        /// </summary>
        public long NeighborhoodId { get; set; }

        /// <summary>
        /// The Id the CMMicrosite.
        /// </summary>
        public long CMMicrositeId { get; set; }

        /// <summary>
        /// The id of the address.
        /// </summary>
        public long AddressId { get; set; }

        /// <summary>
        /// The name of the neighborhood.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The image of the neighborhood.
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// The Price Range of the neighborhood.
        /// </summary>
        public string PriceRange { get; set; }

        /// <summary>
        /// The overview of the neighborhood.
        /// </summary>
        public string Overview { get; set; }

        /// <summary>
        /// The direction to the neighbohood.
        /// </summary>
        public string Directions { get; set; }

        /// <summary>
        /// The amenities associated with the neighborhood.
        /// </summary>
        public string Amenities { get; set; }

        /// <summary>
        /// The website associated with the website.
        /// </summary>
        public string Website { get; set; }

        /// <summary>
        /// Whether the neighborhood is active.
        /// </summary>
        public bool Active { get; set; }

        /// <summary>
        /// Whether the neighborhood is featured.
        /// </summary>
        public bool Featured { get; set; }

        /// <summary>
        /// Whether or nto the lots are shown on the land.
        /// </summary>
        public bool ShowLotsLand { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the neighborhood from the id.
        /// </summary>
        /// <param name="neighborhoodId">The id of the neighborhood.</param>
        /// <returns></returns>
        public static Neighborhood Get(int neighborhoodId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Neighborhood_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("NeighborhoodID", neighborhoodId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Neighborhood(reader);
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
        /// Obtains the address for a neighborhood from the database/or locally if it already exists
        /// </summary>
        /// <returns></returns>
        public Address GetAddress()
        {
            if (this.Address == null)
            {
                this.Address = Address.Get(this.AddressId);
            };

            return this.Address;
        }

        #endregion
    }
}