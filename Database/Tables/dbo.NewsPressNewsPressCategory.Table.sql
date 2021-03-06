USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsPressNewsPressCategory]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsPressNewsPressCategory](
	[NewsPressNewsPressCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[NewsPressID] [int] NOT NULL,
	[NewsPressCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_NewsPressNewsPressCategory] PRIMARY KEY CLUSTERED 
(
	[NewsPressNewsPressCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NewsPressNewsPressCategory]  WITH CHECK ADD  CONSTRAINT [FK_NewsPressNewsPressCategory_NewsPress] FOREIGN KEY([NewsPressID])
REFERENCES [dbo].[NewsPress] ([NewsPressID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsPressNewsPressCategory] CHECK CONSTRAINT [FK_NewsPressNewsPressCategory_NewsPress]
GO
ALTER TABLE [dbo].[NewsPressNewsPressCategory]  WITH CHECK ADD  CONSTRAINT [FK_NewsPressNewsPressCategory_NewsPressCategory] FOREIGN KEY([NewsPressCategoryID])
REFERENCES [dbo].[NewsPressCategory] ([NewsPressCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsPressNewsPressCategory] CHECK CONSTRAINT [FK_NewsPressNewsPressCategory_NewsPressCategory]
GO
