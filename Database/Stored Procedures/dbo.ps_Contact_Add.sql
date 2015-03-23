/*
 * ps_Contact_Add

 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_Contact_Add]
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

	INSERT INTO Contact(ContactTypeID, ContactStatusID, ContactTimeID, ContactMethodID, AddressID, AgentID, TeamID, ShowcaseItemID, 
						FirstName, LastName, Phone, Email, Message, Created)
				VALUES( @ContactTypeID, @ContactStatusID, @ContactTimeID, @ContactMethodID, @AddressID, @AgentID, @TeamID, @ShowcaseItemID, 
						@FirstName, @LastName, @Phone, @Email, @Message, @Created)

END