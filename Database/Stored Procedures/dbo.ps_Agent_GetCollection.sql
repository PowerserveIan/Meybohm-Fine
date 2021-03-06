

/*
 * ps_Agent_GetCollection

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Agent_GetCollection]
	@Name			NVARCHAR(255)	= NULL,
	@Page			INT				= 1,
	@PageSize		INT				= 8,
	@RecordTotal	INT				= NULL OUTPUT,
	@PageTotal		INT				= NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	-- Calculate the starting row and ending row.
	DECLARE @StartRow INT 
	set @StartRow = (@Page - 1) * @PageSize + 1
	DECLARE @EndRow  INT
	set @EndRow = @StartRow + @PageSize - 1
	
	SET @RecordTotal = 0
	SET @PageTotal	 = 0

	SELECT ROW_NUMBER() OVER ( ORDER BY UserInfo.LastName, UserInfo.FirstName
								) AS RowNumber,
		   [User].[UserID], [User].Email, UserInfo.FirstName, UserInfo.LastName, UserInfo.Website, UserInfo.Biography,
		   UserInfo.HomePhone, UserInfo.CellPhone, UserInfo.Fax, UserInfo.OfficePhone, UserInfo.Photo,
		   JobTitle.Name AS JobTitle, StaffType.Name AS StaffType
	INTO #AgentCollection
	FROM [User]
	INNER JOIN UserInfo ON UserInfo.UserID = [User].UserID
	LEFT JOIN UserTeam On UserTeam.UserID = [User].UserID
	LEFT JOIN Team ON Team.TeamID = UserTeam.TeamID
	LEFT JOIN ShowcaseItem ON ShowcaseItem.AgentID = [User].UserID OR ShowcaseItem.TeamId = Team.TeamID
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseItem.ShowcaseItemID
	LEFT JOIN JobTitle ON JobTitle.JobTitleID = UserInfo.JobTitleID
	LEFT JOIN StaffType ON StaffType.StaffTypeID = UserInfo.StaffTypeID
	LEFT JOIN SoldHome ON SoldHome.ShowcaseItemID = ShowcaseItem.ShowcaseItemID
	WHERE 
		ShowcaseItemFinePropertyInformation.IsFine = 1 AND
		(@Name IS NULL OR @Name = '' OR LOWER(UserInfo.FirstName + ' ' + UserInfo.LastName) LIKE '%' + LOWER(@Name) + '%') AND
		StaffType.Name = 'REALTOR®' AND
		ShowcaseItem.Active = 1 AND
		SoldHome.SoldHomeId IS NULL
	GROUP BY
		[User].[UserID], [User].Email, UserInfo.FirstName, UserInfo.LastName, UserInfo.Website, UserInfo.Biography,
		UserInfo.HomePhone, UserInfo.CellPhone, UserInfo.Fax, UserInfo.OfficePhone, UserInfo.Photo,
		JobTitle.Name, StaffType.Name

	-- Calculate the total number of records and pages.
	SELECT @RecordTotal = COUNT(1) 
	FROM #AgentCollection
	
	SET @PageTotal = CEILING(@RecordTotal / CONVERT(REAL, @PageSize))
	
	SELECT *
	FROM #AgentCollection
	WHERE 
		(@StartRow IS NULL AND @EndRow IS NULL) 
		OR #AgentCollection.RowNumber BETWEEN @StartRow AND @EndRow

	DROP TABLE #AgentCollection
END