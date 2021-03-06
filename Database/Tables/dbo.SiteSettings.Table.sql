USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteSettings](
	[SiteSettingsID] [int] IDENTITY(1,1) NOT NULL,
	[Setting] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[EmbeddedDescription] [varchar](500) NULL,
	[Value] [varchar](2000) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastModified] [datetime] NOT NULL,
	[SiteComponentID] [int] NOT NULL,
	[SiteSettingsDataTypeID] [int] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[Options] [varchar](2000) NULL,
	[IsCustom] [bit] NOT NULL,
	[DisplayOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_SiteSettings] PRIMARY KEY CLUSTERED 
(
	[SiteSettingsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_SiteSettings] UNIQUE NONCLUSTERED 
(
	[SiteComponentID] ASC,
	[Setting] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SiteSettings]  WITH CHECK ADD  CONSTRAINT [FK_SiteSettings_SiteComponent] FOREIGN KEY([SiteComponentID])
REFERENCES [dbo].[SiteComponent] ([SiteComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiteSettings] CHECK CONSTRAINT [FK_SiteSettings_SiteComponent]
GO
ALTER TABLE [dbo].[SiteSettings]  WITH CHECK ADD  CONSTRAINT [FK_SiteSettings_SiteSettingsDataType] FOREIGN KEY([SiteSettingsDataTypeID])
REFERENCES [dbo].[SiteSettingsDataType] ([SiteSettingsDataTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SiteSettings] CHECK CONSTRAINT [FK_SiteSettings_SiteSettingsDataType]
GO
ALTER TABLE [dbo].[SiteSettings] ADD  CONSTRAINT [DF_SiteSettings_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SiteSettings] ADD  CONSTRAINT [DF_SiteSettings_DateLastModified]  DEFAULT (getdate()) FOR [DateLastModified]
GO
ALTER TABLE [dbo].[SiteSettings] ADD  CONSTRAINT [DF_SiteSettings_IsRequired]  DEFAULT ((1)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[SiteSettings] ADD  CONSTRAINT [DF_SiteSettings_IsCustom]  DEFAULT ((0)) FOR [IsCustom]
GO
ALTER TABLE [dbo].[SiteSettings] ADD  CONSTRAINT [DF_SiteSettings_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
