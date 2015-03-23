/**
 * ShowcaseItem.cs
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
    /// The showcase item is a Home/Rental/Property for a showcase.
    /// </summary>
    public class ShowcaseItem
    {
        #region Fields

        /// <summary>
        /// The address associated with the showcase item.
        /// </summary>
        private Address Address = null;

        /// <summary>
        /// The neighborhood associated with the showcase item.
        /// </summary>
        private Neighborhood Neighborhood = null;

        /// <summary>
        /// The builder who built the showcase item.
        /// </summary>
        private Builder Builder = null;

        /// <summary>
        /// The agent for the showcase item.
        /// </summary>
        private Agent Agent = null;

        /// <summary>
        /// The office for the showcase item.
        /// </summary>
        private Office Office = null;

        /// <summary>
        /// The Team associated with the showcase item.
        /// </summary>
        private Team Team = null;

        #endregion

        #region Constructors

        /// <summary>
        /// 
        /// </summary>
        public ShowcaseItem()
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reader"></param>
        public ShowcaseItem(IDataReader reader)
        {
            this.ShowcaseItemId = Convert.ToInt64(reader.GetOrNull("ShowcaseItemID"));
            this.ShowcaseId = Convert.ToInt64(reader.GetOrNull("ShowcaseID"));
            this.Title = (string)reader.GetOrNull("Title");
            this.Image = (string)reader.GetOrNull("Image");
            this.Summary = (string)reader.GetOrNull("Summary");
            this.Active = (bool)reader.GetOrNull("Active");
            this.Featured = (bool)reader.GetOrNull("Featured");
            this.MlsId = Convert.ToInt64(reader.GetOrNull("MlsID"));
            this.ListPrice = Convert.ToDouble(reader.GetOrNull("ListPrice"));
            this.DateListed = (DateTime?)reader.GetOrNull("DateListed");
            this.HighSchoolId = (int?)reader.GetOrNull("HighSchoolId");
            this.MiddleSchoolId = (int?)reader.GetOrNull("MiddleSchoolId");
            this.ElementarySchoolId = (int?)reader.GetOrNull("ElementarySchoolId");
            this.Rented = (bool)reader.GetOrNull("Rented");
            this.AvailabilityDate = (DateTime?)reader.GetOrNull("AvailabilityDate");
            this.StatsSentToAgent = (bool)reader.GetOrNull("StatsSentToAgent");
            this.StatsSentToOwner = (bool)reader.GetOrNull("StatsSentToOwner");
            this.EmailAddresses = (string)reader.GetOrNull("EmailAddresses");
            this.Website = (string)reader.GetOrNull("Website");
            this.VirtualTourURL = (string)reader.GetOrNull("VirtualTourURL");
            this.Directions = (string)reader.GetOrNull("Directions");
            this.OpenHouseAgentId = Convert.ToInt64(reader.GetOrNull("OpenHouseAgentId"));
            this.IsFine = (bool)reader.GetOrNull("IsFine");
            this.IsFineFeatured = (bool)reader.GetOrNull("IsFineFeatured");
            this.Description = (string)reader.GetOrNull("Description");
            this.TempOldId = Convert.ToInt64(reader.GetOrNull("TempOldId"));
            this.Bedrooms = Convert.ToInt32(reader.GetOrZero("Bedrooms"));
            this.Baths = Convert.ToInt32(reader.GetOrZero("Baths"));
            this.HalfBaths = Convert.ToInt32(reader.GetOrZero("HalfBaths"));
            this.SquareFeet = Convert.ToInt32(reader.GetOrZero("SquareFeet"));
            this.Features = (string)(reader.GetOrNull("Features"));

            this.AddressId = Convert.ToInt64(reader.GetOrZero("AddressID"));
            this.NeighborhoodId = (int)reader.GetOrZero("NeighborhoodID");
            this.BuilderId = (int)reader.GetOrZero("BuilderID");
            this.AgentId = Convert.ToInt64(reader.GetOrZero("AgentID"));
            this.OfficeId = (int)reader.GetOrZero("OfficeID");
            this.TeamId = (int)reader.GetOrZero("TeamID");
            
        }

        #endregion

        #region Properties

        /// <summary>
        /// The showcase item (property) Id.
        /// </summary>
        public long ShowcaseItemId { get; set; }

        /// <summary>
        /// The showcase Id.
        /// </summary>
        public long ShowcaseId {get; set; }

        /// <summary>
        /// 
        /// </summary>
        public long AddressId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int NeighborhoodId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int BuilderId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int OfficeId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public long AgentId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int TeamId { get; set; }

        /// <summary>
        /// The expanded title of the showcase item.
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// The Image URL of the property to be displayed (thumbnail/feature display)
        /// </summary>
        public string Image { get; set; }

        /// <summary>
        /// The summar of the showcase Item.
        /// </summary>
        public string Summary { get; set; }

        /// <summary>
        /// Determines whether or not the showcase item is active.
        /// </summary>
        public bool? Active { get; set; }

        /// <summary>
        /// Determines whether or not the showcase item is featured.
        /// </summary>
        public bool Featured { get; set; }

        /// <summary>
        /// The MLSID of the showcase item.
        /// </summary>
        public long MlsId { get; set; }

        /// <summary>
        /// The price of the ShowcaseItem.
        /// </summary>
        public double ListPrice { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? DateListed { get; set; }

        /// <summary>
        /// The high school this property is associated with.
        /// </summary>
        public int? HighSchoolId { get; set; }

        /// <summary>
        /// The middle school this property is associated with.
        /// </summary>
        public int? MiddleSchoolId { get; set; }

        /// <summary>
        /// The elementary school this property is associated with.
        /// </summary>
        public int? ElementarySchoolId { get; set; }

        /// <summary>
        /// Determines whether or not the property is a rental.
        /// </summary>
        public bool Rented { get; set; }

        /// <summary>
        /// The date the property is available.
        /// </summary>
        public DateTime? AvailabilityDate { get; set; }

        /// <summary>
        /// Determines whether or not the stats were sent to the Agent.
        /// </summary>
        public bool StatsSentToAgent { get; set; }

        /// <summary>
        /// Determines whether or not the stats were sent to the owner.
        /// </summary>
        public bool StatsSentToOwner { get; set; }

        /// <summary>
        /// Email address associated with the showcase item.
        /// </summary>
        public string EmailAddresses { get; set; }

        /// <summary>
        /// The website associated with the showcase item.
        /// </summary>
        public string Website { get; set; }

        /// <summary>
        /// The URL to view a virtual tour of the showcase item.
        /// </summary>
        public string VirtualTourURL { get; set; }

        /// <summary>
        /// Directions on how to get to the property.
        /// </summary>
        public string Directions { get; set; }

        /// <summary>
        /// The agent responsible for the Open House.
        /// </summary>
        public long OpenHouseAgentId { get; set; }

        /// <summary>
        /// The previous Id.
        /// </summary>
        public long TempOldId { get; set; }

        /// <summary>
        /// Determines whether or not the property is "Fine" or not.
        /// </summary>
        public bool IsFine { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsFineFeatured { get; set; }

        /// <summary>
        /// The description of the property, used by "Fine" Properties only.
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// The amount of bedrooms in the showcase item.
        /// </summary>
        public int Bedrooms { get; set; }

        /// <summary>
        /// The amount of baths in the showcase item.
        /// </summary>
        public int Baths { get; set; }

        /// <summary>
        /// The amount of halfbaths in the showcase item.
        /// </summary>
        public int HalfBaths { get; set; }

        /// <summary>
        /// The square footage of the showcase item.
        /// </summary>
        public int SquareFeet { get; set; }

        /// <summary>
        /// The list of features for a property.
        /// </summary>
        public string Features { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Gets the showcase item from a showcase Id
        /// </summary>
        /// <param name="showcaseItemId">The Id of the Showcase Item (Property)</param>
        /// <returns></returns>
        public static ShowcaseItem Get(long mlsId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseItem_Get";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("MLSId", mlsId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new ShowcaseItem(reader);
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
        /// Obtains the address for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Address GetAddress()
        {
            if (this.Address == null)
            {
                this.Address = Address.Get(this.AddressId);
            };

            return this.Address;
        }

        /// <summary>
        /// Obtains the agent for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Agent GetAgent()
        {
            if (this.Agent == null)
            {
                this.Agent = Agent.Get(this.AgentId);
            };

            return this.Agent;
        }

        /// <summary>
        /// Obtains the team for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Builder GetBuilder()
        {
            if (this.Builder == null)
            {
                this.Builder = Builder.Get(this.BuilderId);
            };

            return this.Builder;
        }

        /// <summary>
        /// Obtains the neighborhood for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Neighborhood GetNeighborhood()
        {
            if (this.Neighborhood == null)
            {
                this.Neighborhood = Neighborhood.Get(this.NeighborhoodId);
            };

            return this.Neighborhood;
        }

        /// <summary>
        /// Obtains the office for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Office GetOffice()
        {
            if (this.Office == null)
            {
                this.Office = Office.Get(this.NeighborhoodId);
            };

            return this.Office;
        }

        /// <summary>
        /// Obtains the team for a showcase item from the database/or locally if it already exists
        /// </summary>
        public Team GetTeam()
        {
            if (this.Team == null)
            {
                this.Team = Team.Get(this.TeamId);
            };

            return this.Team;
        }

        /// <summary>
        /// Gets a showcase item from the MlsId (received from the third party)
        /// </summary>
        /// <param name="mlsId">The Id associated with the third party listing identifier</param>
        /// <returns></returns>
        public static ShowcaseItem GetByMLSID(long mlsId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseItem_GetByMLSID";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("MLSID", mlsId);

                    // Open the connection, read the data (if any), and return the object.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new ShowcaseItem(reader);
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
        /// Gets all the showcase items sorted ASC or DESC and only fine featured or not.
        /// </summary>
        /// <param name="sortDirection"></param>
        /// <param name="onlyFineFeatured"></param>
        /// <returns></returns>
        public static PagedList<ShowcaseItem> GetCollection(int sortDirection, bool? onlyFineFeatured)
        {
            return ShowcaseItem.GetCollection(null, null, null, null, null, null, null, null, null, null, sortDirection, onlyFineFeatured, null, null, null);
        }

        /// <summary>
        /// Gets all the showcaseitems by pageSize and page
        /// </summary>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public static PagedList<ShowcaseItem> GetCollection(long page, long pageSize)
        {
            return ShowcaseItem.GetCollection(null, null, null, null, null, null, null, null, null, "price", -1, null, page, pageSize, null);
        }

        /// <summary>
        /// Gets all showcase items for a search/quick search procedure for fine properties
        /// </summary>
        /// <param name="stateId">The Id of the state to filter.</param>
        /// <param name="city">The name of the city to filter.</param>
        /// <param name="listPriceMin">The minimum price for the showcase item.</param>
        /// <param name="listPriceMax">The maximum price for the showcase item.</param>
        /// <param name="bedsMin">The minimum amount of bedrooms for the property</param>
        /// <param name="bedsMax">The maximum amount of bedrooms for the property</param>
        /// <param name="bathsMin">The minimum amount of full baths for the property</param>
        /// <param name="bathsMax">The maximum amount of full baths for the property</param>
        /// <param name="genericFilter">Generic filter for the "MLS, Keyword, City, State" filter.</param>
        /// <param name="sortBy">The name of the field to sort by, defaults to List Price</param>
        /// <param name="sortDirection">1 is ASC, -1 is DESC</param>
        /// <param name="onlyFineFeatured">Determines whether or not to pull only fine properties.</param>
        /// <returns></returns>
        public static PagedList<ShowcaseItem> GetCollection( int? stateId, string city, double? listPriceMin, double? listPriceMax, int? bedsMin, 
                                                        int? bedsMax, int? bathsMin, int? bathsMax, string genericFilter, string sortBy, int sortDirection, bool? onlyFineFeatured,
                                                        long? page, long? pageSize, string[] showcaseItemTags)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseItem_GetCollection";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<ShowcaseItem> listShowcaseItem = new List<ShowcaseItem>();
            long recordTotal;
            long pageTotal;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("StateID", stateId);
                    command.Parameters.AddWithValue("City", city);
                    command.Parameters.AddWithValue("ListPriceMin", listPriceMin);
                    command.Parameters.AddWithValue("ListPriceMax", listPriceMax);
                    command.Parameters.AddWithValue("BedsMin", bedsMin);
                    command.Parameters.AddWithValue("BedsMax", bedsMax);
                    command.Parameters.AddWithValue("BathsMin", bathsMin);
                    command.Parameters.AddWithValue("BathsMax", bathsMax);
                    command.Parameters.AddWithValue("GenericFilter", genericFilter);
                    command.Parameters.AddWithValue("SortBy", sortBy);
                    command.Parameters.AddWithValue("SortDirection", sortDirection);
                    command.Parameters.AddWithValue("OnlyFineFeatured", onlyFineFeatured);
                    command.Parameters.AddWithValue("ShowcaseItemTags", showcaseItemTags != null ? String.Join(",", showcaseItemTags) : null);
                    command.Parameters.AddWithValue("Page", page);
                    command.Parameters.AddWithValue("PageSize", pageSize);
                    command.Parameters.Add("RecordTotal", SqlDbType.Int).Direction = ParameterDirection.Output;
                    command.Parameters.Add("PageTotal", SqlDbType.Int).Direction = ParameterDirection.Output;

                    // Open the connection, read the data (if any), and populate the list.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listShowcaseItem.Add(new ShowcaseItem(reader));
                        }
                    }

                    recordTotal = Convert.ToInt64(command.Parameters["RecordTotal"].Value);
                    pageTotal = Convert.ToInt64(command.Parameters["PageTotal"].Value);

                    page = page ?? 0;
                    pageSize = pageSize ?? 0;
                }
            }

            return new PagedList<ShowcaseItem>(listShowcaseItem, page.Value, pageSize.Value, recordTotal, pageTotal);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="agentId"></param>
        /// <returns></returns>
        public static List<ShowcaseItem> GetCollectionByAgent(long agentId)
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_ShowcaseItem_GetCollectionByAgent";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            List<ShowcaseItem> listShowcaseItem = new List<ShowcaseItem>();
            
            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("AgentId", agentId);
                    
                    // Open the connection, read the data (if any), and populate the list.
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listShowcaseItem.Add(new ShowcaseItem(reader));
                        }
                    }
                }
            }

            return listShowcaseItem;
        }

        /// <summary>
        /// Returns the description but at only a certain amount of words.
        /// </summary>
        /// <param name="maxWords"></param>
        /// <returns></returns>
        public string ShortDescription(int maxWords)
        {
            int wordCounter = 0;
            int stringIndex = 0;
            char[] delimiters = new[] { '\n', ' ', ',', '.' };

            if (string.IsNullOrEmpty(this.Description))
            {
                return this.Description;
            }

            while (wordCounter < maxWords)
            {
                stringIndex = this.Description.IndexOfAny(delimiters, stringIndex + 1);
                if (stringIndex == -1)
                    return this.Description;

                ++wordCounter;
            }

            return this.Description.Substring(0, stringIndex) + "...";
        }

        #endregion
    }
}