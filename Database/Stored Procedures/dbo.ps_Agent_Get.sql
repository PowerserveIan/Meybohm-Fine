/*
 * ps_Agent_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Agent_Get]
	@AgentID INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [User].[UserID], [User].Email, UserInfo.FirstName, UserInfo.LastName, UserInfo.Website, UserInfo.Biography,
		   UserInfo.HomePhone, UserInfo.CellPhone, UserInfo.Fax, UserInfo.OfficePhone, UserInfo.Photo,
		   JobTitle.Name AS JobTitle, StaffType.Name AS StaffType
	FROM [User]
	INNER JOIN UserInfo ON UserInfo.UserID = [User].UserID
	LEFT JOIN JobTitle ON JobTitle.JobTitleID = UserInfo.JobTitleID
	LEFT JOIN StaffType ON StaffType.StaffTypeID = UserInfo.StaffTypeID
	WHERE [User].UserID = @AgentID

END