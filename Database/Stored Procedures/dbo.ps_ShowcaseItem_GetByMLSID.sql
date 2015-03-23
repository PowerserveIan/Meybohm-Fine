/*
 * ps_ps_ShowcaseItem_GetByMLSID

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseItem_GetByMLSID]
	@MLSID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	ShowcaseItem.*,
			ShowcaseItemFinePropertyInformation.Description,
			ShowcaseItemFinePropertyInformation.Features,
			ShowcaseItemFinePropertyInformation.Tags,
			ShowcaseItemFinePropertyInformation.IsFine,
			ShowcaseItemFinePropertyInformation.IsFineFeatured
	FROM ShowcaseItem
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseItem.ShowcaseItemID
	WHERE ShowcaseItem.MLSID = @MLSID
	AND ShowcaseItemFinePropertyInformation.IsFine = 1

END