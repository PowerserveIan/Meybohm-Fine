/*
 * ps_ShowcaseItem_GetCollectionByAgent

 * Powerserve 2013
 * Meybohm Fine
 */
CREATE PROCEDURE [dbo].[ps_ShowcaseItem_GetCollectionByAgent]
	@AgentId INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeBedrooms
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Bedrooms'

	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeBaths
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Baths' 
		OR ShowcaseAttribute.Title = 'Full Baths'
	
	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeHalfBaths
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Half Baths'

	SELECT ShowcaseAttributeValue.Value, ShowcaseItemAttributeValue.ShowcaseItemID INTO #ShowcaseAttributeSquareFeet
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Square Feet'

	SELECT DISTINCT	ShowcaseItem.*,
			ShowcaseItemFinePropertyInformation.Description,
			ShowcaseItemFinePropertyInformation.Features,
			ShowcaseItemFinePropertyInformation.Tags,
			ShowcaseItemFinePropertyInformation.IsFine,
			ShowcaseItemFinePropertyInformation.IsFineFeatured,
			#ShowcaseAttributeBedrooms.Value AS Bedrooms,
			#ShowcaseAttributeBaths.Value AS Baths,
			#ShowcaseAttributeHalfBaths.Value AS HalfBaths,
			#ShowcaseAttributeSquareFeet.Value AS SquareFeet
	FROM ShowcaseItem
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseItem.ShowcaseItemID
	LEFT JOIN Team ON Team.TeamId = ShowcaseItem.TeamId
	LEFT JOIN UserTeam On UserTeam.TeamID = ShowcaseItem.TeamID
	LEFT JOIN #ShowcaseAttributeBedrooms ON #ShowcaseAttributeBedrooms.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeBaths ON #ShowcaseAttributeBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeHalfBaths ON #ShowcaseAttributeHalfBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeSquareFeet ON #ShowcaseAttributeSquareFeet.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN SoldHome ON SoldHome.ShowcaseItemID = ShowcaseItem.ShowcaseItemID
	WHERE 
		( 
			ShowcaseItem.AgentID = @AgentId
			OR UserTeam.UserID = @AgentId
		)
	AND ShowcaseItem.Active = 1
	AND ShowcaseItemFinePropertyInformation.IsFine = 1
	AND SoldHome.SoldHomeId IS NULL
	ORDER BY ShowcaseItem.ListPrice DESC

	DROP TABLE #ShowcaseAttributeBedrooms
	DROP TABLE #ShowcaseAttributeBaths
	DROP TABLE #ShowcaseAttributeHalfBaths
	DROP TABLE #ShowcaseAttributeSquareFeet
END