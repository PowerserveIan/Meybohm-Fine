USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_Showcase_UpdateHistoricalStatData]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zfloyd
-- Create date: 11-28-2012
-- =============================================
CREATE PROCEDURE [dbo].[CUSTOM_Showcase_UpdateHistoricalStatData]
	@CurrentDate datetime = NULL
AS
BEGIN
	IF (@CurrentDate IS NULL)
	BEGIN
		SET @CurrentDate = (SELECT cast(convert(varchar,GETDATE(),110) as datetime))
	END	
	
	INSERT INTO ShowcaseItemMetricHistorical (ShowcaseItemID, ClickTypeID, Date, TotalCount)
	SELECT ShowcaseItemID, ClickTypeID, @CurrentDate, COUNT(*)
	FROM ShowcaseItemMetric
	WHERE cast(convert(varchar,[Date],110) as datetime) = @CurrentDate
		AND NOT EXISTS (SELECT 1 FROM ShowcaseItemMetricHistorical simh WHERE simh.ShowcaseItemID = ShowcaseItemMetric.ShowcaseItemID AND simh.[Date] = @CurrentDate)
	GROUP BY ShowcaseItemID, ClickTypeID
	
	--To allow for it to update multiple times in one day
	UPDATE ShowcaseItemMetricHistorical SET TotalCount = (SELECT COUNT(*) FROM ShowcaseItemMetric sim WHERE sim.ShowcaseItemID = simh.ShowcaseItemID AND sim.ClickTypeID = simh.ClickTypeID AND cast(convert(varchar,sim.[Date],110) as datetime) = @CurrentDate)
	FROM ShowcaseItemMetricHistorical simh
	WHERE simh.[Date] = @CurrentDate
END
GO
