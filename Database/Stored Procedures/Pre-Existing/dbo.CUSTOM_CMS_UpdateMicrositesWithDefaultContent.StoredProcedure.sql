USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_UpdateMicrositesWithDefaultContent]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_UpdateMicrositesWithDefaultContent](
	@FileName varchar(255)
)
AS
BEGIN
	UPDATE CMPageRegion 
	SET CurrentVersion = 'False'
	WHERE CMPageID IN (SELECT CMPageID 
						FROM CMPage
						WHERE FileName = @FileName
							AND MicrositeDefault = 'False')
END
GO
