USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsPress]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsPress](
	[NewsPressID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[Author] [varchar](255) NULL,
	[Date] [datetime] NOT NULL,
	[Summary] [varchar](1000) NOT NULL,
	[StoryHTML] [varchar](max) NOT NULL,
	[Featured] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Archived] [bit] NOT NULL,
 CONSTRAINT [PK_NewsPress] PRIMARY KEY CLUSTERED 
(
	[NewsPressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Title]  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Author]  DEFAULT ('') FOR [Author]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Summary]  DEFAULT ('') FOR [Summary]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_StoryHTML]  DEFAULT ('') FOR [StoryHTML]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Featured]  DEFAULT ((0)) FOR [Featured]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Online]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[NewsPress] ADD  CONSTRAINT [DF_NewsPress_Archived]  DEFAULT ((0)) FOR [Archived]
GO
