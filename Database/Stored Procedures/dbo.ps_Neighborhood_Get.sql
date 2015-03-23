/*
 * ps_Neighborhood_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Neighborhood_Get]
	@NeighborhoodID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Neighborhood
	WHERE NeighborhoodID = @NeighborhoodID

END