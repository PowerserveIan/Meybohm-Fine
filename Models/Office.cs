/**
 * Office.cs
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
    /// The Office associated with the showcase item (property)
    /// </summary>
    public class Office
    {
        #region Fields

        /// <summary>
        /// The address associated with the office.
        /// </summary>
        private Address Address = null;

        #endregion

        #region Constructors

        public Office()
        {

        }

        public Office(IDataReader reader)
        {
            this.OfficeId = Convert.ToInt64(reader.GetOrNull("OfficeID"));
            this.CMMicrositeId = Convert.ToInt64(reader.GetOrNull("CMMicrositeID"));
            this.Name = (string)reader.GetOrNull("Name");
            this.Phone = (string)reader.GetOrNull("Phone");
            this.Fax = (string)reader.GetOrNull("Fax");
            this.HasNewHomes = (bool)reader.GetOrNull("HasNewHomes");
            this.HasRentals = (bool)reader.GetOrNull("HasRentals");
            this.Active = (bool)reader.GetOrNull("Active");
            this.Image = (string)reader.GetOrNull("Image");
            this.IsMeybohm = (bool)reader.GetOrNull("IsMeybohm");

            this.AddressId = Convert.ToInt64(reader.GetOrZero("AddressID"));
        }

        #endregion

        #region Properties

        /// <summary>
        /// The Id of the Office.
        /// </summary>
        public long OfficeId { get; set; }

        /// <summary>
        /// The Id of the Address associated with the Office.
        /// </summary>
        public long AddressId { get; set; }

        /// <summary>
        /// The Id associated with the CMMicrosite.
        /// </summary>
        public long CMMicrositeId { get; set; }

        /// <summary>
        /// The Name of the Office.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The phone number for the office.
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// The FAX number of the office .
        /// </summary>
        public string Fax { get; set; }

        /// <summary>
        /// Whether or not the office has new homes.
        /// </summary>
        public bool HasNewHomes { get; set; }

        /// <summary>
        /// Whether or not the office has rental homes.
        /// </summary>
        public bool HasRentals { get; set; }

        /// <summary>
        /// Whether or not the office is active.
        /// </summary>
        public bool Active { get; set; }

        /// <summary>
        /// The URL of the image of the Office.
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// Whether or not the office is for Meybohm.
        /// </summary>
        public bool IsMeybohm { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the office associated with the ID.
        /// </summary>
        /// <param name="officeId">The id of the office.</param>
        /// <returns></returns>
        public static Office Get(int officeId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Office_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("OfficeID", officeId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Office(reader);
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
        /// Obtains the address for a office from the database/or locally if it already exists
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