USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_StateAndCountry_ToggleShipTo]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CUSTOM_StateAndCountry_ToggleShipTo](
	@ToggleState bit,
	@ShipTo bit
)
AS
BEGIN
	IF @ToggleState = 'true'
		BEGIN
			UPDATE [State] SET ShipTo = @ShipTo
		END 
	ELSE
		BEGIN
			UPDATE [Country] SET ShipTo = @ShipTo WHERE [Name] != 'United States'
		END 
END
GO
