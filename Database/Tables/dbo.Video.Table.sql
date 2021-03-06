USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Url] [varchar](2000) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[Active] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Video] ADD  CONSTRAINT [DF_Video_Featured]  DEFAULT ((0)) FOR [Featured]
GO
