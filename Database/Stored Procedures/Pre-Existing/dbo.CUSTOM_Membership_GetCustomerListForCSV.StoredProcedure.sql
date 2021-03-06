USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_Membership_GetCustomerListForCSV]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zfloyd
-- Create date: 11-12-2012
-- =============================================
CREATE PROCEDURE [dbo].[CUSTOM_Membership_GetCustomerListForCSV]
AS
BEGIN
	SELECT [User].UserID, [User].Name, [User].Email, [User].Created, UserInfo.FirstName, UserInfo.LastName, UserInfo.HomePhone, 
		[Address].Address1, [Address].Address2, [Address].City, (SELECT [State].Name FROM [State] WHERE [State].StateID = [Address].StateID) as 'State', [Address].Zip,
		(SELECT CMMicrosite.Name FROM CMMicrosite WHERE CMMicrosite.CMMicrositeID = UserInfo.PreferredCMMicrositeID) as 'Preferred Market',
		(SELECT Languages.Culture FROM Languages WHERE Languages.LanguageID = UserInfo.PreferredLanguageID) as 'Preferred Language'
	FROM [User]
		INNER JOIN UserInfo ON [User].UserID = UserInfo.UserID
		LEFT JOIN [Address] ON UserInfo.AddressID = [Address].AddressID
	WHERE NOT EXISTS (SELECT 1 FROM UserRole WHERE UserRole.UserID = [User].UserID)
		AND [User].Deleted = 0
END
GO
