USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_CreateCMPageTitlesFromCMPages]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CUSTOM_CMS_CreateCMPageTitlesFromCMPages] (
	@LanguageID int
) AS
BEGIN
	INSERT [CMPageTitle]([CMPageID],[Title],[LanguageID])
	(SELECT [CMPage].[CMPageID],[CMPage].Title,@LanguageID
	FROM [CMPage] 
	WHERE CMTemplateID IS NOT NULL AND CMPageID NOT IN
		(SELECT [CMPageID] 
		FROM [CMPageTitle]
		WHERE [LanguageID] = @LanguageID)
	)
END
GO
