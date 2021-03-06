USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Neighborhood]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Neighborhood](
	[NeighborhoodID] [int] IDENTITY(1,1) NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Image] [varchar](255) NULL,
	[PriceRange] [varchar](255) NULL,
	[Overview] [varchar](2500) NULL,
	[Directions] [varchar](1000) NULL,
	[Amenities] [varchar](1000) NULL,
	[Phone] [varchar](25) NULL,
	[Website] [varchar](1000) NULL,
	[Active] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
	[ShowLotsLand] [bit] NOT NULL,
 CONSTRAINT [PK_Neighborhood] PRIMARY KEY CLUSTERED 
(
	[NeighborhoodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Neighborhood]  WITH CHECK ADD  CONSTRAINT [FK_Neighborhood_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Neighborhood] CHECK CONSTRAINT [FK_Neighborhood_Address]
GO
ALTER TABLE [dbo].[Neighborhood]  WITH NOCHECK ADD  CONSTRAINT [FK_Neighborhood_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
GO
ALTER TABLE [dbo].[Neighborhood] NOCHECK CONSTRAINT [FK_Neighborhood_CMMicrosite]
GO
ALTER TABLE [dbo].[Neighborhood] ADD  CONSTRAINT [DF_NeighborhoodManager_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Neighborhood] ADD  CONSTRAINT [DF_Neighborhood_Featured]  DEFAULT ((0)) FOR [Featured]
GO
ALTER TABLE [dbo].[Neighborhood] ADD  CONSTRAINT [DF_Neighborhood_ShowLotsLand]  DEFAULT ((0)) FOR [ShowLotsLand]
GO
