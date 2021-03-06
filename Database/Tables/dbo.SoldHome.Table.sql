USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SoldHome]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldHome](
	[SoldHomeID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[ListingAgentID] [int] NULL,
	[SalesAgentID] [int] NULL,
	[SellerOfficeID] [int] NULL,
	[CloseDate] [smalldatetime] NOT NULL,
	[SalePrice] [decimal](12, 2) NOT NULL,
	[SellerPercentage] [decimal](6, 3) NULL,
	[SellerOfficePercentage] [decimal](6, 3) NULL,
	[SalesAgentPercentage] [decimal](6, 3) NULL,
 CONSTRAINT [PK_SoldHome] PRIMARY KEY CLUSTERED 
(
	[SoldHomeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SoldHome]  WITH NOCHECK ADD  CONSTRAINT [FK_SoldHome_Office] FOREIGN KEY([SellerOfficeID])
REFERENCES [dbo].[Office] ([OfficeID])
GO
ALTER TABLE [dbo].[SoldHome] NOCHECK CONSTRAINT [FK_SoldHome_Office]
GO
ALTER TABLE [dbo].[SoldHome]  WITH NOCHECK ADD  CONSTRAINT [FK_SoldHome_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SoldHome] CHECK CONSTRAINT [FK_SoldHome_ShowcaseItem]
GO
ALTER TABLE [dbo].[SoldHome]  WITH NOCHECK ADD  CONSTRAINT [FK_SoldHome_User] FOREIGN KEY([ListingAgentID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SoldHome] NOCHECK CONSTRAINT [FK_SoldHome_User]
GO
ALTER TABLE [dbo].[SoldHome]  WITH NOCHECK ADD  CONSTRAINT [FK_SoldHome_User1] FOREIGN KEY([SalesAgentID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[SoldHome] NOCHECK CONSTRAINT [FK_SoldHome_User1]
GO
