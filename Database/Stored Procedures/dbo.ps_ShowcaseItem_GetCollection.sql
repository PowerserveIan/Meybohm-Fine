/*
 * ps_ShowcaseItem_GetCollection

 * Powerserve 2013
 * Meybohm Fine
 */
CREATE PROCEDURE [dbo].[ps_ShowcaseItem_GetCollection]
	@StateID			INT				= NULL,
	@City				NVARCHAR(255)	= NULL,
	@ListPriceMin		DECIMAL(12,2)	= 0,
	@ListPriceMax		DECIMAL(12,2)	= 1000000000,
	@BedsMin			INT				= 0,
	@BedsMax			INT				= 100,
	@BathsMin			INT				= 0,
	@BathsMax			INT				= 100,
	@GenericFilter		NVARCHAR(255)	= NULL,
	@SortBy				NVARCHAR(255)	= NULL,
	@SortDirection		INT				= 1,
	@OnlyFineFeatured	BIT				= NULL,
	@ShowcaseItemTags	NVARCHAR(2000)	= NULL,
	
	@Page				INT				= 1,
	@PageSize			INT				= 100,
	@RecordTotal		INT				= NULL OUTPUT,
	@PageTotal			INT				= NULL OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	-- Calculate the starting row and ending row.
	DECLARE @StartRow INT 
	set @StartRow = (@Page - 1) * @PageSize + 1
	DECLARE @EndRow  INT
	set @EndRow = @StartRow + @PageSize - 1
	
	SET @RecordTotal = 0
	SET @PageTotal	 = 0

	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeBedrooms
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Bedrooms'

	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeBaths
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Baths' 
		OR ShowcaseAttribute.Title = 'Full Baths'
	
	SELECT	ShowcaseAttributeValue.Value, 
			ShowcaseItemAttributeValue.ShowcaseItemID 
	INTO #ShowcaseAttributeHalfBaths
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Half Baths'

	SELECT ShowcaseAttributeValue.Value, ShowcaseItemAttributeValue.ShowcaseItemID INTO #ShowcaseAttributeSquareFeet
	FROM ShowcaseAttribute
	INNER JOIN ShowcaseAttributeValue		ON ShowcaseAttributeValue.ShowcaseAttributeID = ShowcaseAttribute.ShowcaseAttributeID
	INNER JOIN ShowcaseItemAttributeValue	ON ShowcaseItemAttributeValue.ShowcaseAttributeValueID = ShowcaseAttributeValue.ShowcaseAttributeValueID
	WHERE 
		ShowcaseAttribute.Title = 'Square Feet'

	SELECT Items AS Tags
	INTO #ShowcaseItemTags
	FROM dbo.split(@ShowcaseItemTags, ',')

	SELECT ROW_NUMBER() OVER (ORDER BY 
								CASE @SortBy
									WHEN 'DateListed' THEN CONVERT(INT, ShowcaseItem.DateListed)
									ELSE ShowcaseItem.ListPrice
								END * @SortDirection)  AS RowNumber,  
		   ShowcaseItem.*, 
		   ShowcaseItemFinePropertyInformation.Description,
		   ShowcaseItemFinePropertyInformation.Features,
		   ShowcaseItemFinePropertyInformation.Tags,
		   ShowcaseItemFinePropertyInformation.IsFine,
		   ShowcaseItemFinePropertyInformation.IsFineFeatured,
		   [Address].StateID, 
		   #ShowcaseAttributeBedrooms.Value AS Bedrooms, 
		   #ShowcaseAttributeBaths.Value AS Baths,
		   #ShowcaseAttributeHalfBaths.Value AS HalfBaths,
		   #ShowcaseAttributeSquareFeet.Value AS SquareFeet
	INTO #ShowcaseItemCollection
	FROM ShowcaseItem
	INNER JOIN [Address]							ON [Address].AddressID = ShowcaseItem.AddressID
	INNER JOIN [State]								ON [State].StateID = [Address].StateID
	INNER JOIN ShowcaseItemFinePropertyInformation	ON ShowcaseItemFinePropertyInformation.ShowcaseItemId = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeBedrooms			ON #ShowcaseAttributeBedrooms.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeBaths				ON #ShowcaseAttributeBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeHalfBaths			ON #ShowcaseAttributeHalfBaths.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN #ShowcaseAttributeSquareFeet			ON #ShowcaseAttributeSquareFeet.ShowCaseItemID = ShowcaseItem.ShowcaseItemID
	LEFT JOIN SoldHome								ON SoldHome.ShowcaseItemID = ShowcaseItem.ShowcaseItemID
	WHERE	(@StateID IS NULL OR [State].StateID = @StateID) AND
			(@City IS NULL OR UPPER([Address].City) LIKE '%'+ UPPER(@City) + '%') AND
			(ShowcaseItem.ListPrice BETWEEN @ListPriceMin AND @ListPriceMax) AND
			(
				(@BedsMin = 0 AND (#ShowcaseAttributeBedrooms.Value IS NULL OR #ShowcaseAttributeBedrooms.Value <= @BedsMax))
				OR (#ShowcaseAttributeBedrooms.Value BETWEEN @BedsMin AND @BedsMax)
			) AND
			(
				(@BathsMin = 0 AND (#ShowcaseAttributeBaths.Value IS NULL OR #ShowcaseAttributeBaths.Value <= @BathsMax))
				OR (#ShowcaseAttributeBaths.Value BETWEEN @BathsMin AND @BathsMax)
			) AND
			(
				@GenericFilter IS NULL 
				OR CONVERT(NVARCHAR(50), ShowcaseItem.MlsID) LIKE '%' + @GenericFilter + '%' 
				OR UPPER(Address.City) LIKE '%' + UPPER(@GenericFilter) + '%'
				OR UPPER(State.Name) LIKE '%' + UPPER(@GenericFilter) + '%' 
				OR UPPER(State.Abb) LIKE '%' + UPPER(@GenericFilter) + '%'
				OR UPPER(Address.Address1) LIKE '%' + UPPER(@GenericFilter) + '%'
			) AND
			ShowcaseItemFinePropertyInformation.IsFine = 1 AND
			(@OnlyFineFeatured IS NULL OR ShowcaseItemFinePropertyInformation.IsFineFeatured = @OnlyFineFeatured) AND
			(@ShowcaseItemTags IS NULL OR EXISTS(	SELECT *
													FROM #ShowcaseItemTags 
													WHERE ShowcaseItemFinePropertyInformation.Tags LIKE '%'+#ShowcaseItemTags.Tags+'%')) AND
			ShowcaseItem.Active = 1 AND
			SoldHome.SoldHomeId IS NULL
			
	
	-- Calculate the total number of records and pages.
	SELECT @RecordTotal = COUNT(1) 
	FROM #ShowcaseItemCollection
	
	SET @PageTotal = CEILING(@RecordTotal / CONVERT(REAL, @PageSize))
	
	SELECT *
	FROM #ShowcaseItemCollection
	WHERE 
		(@StartRow IS NULL AND @EndRow IS NULL) 
		OR #ShowcaseItemCollection.RowNumber BETWEEN @StartRow AND @EndRow

	DROP TABLE #ShowcaseAttributeBedrooms
	DROP TABLE #ShowcaseAttributeBaths
	DROP TABLE #ShowcaseAttributeHalfBaths
	DROP TABLE #ShowcaseAttributeSquareFeet
	DROP TABLE #ShowcaseItemTags
END