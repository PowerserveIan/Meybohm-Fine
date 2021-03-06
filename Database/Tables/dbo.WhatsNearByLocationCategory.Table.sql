USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[WhatsNearByLocationCategory]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WhatsNearByLocationCategory](
	[WhatsNearByLocationCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[WhatsNearByLocationID] [int] NOT NULL,
	[WhatsNearByCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_WhatsNearByLocationCategory] PRIMARY KEY CLUSTERED 
(
	[WhatsNearByLocationCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WhatsNearByLocationCategory]  WITH CHECK ADD  CONSTRAINT [FK_WhatsNearByLocationCategory_WhatsNearByCategory] FOREIGN KEY([WhatsNearByCategoryID])
REFERENCES [dbo].[WhatsNearByCategory] ([WhatsNearByCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WhatsNearByLocationCategory] CHECK CONSTRAINT [FK_WhatsNearByLocationCategory_WhatsNearByCategory]
GO
ALTER TABLE [dbo].[WhatsNearByLocationCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_WhatsNearByLocationCategory_WhatsNearByLocation] FOREIGN KEY([WhatsNearByLocationID])
REFERENCES [dbo].[WhatsNearByLocation] ([WhatsNearByLocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WhatsNearByLocationCategory] CHECK CONSTRAINT [FK_WhatsNearByLocationCategory_WhatsNearByLocation]
GO
