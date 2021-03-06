USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseItemRental]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseItemRental](
	[ShowcaseItemRentalID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[LeaseBeginDate] [datetime] NULL,
	[OwnerName] [varchar](500) NULL,
	[CompanyName] [varchar](255) NULL,
	[ContactName] [varchar](500) NULL,
	[ContactPhone] [varchar](25) NULL,
 CONSTRAINT [PK_ShowcaseItemRental] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemRentalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseItemRental]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItemRental_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItemRental] CHECK CONSTRAINT [FK_ShowcaseItemRental_ShowcaseItem]
GO
