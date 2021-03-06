USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_Showcase_GetFilteredShowcaseItemIDs_PostFunction]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_Showcase_GetFilteredShowcaseItemIDs_PostFunction](
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
	@SearchText varchar(50) = NULL,
	@EnableFilters bit
)
AS
BEGIN
	DECLARE @TempShowcaseItemID TABLE(
		ShowcaseItemID int
	)
	
	INSERT INTO @TempShowcaseItemID (ShowcaseItemID)
	SELECT ShowcaseItemID FROM [dbo].FilterShowcaseItems (@Filter, @FilterShowcaseItemActive, @FilterShowcaseItemShowcaseID, @FilterShowcaseItemNeighborhoodID, @FilterShowcaseItemAgentID, @AddressLat, @AddressLong, @MinDistance, @MaxDistance, @SearchText, @EnableFilters)
	
	IF (@OrderBy = '' OR @OrderBy = 'ListPrice' OR @OrderBy = 'DateListed')
	BEGIN
		SELECT * 
		FROM
		(
			SELECT ShowcaseItem.ShowcaseItemID, ShowcaseItem.Title, ShowcaseItem.Image, ShowcaseItem.GeocodedLat, ShowcaseItem.GeocodedLong, ShowcaseItem.Address, ShowcaseItem.City, ShowcaseItem.StateName as 'State', ShowcaseItem.Zipcode, 
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
				WHERE (
						EXISTS (SELECT 1 FROM @TempShowcaseItemID t WHERE t.ShowcaseItemID = [ShowcaseItem].ShowcaseItemID)
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
	END
	ELSE
	BEGIN
		RAISERROR(N'Sort Value "%s" is not supported', 16, 1, @OrderBy)
	END 
END
GO
