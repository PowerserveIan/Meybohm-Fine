USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseMedia]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseMedia](
	[ShowcaseMediaID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](1000) NOT NULL,
	[Caption] [varchar](50) NULL,
	[Thumbnail] [varchar](255) NULL,
	[ShowcaseMediaCollectionID] [int] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ShowcaseVideo] PRIMARY KEY CLUSTERED 
(
	[ShowcaseMediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseMedia]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseMedia_ShowcaseMediaCollection] FOREIGN KEY([ShowcaseMediaCollectionID])
REFERENCES [dbo].[ShowcaseMediaCollection] ([ShowcaseMediaCollectionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseMedia] CHECK CONSTRAINT [FK_ShowcaseMedia_ShowcaseMediaCollection]
GO
