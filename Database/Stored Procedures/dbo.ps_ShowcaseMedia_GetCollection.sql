/*
 * ps_ShowcaseMedia_GetCollection

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseMedia_GetCollection]
	@ShowcaseItemID	INT,
	@IsFine			BIT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ShowcaseMedia.*
	FROM ShowcaseMedia
	INNER JOIN ShowcaseMediaCollection ON ShowcaseMediaCollection.ShowcaseMediaCollectionID = ShowcaseMedia.ShowcaseMediaCollectionID
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseMediaCollection.ShowcaseItemID
	WHERE ShowcaseMediaCollection.ShowcaseItemID = @ShowcaseItemID 
	AND (@IsFine IS NULL OR ShowcaseMediaCollection.IsFine = @IsFine) 
	AND ShowcaseItemFinePropertyInformation.IsFine = 1
	ORDER BY ShowcaseMedia.DisplayOrder

END