USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserOffice]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserOffice](
	[UserOfficeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OfficeID] [int] NOT NULL,
	[MlsID] [varchar](50) NULL,
 CONSTRAINT [PK_UserOffice] PRIMARY KEY CLUSTERED 
(
	[UserOfficeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserOffice]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOffice_Office] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Office] ([OfficeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserOffice] CHECK CONSTRAINT [FK_UserOffice_Office]
GO
ALTER TABLE [dbo].[UserOffice]  WITH NOCHECK ADD  CONSTRAINT [FK_UserOffice_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserOffice] CHECK CONSTRAINT [FK_UserOffice_User]
GO
