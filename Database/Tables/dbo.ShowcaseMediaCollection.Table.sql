USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseMediaCollection]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseMediaCollection](
	[ShowcaseMediaCollectionID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[ShowcaseMediaTypeID] [int] NOT NULL,
	[TextBlock] [varchar](max) NULL,
	[DisplayOrder] [smallint] NULL,
	[Active] [bit] NOT NULL,
	[IsFine] [bit] NOT NULL,
 CONSTRAINT [PK_ShowcaseVideoCollection] PRIMARY KEY CLUSTERED 
(
	[ShowcaseMediaCollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseMediaCollection]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseMediaCollection_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseMediaCollection] CHECK CONSTRAINT [FK_ShowcaseMediaCollection_ShowcaseItem]
GO
ALTER TABLE [dbo].[ShowcaseMediaCollection]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseMediaCollection_ShowcaseMediaType] FOREIGN KEY([ShowcaseMediaTypeID])
REFERENCES [dbo].[ShowcaseMediaType] ([ShowcaseMediaTypeID])
GO
ALTER TABLE [dbo].[ShowcaseMediaCollection] CHECK CONSTRAINT [FK_ShowcaseMediaCollection_ShowcaseMediaType]
GO
ALTER TABLE [dbo].[ShowcaseMediaCollection] ADD  CONSTRAINT [DF_ShowcaseMediaCollection_IsFine]  DEFAULT ((0)) FOR [IsFine]
GO
