USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseItemAttributeValue]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowcaseItemAttributeValue](
	[ShowcaseItemAttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[ShowcaseAttributeValueID] [int] NOT NULL,
 CONSTRAINT [PK_ShowcaseItemAttributeValue] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemAttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShowcaseItemAttributeValue]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItemAttributeValue_ShowcaseAttributeValue] FOREIGN KEY([ShowcaseAttributeValueID])
REFERENCES [dbo].[ShowcaseAttributeValue] ([ShowcaseAttributeValueID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemAttributeValue] CHECK CONSTRAINT [FK_ShowcaseItemAttributeValue_ShowcaseAttributeValue]
GO
ALTER TABLE [dbo].[ShowcaseItemAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItemAttributeValue_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemAttributeValue] CHECK CONSTRAINT [FK_ShowcaseItemAttributeValue_ShowcaseItem]
GO
