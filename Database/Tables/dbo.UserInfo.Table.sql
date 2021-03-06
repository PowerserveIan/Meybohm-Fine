USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AddressID] [int] NULL,
	[PreferredLanguageID] [int] NULL,
	[PreferredCMMicrositeID] [int] NULL,
	[StaffTypeID] [int] NULL,
	[JobTitleID] [int] NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Website] [varchar](1000) NULL,
	[HomePhone] [varchar](25) NULL,
	[CellPhone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[OfficePhone] [varchar](25) NULL,
	[PrimaryPhone] [varchar](25) NULL,
	[Photo] [varchar](255) NULL,
	[Biography] [varchar](500) NULL,
	[Rating] [decimal](4, 2) NULL,
	[ShowRatingOnSite] [bit] NOT NULL,
	[ShowListingLink] [bit] NOT NULL,
	[DisplayInDirectory] [bit] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInfo_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Address]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_CMMicrosite] FOREIGN KEY([PreferredCMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_CMMicrosite]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_JobTitle] FOREIGN KEY([JobTitleID])
REFERENCES [dbo].[JobTitle] ([JobTitleID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_JobTitle]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Languages] FOREIGN KEY([PreferredLanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Languages]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_StaffType] FOREIGN KEY([StaffTypeID])
REFERENCES [dbo].[StaffType] ([StaffTypeID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_StaffType]
GO
ALTER TABLE [dbo].[UserInfo]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_ShowRatingOnSite]  DEFAULT ((0)) FOR [ShowRatingOnSite]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_ShowListingLink]  DEFAULT ((0)) FOR [ShowListingLink]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_DisplayInListOfAgents]  DEFAULT ((0)) FOR [DisplayInDirectory]
GO
