USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_CreatePageForMicrosite]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_CreatePageForMicrosite](
	@CMPageID int,
	@Update bit
)
AS
BEGIN
	IF @Update = 'false'
	BEGIN
		INSERT INTO CMPage (CMTemplateID, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete, CMMicrositeID, MicrositeDefault)
		SELECT CMTemplateID, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete, CMMicrosite.CMMicrositeID, 'false'
		FROM CMPage, CMMicrosite
		WHERE CMPageID = @CMPageID
		
		INSERT INTO CMPageTitle (CMPageID, Title, LanguageID)
		SELECT micrositePage.CMPageID, CMPageTitle.Title, LanguageID
		FROM CMPage defaultCMPage
			INNER JOIN CMPage micrositePage ON defaultCMPage.FileName = micrositePage.FileName AND micrositePage.CMMicrositeID IS NOT NULL
			INNER JOIN CMPageTitle ON defaultCMPage.CMPageID = CMPageTitle.CMPageID
		WHERE defaultCMPage.CMPageID = @CMPageID

		--Also insert into SEO
		INSERT INTO SEOData (PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
		SELECT '~/' + REPLACE(CMMicrosite.Name, ' ', '-') + '/' + FileName, 
			splDefault.Title, splDefault.Description, splDefault.Keywords, 
			splDefault.DateCreated, splDefault.DateLastUpdated
		FROM CMPage
			INNER JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
			INNER JOIN SEOData splDefault ON '~/' + CMPage.FileName = splDefault.PageURL
		WHERE CMPageID = @CMPageID

	END
	ELSE
	BEGIN
		UPDATE CMPage
		SET CMPage.Title = cmpDefault.Title, CMPage.Deleted = cmpDefault.Deleted, CMPage.FormRecipient = cmpDefault.FormRecipient, CMPage.ResponsePageId = cmpDefault.ResponsePageId
		FROM CMMicrosite, CMPage
			INNER JOIN CMPage cmpDefault ON CMPage.FileName = cmpDefault.FileName
		WHERE cmpDefault.CMPageID = @CMPageID  
			AND CMPage.CMPageID != @CMPageID
			AND CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID

		--Also update SEO
		UPDATE seoMicro
		SET seoMicro.Title = seoDefault.Title, seoMicro.Description = seoDefault.Description, seoMicro.Keywords = seoDefault.Keywords,seoMicro.DateLastUpdated = seoDefault.DateLastUpdated
		FROM CMMicrosite
			INNER JOIN CMPage ON CMPageID = @CMPageID
			INNER JOIN SEOData seoDefault ON '~/' + CMPage.FileName = seoDefault.PageURL
			INNER JOIN SEOData seoMicro ON '~/' + REPLACE(CMMicrosite.Name, ' ', '-') + '/' + CMPage.FileName = seoMicro.PageURL
	END
END
GO
