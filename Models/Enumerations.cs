/**
 * Enumerations.cs
 * Copyright (c) Powerserve 2013. All rights reserved.
 * */

namespace FineWebsite.Models
{
    #region Contact Enumerations

    /// <summary>
    /// The methods of contact for a user.
    /// </summary>
    public enum ContactMethod
    {
        WorkPhone = 1,
        HomePhone = 2,
        CellPhone = 3,
        Email = 4
    }

    /// <summary>
    /// The contact statuses.
    /// </summary>
    public enum ContactStatus
    {
        Unread = 1,
        Read = 2,
        Answered = 3
    }

    /// <summary>
    /// The contact times.
    /// </summary>
    public enum ContactTime
    {
        Morning = 1,
        Afternoon = 2,
        Evening = 3,
        AnyTime = 4
    }

    /// <summary>
    /// The types of contact.
    /// </summary>
    public enum ContactType
    {
        ContactUs = 1,
        HomeValuationRequest = 2,
        MaintenanceRequest = 3,
        PropertyInformation = 4,
        Agent = 5
    }

    #endregion
}