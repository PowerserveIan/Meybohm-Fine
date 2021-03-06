USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SiteComponent]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteComponent](
	[SiteComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [varchar](100) NOT NULL,
	[DisplayName] [varchar](100) NULL,
	[MenuDisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_SiteComponent] PRIMARY KEY CLUSTERED 
(
	[SiteComponentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
