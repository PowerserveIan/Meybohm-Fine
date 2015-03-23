/*
 * ps_Address_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseItemFinePropertyInformation_Get]
	@ShowcaseItemID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM ShowcaseItemFinePropertyInformation
	WHERE ShowcaseItemId = @ShowcaseItemID

END