/*
 * ps_State_GetCollection
 *
 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_State_GetCollection]
	@CountryId	INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM [State]
	WHERE (@CountryId IS NULL OR CountryID = @CountryId)
		  AND Name IN ('Georgia', 'South Carolina')
	ORDER BY CountryID, Name

END