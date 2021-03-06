USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMMicrositeUser]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMMicrositeUser](
	[CMMicrositeUserID] [int] IDENTITY(1,1) NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_CMMicrositeUser] PRIMARY KEY CLUSTERED 
(
	[CMMicrositeUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CMMicrositeUser]  WITH CHECK ADD  CONSTRAINT [FK_CMMicrositeUser_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMMicrositeUser] CHECK CONSTRAINT [FK_CMMicrositeUser_CMMicrosite]
GO
ALTER TABLE [dbo].[CMMicrositeUser]  WITH CHECK ADD  CONSTRAINT [FK_CMMicrositeUser_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMMicrositeUser] CHECK CONSTRAINT [FK_CMMicrositeUser_User]
GO
