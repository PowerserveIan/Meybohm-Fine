USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_GetMaxDisplayOrder]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_GetMaxDisplayOrder](
	@TableName varchar(50),
	@TableIDField varchar(50),
	@ParentTableID int = NULL,
	@ParentTableIDField varchar(50) = NULL,
	@AdditionalIDField varchar(50) = NULL,
	@AdditionalID int = NULL
)
AS
BEGIN
	DECLARE @SQL varchar(2000)

	IF @ParentTableIDField IS NULL
		BEGIN
			SET @SQL = '
				SELECT ISNULL(Max(DisplayOrder), 0) as ''Max''
				FROM ' + @TableName
			IF @AdditionalIDField IS NOT NULL
				BEGIN
					IF @AdditionalID IS NULL
					BEGIN
						SET @SQL = @SQL + ' WHERE ' + @AdditionalIDField + ' IS NULL'
					END
					ELSE
					BEGIN
						SET @SQL = @SQL + ' WHERE ' + @AdditionalIDField + ' = ' + CONVERT(VARCHAR,@AdditionalID)
					END
				END
		END
	ELSE
		BEGIN
			SET @SQL = '
			SELECT ISNULL(Max(DisplayOrder), 0) as ''Max''
			FROM ' + @TableName + '
			WHERE ' + @ParentTableIDField + ' = ' + CONVERT(VARCHAR,@ParentTableID)	
			IF @AdditionalIDField IS NOT NULL
				BEGIN
					IF @AdditionalID IS NULL
					BEGIN
						SET @SQL = @SQL + ' AND ' + @AdditionalIDField + ' IS NULL'
					END
					ELSE
					BEGIN
						SET @SQL = @SQL + ' AND ' + @AdditionalIDField + ' = ' + CONVERT(VARCHAR,@AdditionalID)
					END
				END
		END
	EXEC(@SQL);
END
GO
