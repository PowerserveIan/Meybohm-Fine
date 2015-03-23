/*
 * ps_ShowcaseItemFinePropertyInformation_Update
 *
 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseItemFinePropertyInformation_Update]
	@ShowcaseItemFinePropertyInformationId	INT,
	@ShowcaseItemId							INT,
	@Description							VARCHAR(6000) = NULL,
	@Features								VARCHAR(2000) = NULL,
	@IsFine									BIT,
	@IsFineFeatured							BIT,
	@Tags									VARCHAR(255) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE ShowcaseItemFinePropertyInformation
	SET ShowcaseItemId = @ShowcaseItemId, 
		Description = @Description, 
		Features = @Features, 
		IsFine = @IsFine, 
		IsFineFeatured = @IsFineFeatured, 
		Tags = @Tags
	WHERE ShowcaseItemFinePropertyInformationId = @ShowcaseItemFinePropertyInformationId
END