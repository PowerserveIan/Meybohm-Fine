USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[DynamicImage]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DynamicImage](
	[DynamicImageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Link] [varchar](255) NULL,
	[Duration] [int] NULL,
	[Caption] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
	[IsVideo] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_FlashImage] PRIMARY KEY CLUSTERED 
(
	[DynamicImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DynamicImage] ADD  CONSTRAINT [DF_DynamicImage_IsVideo]  DEFAULT ((0)) FOR [IsVideo]
GO
ALTER TABLE [dbo].[DynamicImage] ADD  CONSTRAINT [DF_DynamicImage_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
