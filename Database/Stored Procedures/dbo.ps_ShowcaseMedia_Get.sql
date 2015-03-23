/*
 * ps_ShowcaseMedia_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseMedia_Get]
	@ShowcaseMediaID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM ShowcaseMedia
	WHERE ShowcaseMediaID = @ShowcaseMediaID

END