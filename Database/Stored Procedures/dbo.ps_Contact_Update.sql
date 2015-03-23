/*
 * ps_Contact_Update

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Contact_Update]
	@ContactID INT,
	@ContactTypeID INT,
	@ContactStatusID INT,
	@ContactTimeID INT,
	@ContactMethodID INT,
	@AddressID INT = NULL,
	@AgentID INT = NULL,
	@TeamID INT = NULL,
	@ShowcaseItemID INT = NULL,
	@FirstName VARCHAR(255),
	@LastName VARCHAR(255),
	@Phone VARCHAR(255),
	@Email VARCHAR(382),
	@Message VARCHAR(1000),
	@Created DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Contact
	SET ContactTypeID = @ContactTypeID, 
		ContactStatusID = @ContactStatusID, 
		ContactTimeID = @ContactTimeID, 
		ContactMethodID = @ContactMethodID, 
		AddressID = @AddressID, 
		AgentID = @AgentID, 
		TeamID = @TeamID, 
		ShowcaseItemID = @ShowcaseItemID, 
		FirstName = @FirstName, 
		LastName = @LastName, 
		Phone = @Phone, 
		Email = @Email, 
		Message = @Message, 
		Created = @Created
	WHERE ContactID = @ContactID
END