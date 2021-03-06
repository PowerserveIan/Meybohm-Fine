USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_DeleteAllSMItemsUsers]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_DeleteAllSMItemsUsers](
	@MicrositeID int = NULL,
	@LanguageID int = NULL
)
AS
BEGIN
	DELETE FROM SMItemUser
	WHERE (@MicrositeID = -1 AND MicrositeDefault = 'True')
		OR (CMMicrositeID = @MicrositeID)
		AND (@LanguageID IS NULL OR LanguageID = @LanguageID)
END
GO
