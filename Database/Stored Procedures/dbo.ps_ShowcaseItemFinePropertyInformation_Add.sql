/*
 * ps_ShowcaseItemFinePropertyInformation_Add
 *
 * Powerserve 2013
 * Meybohm Fine
 */
 
CREATE PROCEDURE [dbo].[ps_ShowcaseItemFinePropertyInformation_Add]
	@ShowcaseItemId	INT,
	@Description	VARCHAR(6000) = NULL,
	@Features		VARCHAR(2000) = NULL,
	@IsFine			BIT,
	@IsFineFeatured BIT,
	@Tags			VARCHAR(255) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO ShowcaseItemFinePropertyInformation(ShowcaseItemId, Description, Features, IsFine, IsFineFeatured, Tags)
	VALUES (@ShowcaseItemId, @Description, @Features, @IsFine, @IsFineFeatured, @Tags)

	SELECT SCOPE_IDENTITY()
END