USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_ELMAH_GetRETSErrors]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<sheftic>
-- Create date: <3/16/2013>
-- Description:	<Retrieve Elmah logs created in rets update>
-- =============================================
CREATE PROCEDURE [dbo].[CUSTOM_ELMAH_GetRETSErrors] 
	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	SELECT     [Message] AS ErrorMessage, AllXml AS ErrorData, TimeUtc AS ErrorTimeUtc, '' as Method, '' as City, '' as MlsID, '' as Step,'' as Showcase
	FROM         dbo.ELMAH_Error
	WHERE     (AllXml LIKE '%CustomRetsError%')
	ORDER BY TimeUtc DESC



END
GO
