/*
 * ps_Address_GetCities

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Address_GetCities]
	@StateId INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT City
	FROM [Address]
	INNER JOIN ShowcaseItem ON ShowcaseItem.AddressID = Address.AddressID
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseItem.ShowcaseItemID
	WHERE City IS NOT NULL
	AND City <> ''
	AND 
		( @StateId IS NULL
		OR StateID = @StateId
		OR StateID IN (	SELECT StateID 
						FROM [State]
						WHERE Name IN ('Georgia', 'South Carolina')))
	AND ShowcaseItemFinePropertyInformation.IsFine = 1
	ORDER BY City

END
