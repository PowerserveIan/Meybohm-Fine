USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[OpenHouse]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenHouse](
	[OpenHouseID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_OpenHouse] PRIMARY KEY CLUSTERED 
(
	[OpenHouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OpenHouse]  WITH NOCHECK ADD  CONSTRAINT [FK_OpenHouse_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OpenHouse] CHECK CONSTRAINT [FK_OpenHouse_ShowcaseItem]
GO
