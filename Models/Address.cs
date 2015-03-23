/**
 * Address.cs
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
    /// The address is an object associated with a neighborhood or showcase item
    /// </summary>
    public class Address
    {
        #region Fields

        /// <summary>
        /// The state associated with the address
        /// </summary>
        private State State = null;

        #endregion

        #region Constructors

        public Address()
        {

        }

        public Address(IDataReader reader)
        {
            this.AddressId = Convert.ToInt64(reader.GetOrNull("AddressID"));
            this.Address1 = (string)reader.GetOrNull("Address1");
            this.Address2 = (string)reader.GetOrNull("Address2");
            this.City = (string)reader.GetOrNull("City");
            this.Zip = (string)reader.GetOrNull("Zip");
            this.Latitude = Convert.ToDouble(reader.GetOrZero("Latitude"));
            this.Longitude = Convert.ToDouble(reader.GetOrZero("Longitude"));

            this.StateId = (int)reader.GetOrZero("StateID");
        }

        #endregion

        #region Properties

        /// <summary>
        /// The personal identifier for the address
        /// </summary>
        public long AddressId { get; set; }

        /// <summary>
        /// The first part of the address.
        /// </summary>
        public string Address1 { get; set; }

        /// <summary>
        /// The second part of the address.
        /// </summary>
        public string Address2 { get; set; }

        /// <summary>
        /// The city field for the address.
        /// </summary>
        public string City { get; set; }

        /// <summary>
        /// The state for the address.
        /// </summary>
        public int StateId { get; set; }

        /// <summary>
        /// The zipcode for the address.
        /// </summary>
        public string Zip { get; set; }

        /// <summary>
        /// The latitude value for the address.
        /// </summary>
        public double Latitude { get; set; }

        /// <summary>
        /// The longitude value for the address.
        /// </summary>
        public double Longitude { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the address from a given address id.
        /// </summary>
        /// <param name="addressId">The Id for a specific address</param>
        /// <returns></returns>
        public static Address Get(long addressId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Address_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("AddressID", addressId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Address(reader);
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
        /// Gets a list of cities for a website.
        /// </summary>
        /// <returns></returns>
        public static List<Address> GetCities()
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Address_GetCities";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<Address> listAddress = new List<Address>();

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listAddress.Add(new Address(reader));
                        }
                    }
                }
            }

            return listAddress;
        }

        /// <summary>
        /// Obtains the state for an address from the database/or locally if it already exists
        /// </summary>
        public State GetState()
        {
            if (this.State == null)
            {
                this.State = State.Get(this.StateId);
            };

            return this.State;
        }

        #endregion
    }
}