/*
 * ps_Country_GetCollection
 *
 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Country_GetCollection]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM Country
	ORDER BY CountryID

END