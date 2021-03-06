USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Newsletter]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Newsletter](
	[NewsletterID] [int] IDENTITY(1,1) NOT NULL,
	[CMMicrositeID] [int] NULL,
	[DesignID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DisplayDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
	[Archived] [bit] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Issue] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Body] [varchar](max) NULL,
	[BodyText] [varchar](max) NULL,
	[Keywords] [varchar](max) NULL,
	[Deleted] [bit] NOT NULL,
	[NewHomes] [bit] NOT NULL,
 CONSTRAINT [PK_Newsletter] PRIMARY KEY CLUSTERED 
(
	[NewsletterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Newsletter]  WITH CHECK ADD  CONSTRAINT [FK_Newsletter_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Newsletter] CHECK CONSTRAINT [FK_Newsletter_CMMicrosite]
GO
ALTER TABLE [dbo].[Newsletter]  WITH CHECK ADD  CONSTRAINT [FK_Newsletter_NewsletterDesign] FOREIGN KEY([DesignID])
REFERENCES [dbo].[NewsletterDesign] ([NewsletterDesignID])
GO
ALTER TABLE [dbo].[Newsletter] CHECK CONSTRAINT [FK_Newsletter_NewsletterDesign]
GO
ALTER TABLE [dbo].[Newsletter] ADD  CONSTRAINT [DF_Newsletter_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Newsletter] ADD  CONSTRAINT [DF_Newsletter_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Newsletter] ADD  CONSTRAINT [DF_Newsletter_NewHomes]  DEFAULT ((0)) FOR [NewHomes]
GO
