/*
 * ps_Address_Get

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Address_Get]
	@AddressID	INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM Address
	WHERE AddressID = @AddressID

END