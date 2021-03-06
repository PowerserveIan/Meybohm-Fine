USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserOpenAuthProvider]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserOpenAuthProvider](
	[UserOpenAuthProviderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[ProviderID] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UserOpenAuthProvider] PRIMARY KEY CLUSTERED 
(
	[UserOpenAuthProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserOpenAuthProvider]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOpenAuthProvider_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserOpenAuthProvider] CHECK CONSTRAINT [FK_UserOpenAuthProvider_User]
GO
