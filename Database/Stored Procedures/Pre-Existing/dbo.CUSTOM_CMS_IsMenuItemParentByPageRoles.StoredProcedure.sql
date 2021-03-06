USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_IsMenuItemParentByPageRoles]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_IsMenuItemParentByPageRoles] 
	@SMItemID int,
	@UserID int = NULL
AS
BEGIN

	IF (@UserID IS NULL)
	BEGIN
		SELECT CAST(CASE WHEN (COUNT(SMItem.SMItemID) > 0) THEN 1 ELSE 0 END as bit)
		FROM SMItem
			LEFT JOIN CMPageRole ON SMItem.CMPageId = CMPageRole.CMPageId
		WHERE SMItemParentId = @SMItemID
			AND CMPageRoleId IS NULL
	END
	ELSE
	BEGIN
		SELECT CAST(CASE WHEN (COUNT(SMItem.SMItemID) > 0) THEN 1 ELSE 0 END as bit)
		FROM SMItem
			LEFT JOIN CMPageRole ON SMItem.CMPageId = CMPageRole.CMPageId
			LEFT JOIN UserRole ON CMPageRole.RoleId = UserRole.RoleId AND UserRole.UserID = @UserID
		WHERE SMItemParentId = @SMItemID
			AND (CMPageRoleID IS NULL OR UserRoleID IS NOT NULL)
	END
END
GO
