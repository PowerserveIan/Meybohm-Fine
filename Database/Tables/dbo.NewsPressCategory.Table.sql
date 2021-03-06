USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsPressCategory]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsPressCategory](
	[NewsPressCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[NewsPressParentCategoryID] [int] NULL,
	[Name] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_NewsPressCategory] PRIMARY KEY CLUSTERED 
(
	[NewsPressCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[NewsPressCategory]  WITH CHECK ADD  CONSTRAINT [FK_NewsPressCategory_NewsPressCategory] FOREIGN KEY([NewsPressParentCategoryID])
REFERENCES [dbo].[NewsPressCategory] ([NewsPressCategoryID])
GO
ALTER TABLE [dbo].[NewsPressCategory] CHECK CONSTRAINT [FK_NewsPressCategory_NewsPressCategory]
GO
ALTER TABLE [dbo].[NewsPressCategory] ADD  CONSTRAINT [DF_NewsPressCategory_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[NewsPressCategory] ADD  CONSTRAINT [DF_NewsPressCategory_Enabled]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[NewsPressCategory] ADD  CONSTRAINT [DF_NewsPressCategory_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
