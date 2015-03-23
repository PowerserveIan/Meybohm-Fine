/**
 * State.cs
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
    /// The state associated with an Address.
    /// </summary>
    public class State
    {
        #region Constructors

        /// <summary>
        /// 
        /// </summary>
        public State()
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reader"></param>
        public State(IDataReader reader)
        {
            this.StateId = Convert.ToInt64(reader.GetOrNull("StateID"));
            this.Name = (string)reader.GetOrNull("Name");
            this.Abb = (string)reader.GetOrNull("Abb");
            this.CountryID = (int)reader.GetOrNull("CountryID");
            this.ShipTo = (bool)reader.GetOrNull("ShipTo");
            this.ShippingMarkup = Convert.ToDouble(reader.GetOrNull("ShippingMarkup"));
        }

        #endregion

        #region Properties

        /// <summary>
        /// The state Id.
        /// </summary>
        public long StateId { get; set; }

        /// <summary>
        /// The name of the state.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The abbreviation of the state name, (I.E. GA for Georgia)
        /// </summary>
        public string Abb { get; set; }

        /// <summary>
        /// The id associated with a country.
        /// </summary>
        public int CountryID { get; set; }

        /// <summary>
        /// Whether or not it is possible to ship to this state.
        /// </summary>
        public bool ShipTo { get; set; }

        /// <summary>
        /// The amount it costs to ship to the state.
        /// </summary>
        public double ShippingMarkup { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the state from the id.
        /// </summary>
        /// <param name="stateId">The state id.</param>
        /// <returns></returns>
        public static State Get(int stateId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_State_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("StateID", stateId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new State(reader);
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
        /// Gets the state from the id.
        /// </summary>
        /// <param name="stateId">The state id.</param>
        /// <returns></returns>
        public static List<State> GetCollection()
        {
            return State.GetCollection(null);
        }

        /// <summary>
        /// Gets the state from the id.
        /// </summary>
        /// <param name="stateId">The state id.</param>
        /// <returns></returns>
        public static List<State> GetCollection(int? countryId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_State_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<State> listState = new List<State>();

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("CountryId", countryId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listState.Add(new State(reader));
                        }
                    }
                }
            }

            return listState;
        }

        #endregion
    }
}