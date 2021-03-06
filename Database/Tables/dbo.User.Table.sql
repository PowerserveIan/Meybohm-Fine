USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](382) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[UniqueEmail] [int] NOT NULL,
	[Salt] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[PasswordQuestion] [varchar](50) NULL,
	[PasswordAnswer] [varchar](255) NULL,
	[PasswordFormat] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[LastActivity] [datetime] NOT NULL,
	[LastPasswordChange] [datetime] NOT NULL,
	[LastLockout] [datetime] NULL,
	[FailedPasswordAttempts] [int] NOT NULL,
	[FailedAnswerAttempts] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[Online] [bit] NOT NULL,
	[ChangePasswordID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Application]
GO
