USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_WhatsNearBy_GetLocationsNearCoordinates]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		zfloyd
-- Create date: 11-6-2012
-- =============================================
CREATE PROCEDURE [dbo].[CUSTOM_WhatsNearBy_GetLocationsNearCoordinates]
	@Latitude decimal(12,9),
	@Longitude decimal(12,9),
	@DistanceAway int
AS
BEGIN
	SELECT WhatsNearByLocation.WhatsNearByLocationID, WhatsNearByLocation.AddressID, WhatsNearByLocation.Name, WhatsNearByLocation.Phone, WhatsNearByLocation.Website, WhatsNearByLocation.Description, WhatsNearByLocation.Active,
		CASE WHEN WhatsNearByLocation.Image IS NULL OR WhatsNearByLocation.Image = '' THEN 
			(SELECT TOP (1) WhatsNearByCategory.PlaceholderImage 
			FROM WhatsNearByCategory 
				INNER JOIN WhatsNearByLocationCategory ON WhatsNearByCategory.WhatsNearByCategoryID = WhatsNearByLocationCategory.WhatsNearByCategoryID 
			WHERE WhatsNearByLocationCategory.WhatsNearByLocationID = WhatsNearByLocation.WhatsNearByLocationID AND WhatsNearByCategory.PlaceholderImage IS NOT NULL AND WhatsNearByCategory.PlaceholderImage != '') 
		ELSE WhatsNearByLocation.Image END as 'Image',
		dbo.GetDistanceHaversine(@Latitude,@Longitude,Latitude,Longitude) as 'DistanceAway', 
		(SELECT WhatsNearByCategory.Name + ', ' FROM WhatsNearByCategory INNER JOIN WhatsNearByLocationCategory ON WhatsNearByLocationCategory.WhatsNearByCategoryID = WhatsNearByCategory.WhatsNearByCategoryID WHERE WhatsNearByLocationCategory.WhatsNearByLocationID = WhatsNearByLocation.WhatsNearByLocationID FOR XML PATH ('')) as 'CategoryNames'
	FROM WhatsNearByLocation
		INNER JOIN [Address] ON WhatsNearByLocation.AddressID = [Address].AddressID
	WHERE dbo.GetDistanceHaversine(@Latitude,@Longitude,Latitude,Longitude) <= @DistanceAway
		AND WhatsNearByLocation.Active = 1
	ORDER BY dbo.GetDistanceHaversine(@Latitude,@Longitude,Latitude,Longitude)
END
GO
