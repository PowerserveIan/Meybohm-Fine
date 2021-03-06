USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_RETS_ShowcaseItemAttributeAssign]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_RETS_ShowcaseItemAttributeAssign]
	@Value NVARCHAR(max),
	@MLSAttributeName NVARCHAR(250),
	@ShowcaseItemId int,
	@ShowcaseID int,
	@SplitDelimiter char = Null
AS
BEGIN	
	DECLARE @TempValuesTable TABLE
	(
		PK int identity,
		TempValues varchar(2000)
	)
	
	IF (@SplitDelimiter IS NOT NULL)
	BEGIN
		INSERT INTO @TempValuesTable (TempValues)
		SELECT [Value] FROM UTILfn_Split(@Value,@SplitDelimiter)
		WHERE LTRIM(RTRIM([Value])) != '' AND LTRIM(RTRIM([Value])) != 'None' AND LTRIM(RTRIM([Value])) != 'Other' AND LTRIM(RTRIM([Value])) NOT LIKE 'Other-%'
	END
	ELSE
	BEGIN
		INSERT INTO @TempValuesTable (TempValues)
		SELECT @Value
		WHERE LTRIM(RTRIM(@Value)) != '' AND LTRIM(RTRIM(@Value)) != 'None' AND LTRIM(RTRIM(@Value)) != 'Other' AND LTRIM(RTRIM(@Value)) NOT LIKE 'Other-%'
	END
	
	DECLARE @ShowcaseAttributeID int
	DECLARE @ShowcaseAttributeValueID int
	DECLARE @CurrentValue varchar(2000)
	SET @ShowcaseAttributeID = (SELECT TOP 1 ShowcaseAttributeID 
								FROM ShowcaseAttribute 
								WHERE MLSAttributeName = @MLSAttributeName AND ShowcaseID = @ShowcaseID)

	DECLARE @Counter int
	SET @Counter = 1
	WHILE (@Counter <= (SELECT COUNT(*)  from @TempValuesTable))
	BEGIN
		SET @CurrentValue = (SELECT TempValues FROM @TempValuesTable WHERE PK = @Counter)
		SET @ShowcaseAttributeValueID = (SELECT TOP 1 ShowcaseAttributeValueID 
										FROM ShowcaseAttributeValue 
										WHERE ShowcaseAttributeID = @ShowcaseAttributeID AND Value = @CurrentValue)				
				
		IF (@ShowcaseAttributeValueID IS NULL)
		BEGIN
			INSERT INTO ShowcaseAttributeValue (Value,  ShowcaseAttributeID)
			SELECT @CurrentValue,@ShowcaseAttributeID
			
			SET @ShowcaseAttributeValueID = @@Identity
		END
		
		IF (NOT EXISTS( SELECT 1 
						FROM ShowcaseItemAttributeValue
						WHERE ShowcaseItemID = @ShowcaseItemId AND ShowcaseAttributeValueId = @ShowcaseAttributeValueID))
		BEGIN
			IF (@SplitDelimiter IS NULL)
			BEGIN
				DELETE FROM ShowcaseItemAttributeValue WHERE ShowcaseItemID = @ShowcaseItemId AND ShowcaseAttributeValueID IN (SELECT ShowcaseAttributeValueID FROM ShowcaseAttributeValue WHERE ShowcaseAttributeID = @ShowcaseAttributeID) 
			END
			
			INSERT INTO ShowcaseItemAttributeValue (ShowcaseItemID, ShowcaseAttributeValueID)
			SELECT @ShowcaseItemId, @ShowcaseAttributeValueID
		END

		SET @Counter = @Counter+1
	END
	
	--Delete old values	
	DELETE FROM ShowcaseItemAttributeValue
	WHERE ShowcaseItemID = @ShowcaseItemId
		AND EXISTS (SELECT 1 FROM ShowcaseAttributeValue sav 
						WHERE ShowcaseAttributeID = @ShowcaseAttributeID 
							AND sav.ShowcaseAttributeValueID = ShowcaseItemAttributeValue.ShowcaseAttributeValueID 
							AND Value NOT IN (SELECT TempValues FROM @TempValuesTable))
END
GO
