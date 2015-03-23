/**
 * Country.cs
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

    public class Country
    {
        #region Constructors

        public Country()
        {

        }

        public Country(IDataReader reader)
        {

        }
        
        #endregion

        #region Properties

        /// <summary>
        /// The Id of the country.
        /// </summary>
        public int CountryId { get; set; }

        /// <summary>
        /// The full name of the country.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The abbreviation of the country.
        /// </summary>
        public string Abb { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the state from the id.
        /// </summary>
        /// <param name="stateId">The state id.</param>
        /// <returns></returns>
        public static List<Country> GetCollection()
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Country_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<Country> listCountry = new List<Country>();

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
                            listCountry.Add(new Country(reader));
                        }
                    }
                }
            }

            return listCountry;
        }

        #endregion
    }
}