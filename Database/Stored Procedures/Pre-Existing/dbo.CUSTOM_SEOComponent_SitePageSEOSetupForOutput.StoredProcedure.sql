USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_SEOComponent_SitePageSEOSetupForOutput]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_SEOComponent_SitePageSEOSetupForOutput]
	@URLPath varchar(200) = null,
	@QueryItems varchar(300) = null
AS
BEGIN

	SET NOCOUNT ON;

	--Holds the modified url (complete url)
	DECLARE @URLToUse varchar(500)

	--Create the full path to check for the exact match
	IF (LEN(@QueryItems) > 0)
	BEGIN
		SET @URLToUse = @URLPath + '?' + @QueryItems
	END
	ELSE
	BEGIN
		SET @URLToUse = @URLPath
	END

	--Check for an exact match
	IF EXISTS(
		SELECT 
			SEODataID
		FROM SEOData
		WHERE ([PageURL] = @URLToUse AND Approved = 1)
	)
	BEGIN
		SELECT 
			SEOData.*
		FROM SEOData
		WHERE 
			([PageURL] = @URLToUse AND Approved = 1)
	END
	ELSE
		BEGIN
			--Check for a matching filename and that the one querystring item is in passed in querystring list
			IF EXISTS(
				SELECT 
						SEODataID
					FROM SEOData
					WHERE ([PageURL] LIKE @URLPath + '?%')
						AND
						(REPLACE([PageURL], @URLPath + '?', '') in (SELECT Items FROM dbo.Split(@QueryItems,'&')))
						AND Approved = 1
			)
			BEGIN
				SELECT 
					SEOData.*
				FROM SEOData
				WHERE 
					([PageURL] LIKE @URLPath + '?%')
					AND
					(REPLACE([PageURL], @URLPath + '?', '') in (SELECT Items FROM dbo.Split(@QueryItems,'&')))
					AND Approved = 1
			END
			--Now check if someone just put on a dummy query string
			ELSE
			BEGIN
				SELECT 
					SEOData.*
				FROM SEOData
				WHERE 
					([PageURL] LIKE @URLPath
					AND Approved = 1)
			END
		END
END
GO
