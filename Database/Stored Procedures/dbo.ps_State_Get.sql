/*
 * ps_State_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_State_Get]
	@StateID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [State]
	WHERE StateID = @StateID

END