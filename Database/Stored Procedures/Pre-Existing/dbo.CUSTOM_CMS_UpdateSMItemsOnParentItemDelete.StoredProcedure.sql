USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_CMS_UpdateSMItemsOnParentItemDelete]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_CMS_UpdateSMItemsOnParentItemDelete] 
	@SMItemID int,
	@EditorDelete bit
AS
BEGIN
	IF (@EditorDelete = 'true')
	BEGIN
		UPDATE SMItem 
		SET SMItemParentID = (SELECT SMItemParentID
							  FROM SMItem
							  WHERE SMItemID = @SMItemID)
		WHERE SMItemParentID = @SMItemID AND (OriginalSMItemId IS NOT NULL OR NeedsApproval = 'True')
		
		INSERT INTO SMItem (SMItemParentId, CMPageId, Name, Rank, ShowInMenu, CMMicrositeID, MicrositeDefault, LanguageID, NeedsApproval, OriginalSMItemId, EditorDeleted)
		(SELECT (SELECT SMItemParentID
				FROM SMItem
				WHERE SMItemID = @SMItemID) 'Parent', CMPageId, Name, Rank, ShowInMenu, CMMicrositeID, MicrositeDefault, LanguageID, NeedsApproval, SMItemID, EditorDeleted
		FROM SMItem
		WHERE SMItemParentID = @SMItemID AND OriginalSMItemId IS NULL AND NeedsApproval = 'False')
	END
	ELSE
	BEGIN
		UPDATE SMItem 
		SET SMItemParentID = (SELECT SMItemParentID
							  FROM SMItem
							  WHERE SMItemID = @SMItemID)
		WHERE SMItemParentID = @SMItemID
	END

END
GO
