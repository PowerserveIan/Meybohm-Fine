USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_GetAllPagesNeedingApproval]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_GetAllPagesNeedingApproval](
	@LanguageID int = NULL
)
AS
BEGIN
	SELECT DISTINCT CMPage.*, CMPageTitle.Title, Languages.CultureName
	FROM CMPage
		LEFT JOIN CMPageTitle ON CMPage.CMPageID = CMPageTitle.CMPageID
		LEFT JOIN Languages ON CMPageTitle.LanguageID = Languages.LanguageID AND (@LanguageID IS NULL OR Languages.LanguageID = @LanguageID)
		LEFT JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
		LEFT JOIN SEOData ON SEOData.PageURL = ('~/' + CASE WHEN CMPage.CMMicrositeID IS NULL THEN '' ELSE CMMicrosite.Name + '/' END + FileName)
			AND SEOData.LanguageID = Languages.LanguageID  AND SEOData.Approved = 'false'
	WHERE CMPage.CMTemplateID IS NOT NULL 
		AND (CMPage.NeedsApproval = 'True' 
			OR CMPage.OriginalCMPageId IS NOT NULL 
			OR CMPage.EditorDeleted IS NOT NULL
			)

	SELECT DISTINCT *
	FROM CMPage
	WHERE OriginalCMPageID IS NOT NULL
END
GO
