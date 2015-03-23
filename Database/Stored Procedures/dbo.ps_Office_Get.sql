/*
 * ps_Office_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Office_Get]
	@OfficeID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Office
	WHERE OfficeID = @OfficeID

END