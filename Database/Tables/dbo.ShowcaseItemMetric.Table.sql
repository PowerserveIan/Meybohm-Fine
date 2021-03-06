USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseItemMetric]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseItemMetric](
	[ShowcaseItemMetricID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[ClickTypeID] [int] NOT NULL,
	[UserID] [int] NULL,
	[SessionID] [varchar](25) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ShowcaseItemMetric] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemMetricID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseItemMetric]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemMetric_ClickType] FOREIGN KEY([ClickTypeID])
REFERENCES [dbo].[ClickType] ([ClickTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemMetric] CHECK CONSTRAINT [FK_ShowcaseItemMetric_ClickType]
GO
ALTER TABLE [dbo].[ShowcaseItemMetric]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemMetric_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemMetric] CHECK CONSTRAINT [FK_ShowcaseItemMetric_ShowcaseItem]
GO
ALTER TABLE [dbo].[ShowcaseItemMetric]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemMetric_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShowcaseItemMetric] CHECK CONSTRAINT [FK_ShowcaseItemMetric_User]
GO
