USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseSettings]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseSettings](
	[ShowcaseSettingsID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseID] [int] NOT NULL,
	[SiteSettingsID] [int] NOT NULL,
	[Value] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_ShowcaseSettings] PRIMARY KEY CLUSTERED 
(
	[ShowcaseSettingsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseSettings]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseSettings_Showcase] FOREIGN KEY([ShowcaseID])
REFERENCES [dbo].[Showcase] ([ShowcaseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseSettings] CHECK CONSTRAINT [FK_ShowcaseSettings_Showcase]
GO
ALTER TABLE [dbo].[ShowcaseSettings]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseSettings_SiteSettings] FOREIGN KEY([SiteSettingsID])
REFERENCES [dbo].[SiteSettings] ([SiteSettingsID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseSettings] CHECK CONSTRAINT [FK_ShowcaseSettings_SiteSettings]
GO
