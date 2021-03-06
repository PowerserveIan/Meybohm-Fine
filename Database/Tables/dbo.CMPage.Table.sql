USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMPage]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMPage](
	[CMPageID] [int] IDENTITY(1,1) NOT NULL,
	[CMTemplateID] [int] NULL,
	[Title] [varchar](255) NULL,
	[FileName] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
	[FormRecipient] [nvarchar](255) NULL,
	[ResponsePageID] [int] NULL,
	[CanDelete] [bit] NOT NULL,
	[CMMicrositeID] [int] NULL,
	[MicrositeDefault] [bit] NOT NULL,
	[FeaturedPage] [bit] NOT NULL,
	[NeedsApproval] [bit] NOT NULL,
	[OriginalCMPageID] [int] NULL,
	[EditorUserIDs] [varchar](max) NULL,
	[EditorDeleted] [bit] NULL,
	[DynamicCollectionID] [int] NULL,
 CONSTRAINT [PK_CMPage] PRIMARY KEY CLUSTERED 
(
	[CMPageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CMPage]  WITH CHECK ADD  CONSTRAINT [FK_CMPage_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMPage] CHECK CONSTRAINT [FK_CMPage_CMMicrosite]
GO
ALTER TABLE [dbo].[CMPage]  WITH CHECK ADD  CONSTRAINT [FK_CMPage_CMPage] FOREIGN KEY([ResponsePageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
GO
ALTER TABLE [dbo].[CMPage] CHECK CONSTRAINT [FK_CMPage_CMPage]
GO
ALTER TABLE [dbo].[CMPage]  WITH CHECK ADD  CONSTRAINT [FK_CMPage_CMPage1] FOREIGN KEY([OriginalCMPageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
GO
ALTER TABLE [dbo].[CMPage] CHECK CONSTRAINT [FK_CMPage_CMPage1]
GO
ALTER TABLE [dbo].[CMPage]  WITH CHECK ADD  CONSTRAINT [FK_CMPage_CMTemplate] FOREIGN KEY([CMTemplateID])
REFERENCES [dbo].[CMTemplate] ([CMTemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMPage] CHECK CONSTRAINT [FK_CMPage_CMTemplate]
GO
ALTER TABLE [dbo].[CMPage]  WITH CHECK ADD  CONSTRAINT [FK_CMPage_DynamicCollection] FOREIGN KEY([DynamicCollectionID])
REFERENCES [dbo].[DynamicCollection] ([DynamicCollectionID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CMPage] CHECK CONSTRAINT [FK_CMPage_DynamicCollection]
GO
ALTER TABLE [dbo].[CMPage]  WITH NOCHECK ADD  CONSTRAINT [FK_CMPage_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CMPage] NOCHECK CONSTRAINT [FK_CMPage_User]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_CMPageCreated]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_CMPageDeleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_MicrositeDefault]  DEFAULT ((0)) FOR [MicrositeDefault]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_FeaturedPage]  DEFAULT ((0)) FOR [FeaturedPage]
GO
ALTER TABLE [dbo].[CMPage] ADD  CONSTRAINT [DF_CMPages_NeedsApproval]  DEFAULT ((0)) FOR [NeedsApproval]
GO
