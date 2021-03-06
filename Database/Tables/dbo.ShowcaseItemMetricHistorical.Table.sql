USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseItemMetricHistorical]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowcaseItemMetricHistorical](
	[ShowcaseItemMetricHistoricalID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[ClickTypeID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[TotalCount] [int] NOT NULL,
 CONSTRAINT [PK_ShowcaseItemMetricHistorical] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemMetricHistoricalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShowcaseItemMetricHistorical]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemMetricHistorical_ClickType] FOREIGN KEY([ClickTypeID])
REFERENCES [dbo].[ClickType] ([ClickTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemMetricHistorical] CHECK CONSTRAINT [FK_ShowcaseItemMetricHistorical_ClickType]
GO
ALTER TABLE [dbo].[ShowcaseItemMetricHistorical]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemMetricHistorical_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemMetricHistorical] CHECK CONSTRAINT [FK_ShowcaseItemMetricHistorical_ShowcaseItem]
GO
