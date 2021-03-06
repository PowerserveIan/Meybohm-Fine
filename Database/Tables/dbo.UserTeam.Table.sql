USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserTeam]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTeam](
	[UserTeamID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_UserTeam] PRIMARY KEY CLUSTERED 
(
	[UserTeamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserTeam]  WITH NOCHECK ADD  CONSTRAINT [FK_UserTeam_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTeam] CHECK CONSTRAINT [FK_UserTeam_Team]
GO
ALTER TABLE [dbo].[UserTeam]  WITH NOCHECK ADD  CONSTRAINT [FK_UserTeam_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTeam] CHECK CONSTRAINT [FK_UserTeam_User]
GO
