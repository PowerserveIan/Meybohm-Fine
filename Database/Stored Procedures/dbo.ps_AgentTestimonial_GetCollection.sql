/*
 * ps_AgentTestimonial_GetCollection

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_AgentTestimonial_GetCollection]
	@UserID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * 
	FROM UserTestimonial
	WHERE UserID = @UserID

END