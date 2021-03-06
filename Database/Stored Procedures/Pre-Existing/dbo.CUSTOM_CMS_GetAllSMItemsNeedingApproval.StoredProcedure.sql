USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_GetAllSMItemsNeedingApproval]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_GetAllSMItemsNeedingApproval](
	@LanguageID int = NULL
)
AS
BEGIN
	SELECT DISTINCT *, Languages.Culture, Languages.CultureName
	FROM SMItem
		LEFT JOIN Languages ON SMItem.LanguageID = Languages.LanguageID
	WHERE NeedsApproval = 'True' 
		OR OriginalSMItemId IS NOT NULL
		OR EditorDeleted = 'True'
		AND (@LanguageID IS NULL OR SMItem.LanguageID = @LanguageID)
END
GO
