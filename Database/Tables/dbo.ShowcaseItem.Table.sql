USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseItem]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseItem](
	[ShowcaseItemID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
	[NeighborhoodID] [int] NULL,
	[BuilderID] [int] NULL,
	[OfficeID] [int] NULL,
	[AgentID] [int] NULL,
	[TeamID] [int] NULL,
	[Title] [varchar](500) NOT NULL,
	[Image] [varchar](1000) NOT NULL,
	[Summary] [varchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
	[MlsID] [int] NULL,
	[ListPrice] [decimal](12, 2) NULL,
	[DateListed] [datetime] NULL,
	[HighSchoolID] [int] NULL,
	[MiddleSchoolID] [int] NULL,
	[ElementarySchoolID] [int] NULL,
	[Rented] [bit] NOT NULL,
	[AvailabilityDate] [datetime] NULL,
	[StatsSentToAgent] [bit] NOT NULL,
	[StatsSentToOwner] [bit] NOT NULL,
	[EmailAddresses] [varchar](5000) NULL,
	[Website] [varchar](1000) NULL,
	[VirtualTourURL] [varchar](1000) NULL,
	[Directions] [varchar](2000) NULL,
	[OpenHouseAgentID] [int] NULL,
	[tempOldID] [int] NULL,
	[IsFine] [bit] NOT NULL,
	[Description] [varchar](6000) NULL,
	[IsFineFeatured] [bit] NOT NULL,
 CONSTRAINT [PK_ShowcaseItem] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_Address]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_Builder] FOREIGN KEY([BuilderID])
REFERENCES [dbo].[Builder] ([BuilderID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShowcaseItem] CHECK CONSTRAINT [FK_ShowcaseItem_Builder]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_Neighborhood] FOREIGN KEY([NeighborhoodID])
REFERENCES [dbo].[Neighborhood] ([NeighborhoodID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShowcaseItem] CHECK CONSTRAINT [FK_ShowcaseItem_Neighborhood]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_Office] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Office] ([OfficeID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_Office]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_ShowcaseItem] FOREIGN KEY([ShowcaseID])
REFERENCES [dbo].[Showcase] ([ShowcaseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseItem] CHECK CONSTRAINT [FK_ShowcaseItem_ShowcaseItem]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShowcaseItem] CHECK CONSTRAINT [FK_ShowcaseItem_Team]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseItem_User] FOREIGN KEY([AgentID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShowcaseItem] CHECK CONSTRAINT [FK_ShowcaseItem_User]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_User1] FOREIGN KEY([OpenHouseAgentID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_User1]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation] FOREIGN KEY([HighSchoolID])
REFERENCES [dbo].[WhatsNearByLocation] ([WhatsNearByLocationID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation1] FOREIGN KEY([MiddleSchoolID])
REFERENCES [dbo].[WhatsNearByLocation] ([WhatsNearByLocationID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation1]
GO
ALTER TABLE [dbo].[ShowcaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation2] FOREIGN KEY([ElementarySchoolID])
REFERENCES [dbo].[WhatsNearByLocation] ([WhatsNearByLocationID])
GO
ALTER TABLE [dbo].[ShowcaseItem] NOCHECK CONSTRAINT [FK_ShowcaseItem_WhatsNearByLocation2]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  CONSTRAINT [DF_ShowcaseItem_Featured]  DEFAULT ((0)) FOR [Featured]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  CONSTRAINT [DF_ShowcaseItem_Rented]  DEFAULT ((0)) FOR [Rented]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  CONSTRAINT [DF_ShowcaseItem_StatsSentToAgent]  DEFAULT ((0)) FOR [StatsSentToAgent]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  CONSTRAINT [DF_ShowcaseItem_StatsSentToOwner]  DEFAULT ((0)) FOR [StatsSentToOwner]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  DEFAULT ((0)) FOR [IsFine]
GO
ALTER TABLE [dbo].[ShowcaseItem] ADD  CONSTRAINT [DF_ShowcaseItem_IsFineFeatured]  DEFAULT ((0)) FOR [IsFineFeatured]
GO
