USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserDesignation]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDesignation](
	[UserDesignationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DesignationID] [int] NOT NULL,
 CONSTRAINT [PK_UserDesignation] PRIMARY KEY CLUSTERED 
(
	[UserDesignationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDesignation]  WITH NOCHECK ADD  CONSTRAINT [FK_UserDesignation_Designation] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designation] ([DesignationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDesignation] CHECK CONSTRAINT [FK_UserDesignation_Designation]
GO
ALTER TABLE [dbo].[UserDesignation]  WITH NOCHECK ADD  CONSTRAINT [FK_UserDesignation_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDesignation] CHECK CONSTRAINT [FK_UserDesignation_User]
GO
