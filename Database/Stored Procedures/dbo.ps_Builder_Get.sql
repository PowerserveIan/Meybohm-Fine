/*
 * ps_Builder_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Builder_Get]
	@BuilderID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Builder
	WHERE BuilderID = @BuilderID

END