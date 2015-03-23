/**
 * Contact.cs
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
    /// A contact form is the information received when a user sends a Contact Request from the "Contact Us" page.
    /// </summary>
    public class Contact
    {
        #region Constructors

        /// <summary>
        /// Initializes a blank contact form.
        /// </summary>
        public Contact()
        {

        }

        /// <summary>
        /// Reads a contact form entry from the database.
        /// Should not be used yet.
        /// </summary>
        /// <param name="reader"></param>
        public Contact(IDataAdapter reader)
        {
            throw new NotImplementedException();
        }

        #endregion

        #region Properties

        /// <summary>
        /// The contact form Id.
        /// </summary>
        public long? ContactId { get; set; }

        /// <summary>
        /// The type of contact.
        /// </summary>
        public ContactType ContactType { get; set; }

        /// <summary>
        /// The contact status Id.
        /// </summary>
        public ContactStatus ContactStatus { get; set; }

        /// <summary>
        /// The time of contacting the requester.
        /// </summary>
        public ContactTime ContactTime { get; set; }

        /// <summary>
        /// The best way to contact the requester.
        /// </summary>
        public ContactMethod ContactMethod { get; set; }

        /// <summary>
        /// The address of the showcase item.
        /// </summary>
        public long? AddressId { get; set; }

        /// <summary>
        /// The Agent being contacted.
        /// </summary>
        public long? AgentId { get; set; }

        /// <summary>
        /// The team being contacted.
        /// </summary>
        public long? TeamId { get; set; }

        /// <summary>
        /// The showcase item being contacted.
        /// </summary>
        public long? ShowcaseItemId { get; set; }

        /// <summary>
        /// The first name of the requester.
        /// </summary>
        public string FirstName { get; set; }

        /// <summary>
        /// The last name of the requester.
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// The phone number of the requester.
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// The Email of the requester.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// The message to be read by the administration.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// The date the contact form was created.
        /// </summary>
        public DateTime Created { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Adds a new Contact Form Entry.
        /// </summary>
        private void Add()
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Contact_Add";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("ContactTypeID", this.ContactType);
                    command.Parameters.AddWithValue("ContactStatusID", this.ContactStatus);
                    command.Parameters.AddWithValue("ContactTimeID", this.ContactTime);
                    command.Parameters.AddWithValue("ContactMethodID", this.ContactMethod);
                    command.Parameters.AddWithValue("AddressID", this.AddressId);
                    command.Parameters.AddWithValue("AgentID", this.AgentId);
                    command.Parameters.AddWithValue("TeamID", this.TeamId);
                    command.Parameters.AddWithValue("ShowcaseItemID", this.ShowcaseItemId);
                    command.Parameters.AddWithValue("FirstName", this.FirstName);
                    command.Parameters.AddWithValue("LastName", this.LastName);
                    command.Parameters.AddWithValue("Phone", this.Phone);
                    command.Parameters.AddWithValue("Email", this.Email);
                    command.Parameters.AddWithValue("Message", this.Message);
                    command.Parameters.AddWithValue("Created", this.Created);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Saves a new contact form entry.
        /// </summary>
        public void Save()
        {
            if (!this.ContactId.HasValue)
            {
                this.Add();
            }
            else
            {
                this.Update();
            }
        }

        /// <summary>
        /// Updates an existing contact form entry.
        /// </summary>
        private void Update()
        {
            // Initialize SP and list parameters.
            var cmdText = "ps_Contact_Update";
            var connectionString = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

            // Set up connection/command.
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand(cmdText, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("ContactID", this.ContactId);
                    command.Parameters.AddWithValue("ContactTypeID", this.ContactType);
                    command.Parameters.AddWithValue("ContactStatusID", this.ContactStatus);
                    command.Parameters.AddWithValue("ContactTimeID", this.ContactTime);
                    command.Parameters.AddWithValue("ContactMethodID", this.ContactMethod);
                    command.Parameters.AddWithValue("AddressID", this.AddressId);
                    command.Parameters.AddWithValue("AgentID", this.AgentId);
                    command.Parameters.AddWithValue("TeamID", this.TeamId);
                    command.Parameters.AddWithValue("ShowcaseItemID", this.ShowcaseItemId);
                    command.Parameters.AddWithValue("FirstName", this.FirstName);
                    command.Parameters.AddWithValue("LastName", this.LastName);
                    command.Parameters.AddWithValue("Phone", this.Phone);
                    command.Parameters.AddWithValue("Email", this.Email);
                    command.Parameters.AddWithValue("Message", this.Message);
                    command.Parameters.AddWithValue("Created", this.Created);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        #endregion
    }
}