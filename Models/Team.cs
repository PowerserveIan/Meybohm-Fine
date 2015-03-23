/**
 * Builder.cs
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
    /// The team associated with a showcase item.
    /// </summary>
    public class Team
    {
        #region Constructors

        public Team()
        {

        }

        public Team(IDataReader reader)
        {
            this.TeamId = Convert.ToInt64(reader.GetOrNull("TeamID"));
            this.CMMicrositeId = Convert.ToInt64(reader.GetOrNull("CMMicrositeID"));
            this.Name = (string)reader.GetOrNull("Name");
            this.MlsId = (string)reader.GetOrNull("MlsId");
            this.Photo = (string)reader.GetOrNull("Photo");
            this.Email = (string)reader.GetOrNull("Email");
            this.DisplayInDirectory = (bool)reader.GetOrNull("DisplayInDirectory");
            this.Phone = (string)reader.GetOrNull("Phone");
        }

        #endregion

        #region Properties

        /// <summary>
        /// The id of the team.
        /// </summary>
        public long TeamId { get; set; }

        /// <summary>
        /// The Id fo the CMMicrosite.
        /// </summary>
        public long CMMicrositeId { get; set; }

        /// <summary>
        /// The Name of the team.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The MLSID of the Team.
        /// </summary>
        public string MlsId { get; set; }

        /// <summary>
        /// The Url/Image associated with the team.
        /// </summary>
        public string Photo { get; set; }

        /// <summary>
        /// The email associated with the team.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Whether or not the team is displayed in the directory.
        /// </summary>
        public bool DisplayInDirectory { get; set; }

        /// <summary>
        /// The phone number of the team.
        /// </summary>
        public string Phone { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the team from the Id.
        /// </summary>
        /// <param name="teamId">The Id of the team.</param>
        /// <returns></returns>
        public static Team Get(int teamId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Team_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("TeamID", teamId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Team(reader);
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
            }
        }

        #endregion
    }
}