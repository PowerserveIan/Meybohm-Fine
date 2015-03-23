/**
 * Agent.cs
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
    using System.Text.RegularExpressions;

    #endregion

    /// <summary>
    /// The Agent of the showcase item.
    /// Note: Referenced by the "User" table as there is no "Agent" table.
    ///       I.E. "AgentID" actually maps to "UserID" of the User Table.
    /// </summary>
    public class Agent
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

        public Agent()
        {

        }

        public Agent(IDataReader reader)
        {
            this.UserId = Convert.ToInt64(reader.GetOrNull("UserID"));
            this.JobTitle = (string)reader.GetOrNull("JobTitle");
            this.FirstName = (string)reader.GetOrNull("FirstName");
            this.LastName = (string)reader.GetOrNull("LastName");
            this.Email = (string)reader.GetOrNull("Email");
            this.Website = (string)reader.GetOrNull("Website");
            this.HomePhone = (string)reader.GetOrNull("HomePhone");
            this.CellPhone = (string)reader.GetOrNull("CellPhone");
            this.OfficePhone = (string)reader.GetOrNull("OfficePhone");
            this.Fax = (string)reader.GetOrNull("Fax");
            this.Photo = (string)reader.GetOrNull("Photo");
            this.StaffType = (string)reader.GetOrNull("StaffType");
            this.Biography = (string)reader.GetOrNull("Biography");

            if (!string.IsNullOrEmpty(this.HomePhone))
            {
                this.HomePhone = Convert.ToInt64(Regex.Replace(this.HomePhone, "[^0-9]", "")).ToString(@"###\.###\.####");
            }
            if (!string.IsNullOrEmpty(this.CellPhone))
            {
                this.CellPhone = Convert.ToInt64(Regex.Replace(this.CellPhone, "[^0-9]", "")).ToString(@"###\.###\.####");
            }
            if (!string.IsNullOrEmpty(this.OfficePhone))
            {
                this.OfficePhone = Convert.ToInt64(Regex.Replace(this.OfficePhone, "[^0-9]", "")).ToString(@"###\.###\.####");
            }
            if (!string.IsNullOrEmpty(this.Fax))
            {
                this.Fax = Convert.ToInt64(Regex.Replace(this.Fax, "[^0-9]", "")).ToString(@"###\.###\.####");
            }
        }

        #endregion

        #region Properties

        /// <summary>
        /// The user's Id.
        /// </summary>
        public long UserId { get; set; }

        /// <summary>
        /// The Biography of the agent.
        /// </summary>
        public string Biography { get; set; }

        /// <summary>
        /// The Job title of the user.
        /// </summary>
        public string JobTitle { get; set; }

        /// <summary>
        /// The full name of the user.
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// The full email of the user.
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// Whether or not the user is approved for the system.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// The unique email associated with the user.
        /// </summary>
        public string Website { get; set; }

        /// <summary>
        /// The Home Phone number of the agent.
        /// </summary>
        public string HomePhone { get; set; }

        /// <summary>
        /// The Cell Phone number of the agent.
        /// </summary>
        public string CellPhone { get; set; }

        /// <summary>
        /// The Office Phone number of the agent.
        /// </summary>
        public string OfficePhone { get; set; }

        /// <summary>
        /// The Fax of the agent.
        /// </summary>
        public string Fax { get; set; }

        /// <summary>
        /// The photo image of the agent.
        /// </summary>
        public string Photo { get; set; }

        /// <summary>
        /// Returns the image link to be used for HREF's for the URL/Image/Video.
        /// </summary>
        public string PhotoLink
        {
            get
            {
                return this.RootPath + this.UploadFolder + "agents/" + this.Photo;
            }
        }

        /// <summary>
        /// The Staff type of the agent.
        /// </summary>
        public string StaffType { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the agent from the agent Id.
        /// </summary>
        /// <param name="agentId">The agent's identifier.</param>
        /// <returns></returns>
        public static Agent Get(long agentId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Agent_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("AgentID", agentId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Agent(reader);
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
        /// 
        /// </summary>
        /// <returns></returns>
        public static PagedList<Agent> GetCollection(string name, long? page, long? pageSize)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Agent_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<Agent> listAgent = new List<Agent>();
            long recordTotal;
            long pageTotal;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("Name", name);
                    command.Parameters.AddWithValue("Page", page);
                    command.Parameters.AddWithValue("PageSize", pageSize);
                    command.Parameters.Add("RecordTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("PageTotal", SqlDbType.Int).Direction = ParameterDirection.Output;

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listAgent.Add(new Agent(reader));
                        }
                    }

                    recordTotal = Convert.ToInt64(command.Parameters["RecordTotal"].Value);
                    pageTotal = Convert.ToInt64(command.Parameters["PageTotal"].Value);

                    page = page ?? 0;
                    pageSize = pageSize ?? 0;
                }
            }

            return new PagedList<Agent>(listAgent, page.Value, pageSize.Value, recordTotal, pageTotal);
        }

        /// <summary>
        /// Gets the agent from the agent Id.
        /// </summary>
        /// <param name="agentId">The agent's identifier.</param>
        /// <returns></returns>
        public static List<Agent> GetCollectionByTeam(long teamId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Agent_GetCollectionByTeam";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<Agent> listAgent = new List<Agent>();

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("TeamId", teamId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            listAgent.Add(new Agent(reader));
                        }
                    }
                }
            }

            return listAgent;
        }

        #endregion
    }
}