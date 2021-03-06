USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_PageNeedsApproval]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_PageNeedsApproval](
	@CMPageID int,
	@LanguageID int = NULL
)
AS
BEGIN
	SELECT CAST(CASE WHEN (COUNT(CMPage.CMPageID) > 0) THEN 1 ELSE 0 END as bit)
	FROM CMPage
		LEFT JOIN CMPageTitle ON CMPage.CMPageID = CMPageTitle.CMPageID
		LEFT JOIN Languages ON CMPageTitle.LanguageID = Languages.LanguageID
		LEFT JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
		LEFT JOIN SEOData ON SEOData.PageURL = ('~/' + CASE WHEN CMPage.CMMicrositeID IS NULL THEN '' ELSE CMMicrosite.Name + '/' END + FileName)
			AND SEOData.Approved = 'false'
	WHERE (CMPage.CMPageID = @CMPageID OR CMPage.OriginalCMPageID = @CMPageID)
		AND (CMPage.NeedsApproval = 'True' 
			OR CMPage.OriginalCMPageId IS NOT NULL
			OR CMPage.EditorDeleted IS NOT NULL
			)
		AND (@LanguageID IS NULL OR Languages.LanguageID = @LanguageID OR SEOData.LanguageID = @LanguageID)
END
GO
