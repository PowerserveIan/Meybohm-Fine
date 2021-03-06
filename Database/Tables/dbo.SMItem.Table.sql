USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SMItem]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMItem](
	[SMItemID] [int] IDENTITY(1,1) NOT NULL,
	[SMItemParentID] [int] NULL,
	[CMPageID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Rank] [smallint] NOT NULL,
	[ShowInMenu] [bit] NOT NULL,
	[CMMicrositeID] [int] NULL,
	[MicrositeDefault] [bit] NOT NULL,
	[LanguageID] [int] NULL,
	[NeedsApproval] [bit] NOT NULL,
	[OriginalSMItemID] [int] NULL,
	[EditorDeleted] [bit] NOT NULL,
	[NewHomes] [bit] NULL,
 CONSTRAINT [PK_SMItem] PRIMARY KEY CLUSTERED 
(
	[SMItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SMItem]  WITH CHECK ADD  CONSTRAINT [FK_SMItem_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
GO
ALTER TABLE [dbo].[SMItem] CHECK CONSTRAINT [FK_SMItem_CMMicrosite]
GO
ALTER TABLE [dbo].[SMItem]  WITH NOCHECK ADD  CONSTRAINT [FK_SMItem_CMPage] FOREIGN KEY([CMPageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
GO
ALTER TABLE [dbo].[SMItem] CHECK CONSTRAINT [FK_SMItem_CMPage]
GO
ALTER TABLE [dbo].[SMItem]  WITH CHECK ADD  CONSTRAINT [FK_SMItem_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SMItem] CHECK CONSTRAINT [FK_SMItem_Languages]
GO
ALTER TABLE [dbo].[SMItem]  WITH CHECK ADD  CONSTRAINT [FK_SMItem_SMItem] FOREIGN KEY([SMItemParentID])
REFERENCES [dbo].[SMItem] ([SMItemID])
GO
ALTER TABLE [dbo].[SMItem] CHECK CONSTRAINT [FK_SMItem_SMItem]
GO
ALTER TABLE [dbo].[SMItem] ADD  CONSTRAINT [DF_SMItems_ShowInMenu]  DEFAULT ((1)) FOR [ShowInMenu]
GO
ALTER TABLE [dbo].[SMItem] ADD  CONSTRAINT [DF_SMItems_MicrositeDefault]  DEFAULT ((0)) FOR [MicrositeDefault]
GO
ALTER TABLE [dbo].[SMItem] ADD  CONSTRAINT [DF_SMItems_NeedsApproval]  DEFAULT ((0)) FOR [NeedsApproval]
GO
ALTER TABLE [dbo].[SMItem] ADD  CONSTRAINT [DF_SMItems_EditorDeleted]  DEFAULT ((0)) FOR [EditorDeleted]
GO
