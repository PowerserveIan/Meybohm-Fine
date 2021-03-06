USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SMItemUser]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMItemUser](
	[SMItemUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CMMicrositeID] [int] NULL,
	[MicrositeDefault] [bit] NOT NULL,
	[LanguageID] [int] NULL,
 CONSTRAINT [PK_SMItemUser] PRIMARY KEY CLUSTERED 
(
	[SMItemUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMItemUser]  WITH CHECK ADD  CONSTRAINT [FK_SMItemUser_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMItemUser] CHECK CONSTRAINT [FK_SMItemUser_CMMicrosite]
GO
ALTER TABLE [dbo].[SMItemUser]  WITH CHECK ADD  CONSTRAINT [FK_SMItemUser_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMItemUser] CHECK CONSTRAINT [FK_SMItemUser_Languages]
GO
ALTER TABLE [dbo].[SMItemUser]  WITH NOCHECK ADD  CONSTRAINT [FK_SMItemUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SMItemUser] CHECK CONSTRAINT [FK_SMItemUser_User]
GO
ALTER TABLE [dbo].[SMItemUser] ADD  CONSTRAINT [DF_SMItemsUsers_MicrositeDefault]  DEFAULT ((0)) FOR [MicrositeDefault]
GO
