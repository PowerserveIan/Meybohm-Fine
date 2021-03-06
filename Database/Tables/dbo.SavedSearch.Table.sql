USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SavedSearch]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SavedSearch](
	[SavedSearchID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ShowcaseID] [int] NOT NULL,
	[ShowcaseItemID] [int] NULL,
	[Name] [varchar](500) NOT NULL,
	[Image] [varchar](255) NULL,
	[FilterString] [varchar](1000) NULL,
	[EnableEmailNotifications] [bit] NOT NULL,
	[SeparateEmail] [bit] NOT NULL,
	[DailyEmail] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastAlertDate] [datetime] NULL,
	[LastAlertCount] [int] NULL,
 CONSTRAINT [PK_SavedSearch] PRIMARY KEY CLUSTERED 
(
	[SavedSearchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SavedSearch]  WITH CHECK ADD  CONSTRAINT [FK_SavedSearch_Showcase] FOREIGN KEY([ShowcaseID])
REFERENCES [dbo].[Showcase] ([ShowcaseID])
GO
ALTER TABLE [dbo].[SavedSearch] CHECK CONSTRAINT [FK_SavedSearch_Showcase]
GO
ALTER TABLE [dbo].[SavedSearch]  WITH CHECK ADD  CONSTRAINT [FK_SavedSearch_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SavedSearch] CHECK CONSTRAINT [FK_SavedSearch_ShowcaseItem]
GO
ALTER TABLE [dbo].[SavedSearch]  WITH CHECK ADD  CONSTRAINT [FK_SavedSearch_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SavedSearch] CHECK CONSTRAINT [FK_SavedSearch_User]
GO
ALTER TABLE [dbo].[SavedSearch] ADD  CONSTRAINT [DF_SavedSearch_EnableEmailNotifications]  DEFAULT ((0)) FOR [EnableEmailNotifications]
GO
ALTER TABLE [dbo].[SavedSearch] ADD  CONSTRAINT [DF_SavedSearch_SeparateEmail]  DEFAULT ((0)) FOR [SeparateEmail]
GO
ALTER TABLE [dbo].[SavedSearch] ADD  CONSTRAINT [DF_SavedSearch_DailyEmail]  DEFAULT ((0)) FOR [DailyEmail]
GO
