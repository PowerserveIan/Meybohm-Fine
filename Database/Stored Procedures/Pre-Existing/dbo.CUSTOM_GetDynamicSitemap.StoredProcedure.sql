USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_GetDynamicSitemap]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_GetDynamicSitemap]
AS
BEGIN
	DECLARE @Pages table
	(
		URL varchar(255),
		Title varchar(255)
	)
	
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'be_Posts'))
	BEGIN
		INSERT INTO @Pages (URL)
		SELECT '[BLOGROOT]post/' + cast(YEAR(DateCreated) as varchar) + '/' + cast(MONTH(DateCreated) as varchar) + '/'+ cast(DAY(DateCreated) as varchar) + '/' + Slug + '.aspx'
		FROM be_Posts
		WHERE IsPublished = 1
			AND DateCreated <= getdate() AND IsDeleted = 0
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CMPage'))
	BEGIN
		INSERT INTO @Pages (URL)
		SELECT DISTINCT CASE WHEN CMPage.CMMicrositeID IS NULL THEN '' ELSE CMMicrosite.Name + '/' END + FileName
		FROM CMPage
			LEFT JOIN CMMicrosite ON CMPage.CMMicrositeID = CMMicrosite.CMMicrositeID
		WHERE (CMPage.CMMicrositeID IS NULL 
				OR (CMMicrosite.Active = 1
				AND CMMicrosite.Published = 1))
			AND Deleted = 0
			AND NeedsApproval = 0
			AND OriginalCMPageId IS NULL
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Event'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT 'event-details.aspx?id=' + cast(EventID as varchar) + '&title=', Title
		FROM [Event]
		WHERE Active = 1		
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT 'file-library-details.aspx?id=' + cast(FileID as varchar) + '&title=', Name
		FROM [File]
		WHERE Active = 1
	END
	--IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Forums'))
	--BEGIN
		
	--END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'NewsPress'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT 'news-press-details.aspx?Id=' + cast(NewsPressID as varchar) + '&title=', Title
		FROM NewsPress
		WHERE Active = 1
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Newsletter'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT 'newsletter-details.aspx?id=' + cast(NewsletterID as varchar) + '&title=', Title
		FROM Newsletter
		WHERE Active = 1
			AND Deleted = 0
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Product'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT 'product.aspx?ProductID=' + cast(ProductID as varchar) + '&product=', Name
		FROM Product
		WHERE Active = 1
			AND Deleted = 0
	END
	IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Showcase'))
	BEGIN
		INSERT INTO @Pages (URL, Title)
		SELECT CASE WHEN CMMicrositeID = 2 THEN 'augusta/' ELSE 'aiken/' END + 'home-details?id=' + cast(ShowcaseItemID as varchar) + '&title=', ShowcaseItem.Title
		FROM ShowcaseItem
			INNER JOIN Showcase ON ShowcaseItem.ShowcaseID = Showcase.ShowcaseID
		WHERE ShowcaseItem.Active = 1 AND Rented = 0
		
		INSERT INTO @Pages (URL, Title)
		SELECT CASE WHEN CMMicrositeID = 2 THEN 'augusta/' ELSE 'aiken/' END + 'neighborhood-details?id=' + cast(NeighborhoodID as varchar), ''
		FROM Neighborhood
		WHERE Active = 1
	END
	
	SELECT * FROM @Pages
END
GO
