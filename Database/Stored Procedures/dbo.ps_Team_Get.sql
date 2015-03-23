/*
 * ps_Team_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Team_Get]
	@TeamID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Team
	WHERE TeamID = @TeamID

END