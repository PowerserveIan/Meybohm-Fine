USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_LoadContentRegion]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zfloyd
-- Create date: 2-6-2012
-- =============================================
CREATE PROCEDURE [dbo].[CUSTOM_CMS_LoadContentRegion]
	@FilterCMPageRegionCMPageID varchar(50),
	@FilterCMPageRegionCMRegionID varchar(50),
	@FilterCMPageRegionLanguageID varchar(50) = NULL,
	@FilterCMPageRegionUserID varchar(50) = NULL,
	@FilterCMPageRegionCreated varchar(50) = NULL,
	@FilterCMPageRegionNeedsApproval bit,
	@DefaultLanguageID int
AS
BEGIN
	DECLARE @TempTable TABLE(
		CMPageRegionID int
	)
	
	INSERT INTO @TempTable 
	SELECT CMPageRegionID
	FROM CMPageRegion
	WHERE CMPageID = @FilterCMPageRegionCMPageID
		AND CMRegionID = @FilterCMPageRegionCMRegionID
		AND (@FilterCMPageRegionLanguageID IS NULL OR LanguageID = @FilterCMPageRegionLanguageID)
		AND (@FilterCMPageRegionCreated IS NULL OR DATEADD(ms, -DATEPART(ms, Created), Created) = @FilterCMPageRegionCreated)
		
	IF (@FilterCMPageRegionLanguageID IS NOT NULL AND @FilterCMPageRegionLanguageID != @DefaultLanguageID AND (SELECT COUNT(*) FROM @TempTable) = 0)
	BEGIN
		INSERT INTO @TempTable 
		SELECT CMPageRegionID
		FROM CMPageRegion
		WHERE CMPageID = @FilterCMPageRegionCMPageID
			AND CMRegionID = @FilterCMPageRegionCMRegionID
			AND LanguageID = @DefaultLanguageID
			AND (@FilterCMPageRegionCreated IS NULL OR DATEADD(ms, -DATEPART(ms, Created), Created) = @FilterCMPageRegionCreated)
	END
	
	IF (@FilterCMPageRegionNeedsApproval = 1)
	BEGIN
		--Delete multiple approvals first
		DELETE 
		FROM CMPageRegion 
		WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
			AND NeedsApproval = 1
			AND CMPageRegionID NOT IN 
				(SELECT TOP 1 CMPageRegionID 
				FROM CMPageRegion 
				WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
					AND NeedsApproval = 1
				ORDER BY CMPageRegionId DESC)
	END
	
	IF (@FilterCMPageRegionUserID IS NOT NULL AND 
		(SELECT COUNT(*) 
		FROM CMPageRegion 
		WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
			AND Draft = 1
			AND @FilterCMPageRegionUserID = UserID) > 0)
	BEGIN
		SELECT *
		FROM CMPageRegion 
		WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
			AND Draft = 1
			AND @FilterCMPageRegionUserID = UserID
	END
	ELSE
	BEGIN
		--Make sure that only one region is set as current version
		--UPDATE CMPageRegion SET CurrentVersion = 0
		--WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
		--	AND CurrentVersion = 1
		--	AND CMPageRegionID NOT IN
		--		(SELECT TOP 1 CMPageRegionID
		--		FROM CMPageRegion
		--		WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
		--			AND CurrentVersion = 1
		--		ORDER BY CMPageRegionID DESC)
		
		IF (@FilterCMPageRegionNeedsApproval = 1 AND (
			SELECT COUNT(*) 
			FROM CMPageRegion
			WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
				AND NeedsApproval = 1) > 0)
		BEGIN
			SELECT TOP 1 *
			FROM CMPageRegion 
			WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)
				AND NeedsApproval = 1
		END
		ELSE
		BEGIN
			SELECT TOP 1 *
			FROM CMPageRegion 
			WHERE CMPageRegionID IN (SELECT CMPageRegionID FROM @TempTable t)				
				AND (@FilterCMPageRegionCreated IS NOT NULL OR CurrentVersion = 1)
				AND Draft = 0
		END		
	END	
END
GO
