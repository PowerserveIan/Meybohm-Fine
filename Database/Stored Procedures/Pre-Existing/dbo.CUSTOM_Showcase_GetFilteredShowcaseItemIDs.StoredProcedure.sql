USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_Showcase_GetFilteredShowcaseItemIDs]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_Showcase_GetFilteredShowcaseItemIDs](
	@PageSize int,
	@PageNumber int,
	@Filter varchar(2000) = NULL,
	@Ascending bit,
	@OrderBy varchar(50),
	@FilterShowcaseItemActive varchar(50) = NULL,
	@FilterShowcaseItemShowcaseID varchar(50) = NULL,
	@FilterShowcaseItemNeighborhoodID varchar(50) = NULL,
	@FilterShowcaseItemAgentID varchar(50) = NULL,
	@AddressLat decimal(12,5) = NULL,
	@AddressLong decimal(12,5) = NULL,
	@MinDistance int = NULL,
	@MaxDistance int = NULL,
	@OpenHouse bit = NULL,
	@SearchText varchar(50) = NULL,
	@EnableFilters bit,
	@NewHomesOnly bit = 0,
	@ShowLotsLand bit = 0,
	@ShowcaseItemIDsToFilterThrough varchar(MAX) = NULL
)
AS
BEGIN
	IF (@OrderBy = '' OR @OrderBy = 'ListPrice' OR @OrderBy = 'DateListed')
	BEGIN
		DECLARE @TempFilterTable TABLE
		(
			TempFilters varchar(2000)
		)

		DECLARE @TempAttributesTable TABLE
		(
			TempAttributesTableID int identity,
			TempAttributeID int,
			TempValues varchar(2000)
		)

		DECLARE @TempValuesTable TABLE
		(
			TempValues varchar(2000)
		)

		DECLARE @TempNoValuesTable TABLE
		(
			TempValues varchar(2000)
		)
		
		DECLARE @TempYesValuesTable TABLE
		(
			TempTableID int identity,
			TempValues varchar(2000)
		)

		DECLARE @TempShowcaseItemID Table
		(
			TempShowcaseItemID int  NOT NULL PRIMARY KEY
		)
		
		DECLARE @TempAttributeShowcaseItemID Table
		(
			TempShowcaseItemID int primary key
		)
		
		DECLARE @TempShowcaseItemIDsToFilterThrough Table
		(
			TempShowcaseItemID int NOT NULL PRIMARY KEY
		)
		
		DECLARE @CMMicrositeID int
		SET @CMMicrositeID = (SELECT CMMicrositeID FROM Showcase WHERE ShowcaseID = @FilterShowcaseItemShowcaseID)

		INSERT INTO @TempShowcaseItemID
		SELECT ShowcaseItem.ShowcaseItemID
		FROM ShowcaseItem
		WHERE (@FilterShowcaseItemActive IS NULL OR @FilterShowcaseItemActive = ShowcaseItem.Active)
			--Customized to show all agents listing for a certain market no matter what showcase they are in
			AND ((@FilterShowcaseItemAgentID IS NOT NULL AND ShowcaseItem.[ShowcaseID] IN (SELECT ShowcaseID FROM Showcase WHERE CMMicrositeID = @CMMicrositeID AND Title NOT LIKE '%Lots/Land%')) OR (@FilterShowcaseItemShowcaseID IS NULL OR @FilterShowcaseItemShowcaseID = ShowcaseItem.[ShowcaseID]))
			AND (@FilterShowcaseItemNeighborhoodID IS NULL OR @FilterShowcaseItemNeighborhoodID = ShowcaseItem.NeighborhoodID)
			AND (@FilterShowcaseItemAgentID IS NULL OR @FilterShowcaseItemAgentID = ShowcaseItem.AgentID OR EXISTS (SELECT 1 FROM UserTeam WHERE UserTeam.TeamID = ShowcaseItem.TeamID AND UserTeam.UserID = @FilterShowcaseItemAgentID AND ShowcaseItem.ShowcaseID != 7 AND ShowcaseItem.ShowcaseID != 8))
			AND Rented = 0
			AND (@NewHomesOnly = 0 OR @NewHomesOnly IS NULL OR ShowcaseItem.ShowcaseID = 1 OR ShowcaseItem.ShowcaseID = 3)
			AND (@ShowLotsLand = 0 OR @ShowLotsLand IS NULL OR ShowcaseItem.ShowcaseID = 7 OR ShowcaseItem.ShowcaseID = 8)
			--AND (AvailabilityDate IS NULL OR AvailabilityDate <= GETDATE())
			AND (@SearchText IS NULL OR @SearchText = '' OR [ShowcaseItem].Summary LIKE '%' + @SearchText + '%' OR CAST([ShowcaseItem].MlsID as varchar(50)) = @SearchText
					--[ShowcaseItem].Title LIKE '%' + @SearchText + '%' OR Summary LIKE '%' + @SearchText + '%' 
					OR EXISTS (SELECT 1 FROM Address WHERE ShowcaseItem.AddressID = Address.AddressID AND 
					(Address1 LIKE '%' + @SearchText + '%' OR City LIKE '%' + @SearchText + '%' OR [Zip] LIKE '%' + @SearchText + '%'))
					--OR ShowcaseMediaCollection.TextBlock LIKE '%' + @SearchText + '%')
					OR EXISTS (SELECT 1 FROM Builder WHERE ShowcaseItem.BuilderID = Builder.BuilderID AND Builder.Name LIKE '%' + @SearchText + '%' OR Builder.OwnerName LIKE '%' + @SearchText + '%')
					OR EXISTS (SELECT 1 FROM Office WHERE ShowcaseItem.OfficeID = Office.OfficeID AND Office.Name LIKE '%' + @SearchText + '%')
					OR EXISTS (SELECT 1 FROM Neighborhood WHERE ShowcaseItem.NeighborhoodID = Neighborhood.NeighborhoodID AND Neighborhood.Name LIKE '%' + @SearchText + '%')
					OR EXISTS (SELECT 1 FROM WhatsNearByLocation WHERE (ShowcaseItem.HighSchoolID = WhatsNearByLocation.WhatsNearByLocationID OR ShowcaseItem.MiddleSchoolID = WhatsNearByLocation.WhatsNearByLocationID OR ShowcaseItem.ElementarySchoolID = WhatsNearByLocation.WhatsNearByLocationID) 
								AND WhatsNearByLocation.Name LIKE '%' + @SearchText + '%')
				)
		
		IF (@ShowcaseItemIDsToFilterThrough IS NOT NULL AND @ShowcaseItemIDsToFilterThrough != '')
		BEGIN
			INSERT INTO @TempShowcaseItemIDsToFilterThrough (TempShowcaseItemID)
			SELECT CAST([Value] as int) FROM UTILfn_Split(@ShowcaseItemIDsToFilterThrough,',')
			
			DELETE FROM @TempShowcaseItemID
			WHERE TempShowcaseItemID NOT IN (SELECT t.TempShowcaseItemID FROM @TempShowcaseItemIDsToFilterThrough t)
		END
							
		IF (@EnableFilters = 1)
		BEGIN
			IF (@OpenHouse IS NOT NULL)
			BEGIN
				IF (@OpenHouse = 1)
				BEGIN
					DELETE FROM @TempShowcaseItemID
					WHERE NOT EXISTS (SELECT 1 FROM OpenHouse WHERE ShowcaseItemID = TempShowcaseItemID AND (BeginDate >= GETUTCDATE() OR EndDate >= GETUTCDATE()))
				END
				ELSE
				BEGIN
					DELETE FROM @TempShowcaseItemID
					WHERE EXISTS (SELECT 1 FROM OpenHouse WHERE ShowcaseItemID = TempShowcaseItemID AND (BeginDate >= GETUTCDATE() OR EndDate >= GETUTCDATE()))
				END
			END
			
			IF (@Filter != '')
			BEGIN
				--Call the Split function from Site Template and insert all IDs on the current page into temp table
				INSERT INTO @TempFilterTable (TempFilters)
				SELECT [Value] FROM UTILfn_Split(@Filter,'|')
						
				INSERT INTO @TempAttributesTable (TempAttributeID,TempValues)
				SELECT substring(TempFilters, 0, charindex(':',TempFilters)), substring(TempFilters, charindex(':',TempFilters) + 1, len(TempFilters))
				FROM @TempFilterTable t

				DECLARE @numRows int;
				SET @numRows = (SELECT COUNT(*) FROM @TempAttributesTable)

				DECLARE @valueBetween varchar(50);
				DECLARE @valueMin float;
				DECLARE @valueMax float;
				
				DECLARE @ShowcaseAttributeID int
				
				DECLARE @counter int;
				DECLARE @yesCounter int;
				DECLARE @yesNumRows int;
				SET @counter = 1;
				WHILE (@counter <= @numRows)
				BEGIN
					SET @ShowcaseAttributeID = (SELECT TOP 1 TempAttributeID
												FROM @TempAttributesTable
												WHERE TempAttributesTableID = @counter)
				--Call the Split function from Site Template and insert all IDs on the current page into temp table
					INSERT INTO @TempValuesTable (TempValues)
					SELECT [Value] FROM UTILfn_Split((SELECT TempValues 
														FROM @TempAttributesTable 
														WHERE TempAttributesTableID = @counter),',')
															
					INSERT INTO @TempNoValuesTable (TempValues)
					SELECT REPLACE(TempValues,'[No]','') FROM @TempValuesTable t
					WHERE TempValues LIKE '%\[No]' ESCAPE '\'
					
					INSERT INTO @TempYesValuesTable (TempValues)
					SELECT REPLACE(TempValues,'[Yes]','') FROM @TempValuesTable t
					WHERE TempValues LIKE '%\[Yes]' ESCAPE '\'
					
					DELETE FROM @TempValuesTable
					WHERE TempValues LIKE '%\[No]' ESCAPE '\' OR TempValues LIKE '%\[Yes]' ESCAPE '\'
					
					UPDATE @TempValuesTable
					SET TempValues = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(TempValues, '[PIPE]', '|'), '[COLON]', ':'), '[COMMA]', ','), '[LESSTHAN]', '<'), '[GREATERTHAN]', '>')

					SET @valueBetween = (SELECT TOP 1 TempValues FROM @TempValuesTable)
					
					IF (substring(@valueBetween,1,1) = '>' OR substring(@valueBetween,1,1) = '<')
					BEGIN
						SET @valueMin = CASE WHEN @valueBetween LIKE '%>%' THEN cast(substring(@valueBetween,2, 
											CASE WHEN @valueBetween LIKE '%<%' THEN charIndex('<', @valueBetween)-2 ELSE LEN(@valueBetween) - 1 END) as float) ELSE NULL END;
						SET @valueMax = CASE WHEN @valueBetween LIKE '%<%' THEN cast(substring(@valueBetween,charIndex('<', @valueBetween)+1, LEN(@valueBetween)) as float) ELSE NULL END;
												
						INSERT INTO @TempAttributeShowcaseItemID(TempShowcaseItemID)
						SELECT DISTINCT ShowcaseItemAttributeValue.ShowcaseItemID
						FROM ShowcaseItemAttributeValue
							INNER JOIN ShowcaseAttributeValue ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID					
						WHERE ISNUMERIC(ShowcaseAttributeValue.Value) = '1'
							AND (@valueMin IS NULL OR ShowcaseAttributeValue.Value >= @valueMin)
							AND (@valueMax IS NULL OR ShowcaseAttributeValue.Value <= @valueMax)
							AND ShowcaseAttributeValue.ShowcaseAttributeID = @ShowcaseAttributeID
							--AND EXISTS (SELECT 1 FROM @TempShowcaseItemID t WHERE ShowcaseItemAttributeValue.ShowcaseItemID = t.TempShowcaseItemID)
						
						DELETE FROM @TempShowcaseItemID
						WHERE TempShowcaseItemID NOT IN (SELECT	t.TempShowcaseItemID FROM @TempAttributeShowcaseItemID t)
					END
					ELSE
					BEGIN
						IF ((SELECT COUNT(*) FROM @TempValuesTable) > 0)
						BEGIN
							INSERT INTO @TempAttributeShowcaseItemID(TempShowcaseItemID)
							SELECT DISTINCT ShowcaseItemAttributeValue.ShowcaseItemID
							FROM ShowcaseItemAttributeValue
								INNER JOIN ShowcaseAttributeValue ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
							WHERE ShowcaseAttributeValue.Value IN (SELECT TempValues FROM @TempValuesTable)
								AND ShowcaseAttributeValue.ShowcaseAttributeID = @ShowcaseAttributeID
								-- SLOW
								--AND EXISTS (SELECT 1 FROM @TempShowcaseItemID t WHERE ShowcaseItemAttributeValue.ShowcaseItemID = t.TempShowcaseItemID)
								AND ShowcaseItemAttributeValue.ShowcaseItemID in (SELECT TempShowcaseItemID from @TempShowcaseItemID where ShowcaseItemAttributeValue.ShowcaseItemID = TempShowcaseItemID )
							
							
							DELETE FROM @TempShowcaseItemID
							WHERE TempShowcaseItemID NOT IN (SELECT	t.TempShowcaseItemID FROM @TempAttributeShowcaseItemID t)
						END					
						
						IF ((SELECT COUNT(*) FROM @TempNoValuesTable) > 0)
						BEGIN
							DELETE FROM @TempShowcaseItemID
							WHERE TempShowcaseItemID IN(
								SELECT ShowcaseItemID
								FROM ShowcaseItemAttributeValue
									INNER JOIN ShowcaseAttributeValue ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
								WHERE ShowcaseAttributeValue.Value IN (SELECT TempValues FROM @TempNoValuesTable)
									AND ShowcaseAttributeValue.ShowcaseAttributeID = @ShowcaseAttributeID
							)
						END
						
						SET @yesCounter = 1
						SET	@yesNumRows = (SELECT COUNT(*) FROM @TempYesValuesTable)
						WHILE (@yesCounter <= @yesNumRows)
						BEGIN
							DELETE FROM @TempAttributeShowcaseItemID
							
							INSERT INTO @TempAttributeShowcaseItemID(TempShowcaseItemID)
							SELECT DISTINCT ShowcaseItemAttributeValue.ShowcaseItemID
							FROM ShowcaseItemAttributeValue
								INNER JOIN ShowcaseAttributeValue ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
							WHERE ShowcaseAttributeValue.Value IN (SELECT TempValues FROM @TempYesValuesTable WHERE TempTableID = @yesCounter)
								AND ShowcaseAttributeValue.ShowcaseAttributeID = @ShowcaseAttributeID
								AND EXISTS (SELECT 1 FROM @TempShowcaseItemID t WHERE ShowcaseItemAttributeValue.ShowcaseItemID = t.TempShowcaseItemID)
							
							DELETE FROM @TempShowcaseItemID
							WHERE TempShowcaseItemID NOT IN (SELECT	t.TempShowcaseItemID FROM @TempAttributeShowcaseItemID t)							
							
							SET @yesCounter = @yesCounter + 1;
						END
					END
					
					DELETE FROM @TempAttributeShowcaseItemID
					DELETE FROM @TempValuesTable
					DELETE FROM @TempNoValuesTable
					DELETE FROM @TempYesValuesTable
					SET @counter = @counter + 1;
					SET @valueMin = NULL;
					SET @valueMax = NULL;
					SET @valueBetween = NULL;
				END
			END
			
			/*Distance Filter*/
			IF (@AddressLat IS NOT NULL AND @AddressLong IS NOT NULL AND @MaxDistance IS NOT NULL)
			BEGIN
				DELETE FROM @TempShowcaseItemID
				WHERE TempShowcaseItemID NOT IN(
					SELECT ShowcaseItemID
					FROM ShowcaseItem
						INNER JOIN [Address] ON ShowcaseItem.AddressID = [Address].AddressID
					WHERE @MaxDistance >= dbo.GetDistanceHaversine(@AddressLat,@AddressLong,Latitude,Longitude)
						AND (@MinDistance IS NULL OR @MinDistance <= dbo.GetDistanceHaversine(@AddressLat,@AddressLong,Latitude,Longitude))
				)
			END
		END
		
		SELECT * 
		FROM
		(
			SELECT ShowcaseItem.ShowcaseItemID, ShowcaseItem.Title, ShowcaseItem.Image, ShowcaseItem.Summary, ShowcaseItem.GeocodedLat, ShowcaseItem.GeocodedLong, ShowcaseItem.Address, 
				ShowcaseItem.City, ShowcaseItem.StateName as 'State', ShowcaseItem.Zipcode, ShowcaseItem.VirtualTourURL, CAST(CASE WHEN EXISTS (SELECT 1 FROM OpenHouse WHERE OpenHouse.ShowcaseItemID = ShowcaseItem.ShowcaseItemID) THEN 1 ELSE 0 END as bit) as 'HasOpenHouse',
				ROW_NUMBER() OVER 
				(
					ORDER BY 
						CASE WHEN ((@OrderBy = 'DateListed') AND (@Ascending='1')) THEN [ShowcaseItem].DateListed ELSE NULL END ASC, 
						CASE WHEN ((@OrderBy = 'ListPrice') AND (@Ascending='1')) THEN [ShowcaseItem].ListPrice ELSE NULL END ASC, 
						CASE WHEN ((@OrderBy = 'DateListed') AND (@Ascending='0')) THEN [ShowcaseItem].DateListed ELSE NULL END DESC, 
						CASE WHEN ((@OrderBy = 'ListPrice') AND (@Ascending='0')) THEN [ShowcaseItem].ListPrice ELSE NULL END DESC						
				) AS [Row_Number], 
				COUNT(*) OVER () TotalRowCount
			FROM(
				SELECT DISTINCT [ShowcaseItem].*, [Address].Address1 as 'Address', [Address].City, [Address].Zip as 'Zipcode', [Address].Latitude as 'GeocodedLat', [Address].Longitude as 'GeocodedLong', [State].Name as 'StateName'
				FROM 
					[ShowcaseItem]
					--INNER JOIN ShowcaseItemAttributeValue ON ShowcaseItem.ShowcaseItemID = ShowcaseItemAttributeValue.ShowcaseItemID
					--INNER JOIN ShowcaseAttributeValue ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
					--INNER JOIN ShowcaseAttribute ON ShowcaseAttribute.ShowcaseAttributeID = ShowcaseAttributeValue.ShowcaseAttributeID
					--INNER JOIN ShowcaseMediaCollection ON ShowcaseItem.ShowcaseItemID = ShowcaseMediaCollection.ShowcaseItemID
					LEFT JOIN [Address] ON ShowcaseItem.AddressID = [Address].AddressID
					LEFT JOIN [State] ON [Address].StateID = [State].StateID
				--WHERE ( EXISTS (SELECT 1 FROM @TempShowcaseItemID t WHERE [ShowcaseItem].ShowcaseItemID = t.TempShowcaseItemID)
				WHERE ([ShowcaseItem].ShowcaseItemId in (Select TempShowcaseItemID from @TempShowcaseItemID)
						--AND (@SearchText IS NULL OR (
						--	[ShowcaseItem].Title LIKE '%' + @SearchText + '%' OR Summary LIKE '%' + @SearchText + '%' 
						--	OR [Address] LIKE '%' + @SearchText + '%' OR City LIKE '%' + @SearchText + '%'
						--	OR [State].Name LIKE '%' + @SearchText + '%' OR [Zipcode] LIKE '%' + @SearchText + '%'
						--	OR ShowcaseMediaCollection.TextBlock LIKE '%' + @SearchText + '%'))
				)
			) ShowcaseItem
		) [query]
		WHERE (@PageSize > 0 AND [Row_Number] BETWEEN 
				(@PageNumber-1)*@PageSize+1 
				AND (@PageSize)*@PageNumber)
			OR
				(@PageSize <= 0)
		ORDER BY [Row_Number]
	END
	ELSE
	BEGIN
		RAISERROR(N'Sort Value "%s" is not supported', 16, 1, @OrderBy)
	END 
END
GO
