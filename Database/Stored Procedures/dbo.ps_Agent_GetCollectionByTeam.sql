/*
 * ps_Agent_GetCollectionByTeam

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Agent_GetCollectionByTeam]
	@TeamId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [User].[UserID], [User].Email, UserInfo.FirstName, UserInfo.LastName, UserInfo.Website, UserInfo.Biography,
		   UserInfo.HomePhone, UserInfo.CellPhone, UserInfo.Fax, UserInfo.OfficePhone, UserInfo.Photo,
		   JobTitle.Name AS JobTitle, StaffType.Name AS StaffType
	FROM Team
	INNER JOIN UserTeam ON UserTeam.TeamID = Team.TeamID
	INNER JOIN [User] ON [User].UserID = UserTeam.UserID
	INNER JOIN UserInfo ON UserInfo.UserID = [User].UserID
	LEFT JOIN JobTitle ON JobTitle.JobTitleID = UserInfo.JobTitleID
	LEFT JOIN StaffType ON StaffType.StaffTypeID = UserInfo.StaffTypeID
	WHERE Team.TeamID = @TeamId

END