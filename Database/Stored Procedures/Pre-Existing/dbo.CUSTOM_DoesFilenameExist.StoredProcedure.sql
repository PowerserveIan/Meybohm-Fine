USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_DoesFilenameExist]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_DoesFilenameExist]
	@PageName varchar(255),
	@Microsite varchar(50) = NULL,
	@SEOLink varchar(250) = NULL
AS
BEGIN
	DECLARE @Exists bit
	SET @Exists = 0
	IF (EXISTS (SELECT 1 FROM SEOData WHERE FriendlyFilename = (CASE WHEN @Microsite IS NULL THEN '' ELSE @Microsite + '/' END + @PageName) AND PageURL = @SEOLink))
	BEGIN
		SELECT CAST(0 as bit)
	END
	ELSE
	BEGIN	
		IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CMPage'))
		BEGIN
			SET @Exists = (SELECT CASE WHEN (COUNT(CMPage.CMPageID) > 0) THEN 'True' ELSE 'False' END
			FROM CMPage
				LEFT JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
			WHERE FileName = @PageName
				AND (@Microsite IS NULL OR CMMicrosite.Name = @Microsite))
		END
		IF (@Exists = 0)
		BEGIN
			SET @Exists = (SELECT CASE WHEN (COUNT(SEODataID) > 0) THEN 'True' ELSE 'False' END
			FROM SEOData
			WHERE FriendlyFilename = (CASE WHEN @Microsite IS NULL THEN '' ELSE @Microsite + '/' END + @PageName)
				AND (@SEOLink IS NULL OR PageURL != @SEOLink))
		END
		
		SELECT CAST(@Exists as bit)
	END
END
GO
