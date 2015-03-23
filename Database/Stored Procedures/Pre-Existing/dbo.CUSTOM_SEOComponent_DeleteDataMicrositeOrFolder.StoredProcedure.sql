USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_SEOComponent_DeleteDataMicrositeOrFolder]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_SEOComponent_DeleteDataMicrositeOrFolder]
	@Folder varchar(200)
AS
BEGIN
	DELETE FROM SEOData
	WHERE PageURL LIKE (@Folder + '%')
END
GO
