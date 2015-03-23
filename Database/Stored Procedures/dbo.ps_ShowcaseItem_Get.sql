/*
 * ps_ShowcaseItem_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseItem_Get]
	@MLSId	INT
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

	SELECT	
			ShowcaseItem.*,
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
	LEFT JOIN #ShowcaseAttributeBedrooms	ON #ShowcaseAttributeBedrooms.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeBaths		ON #ShowcaseAttributeBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeHalfBaths	ON #ShowcaseAttributeHalfBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeSquareFeet	ON #ShowcaseAttributeSquareFeet.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	WHERE ShowcaseItem.MLSId = @MLSId
	AND ShowcaseItemFinePropertyInformation.IsFine = 1

	DROP TABLE #ShowcaseAttributeBedrooms
	DROP TABLE #ShowcaseAttributeBaths
	DROP TABLE #ShowcaseAttributeHalfBaths
	DROP TABLE #ShowcaseAttributeSquareFeet
END