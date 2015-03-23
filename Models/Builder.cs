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
    /// The builder's information.
    /// </summary>
    public class Builder
    {
        #region Constructors

        public Builder()
        {

        }

        public Builder(IDataReader reader)
        {
            this.BuilderId = (long)reader.GetOrNull("OfficeID");
            this.Name = (string)reader.GetOrNull("Name");
            this.OwnerName = (string)reader.GetOrNull("OwnerName");
            this.Image = (string)reader.GetOrNull("Website");
            this.Website = (string)reader.GetOrNull("Name");
            this.Info = (string)reader.GetOrNull("Info");
            this.Active = (bool)reader.GetOrNull("Active");
        }

        #endregion

        #region Properties

        /// <summary>
        /// The builder's Id.
        /// </summary>
        public long BuilderId { get; set; }

        /// <summary>
        /// The builder's full name.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The owner's full name.
        /// </summary>
        public string OwnerName { get; set; }

        /// <summary>
        /// The image url linked to the builder.
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// The website associated with the builder.
        /// </summary>
        public string Website { get; set; }

        /// <summary>
        /// The info related to the builder.
        /// </summary>
        public string Info { get; set; }

        /// <summary>
        /// Whether or not the builder is active.
        /// </summary>
        public bool Active { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the builder associated from the builder Id.
        /// </summary>
        /// <param name="builderId">The builder's Id.</param>
        /// <returns></returns>
        public static Builder Get(int builderId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Builder_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("BuilderID", builderId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Builder(reader);
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