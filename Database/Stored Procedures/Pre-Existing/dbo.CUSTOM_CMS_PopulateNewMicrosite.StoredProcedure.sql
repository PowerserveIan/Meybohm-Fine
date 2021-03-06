USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_PopulateNewMicrosite]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_PopulateNewMicrosite](
	@CMMicrositeID int
)
AS
BEGIN
	INSERT INTO CMPage (CMTemplateID, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete, CMMicrositeID, MicrositeDefault)
	SELECT CMTemplateID, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete, @CMMicrositeID, 0
	FROM CMPage
	WHERE MicrositeDefault = 1
	
	INSERT INTO CMPageTitle (CMPageID, Title, LanguageID)
	SELECT micrositePage.CMPageID, CMPageTitle.Title, LanguageID
	FROM CMPage defaultCMPage
		INNER JOIN CMPage micrositePage ON defaultCMPage.FileName = micrositePage.FileName AND micrositePage.CMMicrositeID = @CMMicrositeID
		INNER JOIN CMPageTitle ON defaultCMPage.CMPageID = CMPageTitle.CMPageID
	WHERE defaultCMPage.MicrositeDefault = 1

	--Also insert into SEO
	INSERT INTO SEOData (PageURL,Title, Description, Keywords, DateCreated, DateLastUpdated)
	SELECT '~/' + REPLACE(CMMicrosite.Name, ' ', '-') + '/' + FileName,
		splDefault.Title, splDefault.Description, splDefault.Keywords, 
		splDefault.DateCreated, splDefault.DateLastUpdated
	FROM CMPage
		INNER JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
		INNER JOIN SEOData splDefault ON '~/' + CMPage.FileName = splDefault.PageURL
	WHERE CMPage.CMMicrositeID = @CMMicrositeID

	--Insert default content
	INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, UserId, ContentClean)
	SELECT cmpMicro.CMPageID, CMRegionID, Content, 1, getdate(), CMPageRegion.UserId, ContentClean
	FROM CMPageRegion
		INNER JOIN CMPage cmpDefault ON CMPageRegion.CMPageID = cmpDefault.CMPageID
		INNER JOIN CMPage cmpMicro ON cmpDefault.FileName = cmpMicro.FileName
	WHERE cmpDefault.MicrositeDefault = 1
		AND cmpMicro.CMMicrositeID = @CMMicrositeID
		AND CMPageRegion.CurrentVersion = 1
END
GO
