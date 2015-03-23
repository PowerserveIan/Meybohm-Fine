/**
 * AgentTestimonial.cs
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

    public class AgentTestimonial
    {
        #region Constructors

        public AgentTestimonial()
        {

        }

        public AgentTestimonial(IDataReader reader)
        {
            this.UserId = Convert.ToInt64(reader.GetOrZero("UserID"));
            this.Testimonial = (string)reader.GetOrNull("Testimonial");
            this.GiverNameAndLocation = (string)reader.GetOrNull("GiverNameAndLocation");
        }

        #endregion

        #region Properties

        public long UserId { get; set; }

        public string Testimonial { get; set; }

        public string GiverNameAndLocation { get; set; }

        #endregion

        #region Methods

        public static List<AgentTestimonial> GetCollection(long userId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_AgentTestimonial_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<AgentTestimonial> listAgentTestimonial = new List<AgentTestimonial>();

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.Parameters.AddWithValue("UserID", userId);
                    command.CommandType = CommandType.StoredProcedure;

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listAgentTestimonial.Add(new AgentTestimonial(reader));
                        }
                    }
                }
            }

            return listAgentTestimonial;
        }

        #endregion
    }
}