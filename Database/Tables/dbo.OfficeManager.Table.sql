USE [Meybohm_com]
GO

/****** Object:  Table [dbo].[OfficeManager]    Script Date: 1/23/2014 2:18:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OfficeManager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfficeId] [int] NOT NULL,
	[UserInfoId] [int] NOT NULL,
 CONSTRAINT [PK_OfficeManager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[OfficeManager]  WITH CHECK ADD  CONSTRAINT [FK_OfficeManager_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([OfficeID])
GO

ALTER TABLE [dbo].[OfficeManager] CHECK CONSTRAINT [FK_OfficeManager_Office]
GO

ALTER TABLE [dbo].[OfficeManager]  WITH CHECK ADD  CONSTRAINT [FK_OfficeManager_User] FOREIGN KEY([UserInfoId])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO

ALTER TABLE [dbo].[OfficeManager] CHECK CONSTRAINT [FK_OfficeManager_User]
GO

