USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMPageRegion]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMPageRegion](
	[CMPageRegionID] [int] IDENTITY(1,1) NOT NULL,
	[CMPageID] [int] NOT NULL,
	[CMRegionID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ContentClean] [nvarchar](max) NULL,
	[CurrentVersion] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[UserID] [int] NULL,
	[LanguageID] [int] NULL,
	[NeedsApproval] [bit] NOT NULL,
	[GlobalAreaCMPageID] [int] NULL,
	[EditorUserIDs] [varchar](max) NULL,
	[Draft] [bit] NOT NULL,
 CONSTRAINT [PK_CMPageRegion] PRIMARY KEY CLUSTERED 
(
	[CMPageRegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CMPageRegion]  WITH NOCHECK ADD  CONSTRAINT [FK_CMPageRegion_CMPage1] FOREIGN KEY([GlobalAreaCMPageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
GO
ALTER TABLE [dbo].[CMPageRegion] NOCHECK CONSTRAINT [FK_CMPageRegion_CMPage1]
GO
ALTER TABLE [dbo].[CMPageRegion]  WITH CHECK ADD  CONSTRAINT [FK_CMPageRegion_CMRegion] FOREIGN KEY([CMRegionID])
REFERENCES [dbo].[CMRegion] ([CMRegionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMPageRegion] CHECK CONSTRAINT [FK_CMPageRegion_CMRegion]
GO
ALTER TABLE [dbo].[CMPageRegion]  WITH CHECK ADD  CONSTRAINT [FK_CMPageRegion_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMPageRegion] CHECK CONSTRAINT [FK_CMPageRegion_Languages]
GO
ALTER TABLE [dbo].[CMPageRegion]  WITH CHECK ADD  CONSTRAINT [FK_CMPageRegion_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CMPageRegion] CHECK CONSTRAINT [FK_CMPageRegion_User]
GO
ALTER TABLE [dbo].[CMPageRegion] ADD  CONSTRAINT [DF_CMPageRegions_CMPageCreated]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CMPageRegion] ADD  CONSTRAINT [DF_CMPageRegions_LanguageID]  DEFAULT ((1)) FOR [LanguageID]
GO
ALTER TABLE [dbo].[CMPageRegion] ADD  CONSTRAINT [DF_CMPageRegions_NeedsApproval]  DEFAULT ((0)) FOR [NeedsApproval]
GO
ALTER TABLE [dbo].[CMPageRegion] ADD  CONSTRAINT [DF_CMPageRegions_Draft]  DEFAULT ((0)) FOR [Draft]
GO
