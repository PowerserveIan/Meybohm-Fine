USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_CMPageGetByCMFileNameAndLanguageID]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_CMPageGetByCMFileNameAndLanguageID](
	@FileName varchar(255),
	@LanguageID int
)
AS
BEGIN
	SELECT CMPage.*,CMPageTitle.Title  
	FROM CMPage
		LEFT JOIN CMPageTitle ON CMPage.CMPageID = CMPageTitle.CMPageID
	WHERE CMPage.FileName = @FileName
		AND CMPageTitle.LanguageID = @LanguageID
END
GO
