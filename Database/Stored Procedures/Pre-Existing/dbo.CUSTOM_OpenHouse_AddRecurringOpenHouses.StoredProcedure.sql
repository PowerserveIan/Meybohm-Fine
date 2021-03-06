USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_OpenHouse_AddRecurringOpenHouses]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_OpenHouse_AddRecurringOpenHouses]
	@DateString varchar(MAX),
	@ShowcaseItemID int
AS
BEGIN
	DECLARE @TempTable TABLE(
		BeginDate datetime,
		EndDate datetime
	)
	
	INSERT INTO @TempTable (BeginDate, EndDate)
	SELECT cast(substring([Value], 0, charindex(',',[Value])) as datetime),
		cast(substring([Value], charindex(',',[Value]) + 1, len([Value])) as datetime)
	FROM UTILfn_Split(@DateString,'|')
	
	INSERT INTO [OpenHouse] (ShowcaseItemID, BeginDate, EndDate)
	SELECT @ShowcaseItemID, temp.BeginDate, temp.EndDate
	FROM @TempTable temp
END
GO
