USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserLanguageSpoken]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLanguageSpoken](
	[UserLanguageSpokenID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_UserLanguageSpoken] PRIMARY KEY CLUSTERED 
(
	[UserLanguageSpokenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserLanguageSpoken]  WITH CHECK ADD  CONSTRAINT [FK_UserLanguageSpoken_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLanguageSpoken] CHECK CONSTRAINT [FK_UserLanguageSpoken_Languages]
GO
ALTER TABLE [dbo].[UserLanguageSpoken]  WITH NOCHECK ADD  CONSTRAINT [FK_UserLanguageSpoken_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLanguageSpoken] CHECK CONSTRAINT [FK_UserLanguageSpoken_User]
GO
