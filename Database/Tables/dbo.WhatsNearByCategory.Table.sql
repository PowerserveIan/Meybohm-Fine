USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[WhatsNearByCategory]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WhatsNearByCategory](
	[WhatsNearByCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[PlaceholderImage] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_WhatsNearByCategory] PRIMARY KEY CLUSTERED 
(
	[WhatsNearByCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
