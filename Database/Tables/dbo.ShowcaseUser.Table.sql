USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseUser]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowcaseUser](
	[ShowcaseUserID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ShowcaseUser] PRIMARY KEY CLUSTERED 
(
	[ShowcaseUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShowcaseUser]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseUser_Showcase] FOREIGN KEY([ShowcaseID])
REFERENCES [dbo].[Showcase] ([ShowcaseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseUser] CHECK CONSTRAINT [FK_ShowcaseUser_Showcase]
GO
ALTER TABLE [dbo].[ShowcaseUser]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseUser] CHECK CONSTRAINT [FK_ShowcaseUser_User]
GO
