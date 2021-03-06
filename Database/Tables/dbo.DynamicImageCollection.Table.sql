USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[DynamicImageCollection]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicImageCollection](
	[DynamicImageCollectionID] [int] IDENTITY(1,1) NOT NULL,
	[DynamicImageID] [int] NOT NULL,
	[DynamicCollectionID] [int] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
 CONSTRAINT [PK_DynamicImageCollection] PRIMARY KEY CLUSTERED 
(
	[DynamicImageCollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DynamicImageCollection]  WITH CHECK ADD  CONSTRAINT [FK_DynamicImageCollection_DynamicCollection] FOREIGN KEY([DynamicCollectionID])
REFERENCES [dbo].[DynamicCollection] ([DynamicCollectionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DynamicImageCollection] CHECK CONSTRAINT [FK_DynamicImageCollection_DynamicCollection]
GO
ALTER TABLE [dbo].[DynamicImageCollection]  WITH NOCHECK ADD  CONSTRAINT [FK_DynamicImageCollection_DynamicImage] FOREIGN KEY([DynamicImageID])
REFERENCES [dbo].[DynamicImage] ([DynamicImageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DynamicImageCollection] CHECK CONSTRAINT [FK_DynamicImageCollection_DynamicImage]
GO
ALTER TABLE [dbo].[DynamicImageCollection] ADD  CONSTRAINT [DF_DynamicImageCollection_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
