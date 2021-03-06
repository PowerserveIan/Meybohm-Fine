USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[MailoutMailingList]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailoutMailingList](
	[MailoutMailingListID] [int] IDENTITY(1,1) NOT NULL,
	[MailingListID] [int] NOT NULL,
	[MailoutID] [int] NOT NULL,
 CONSTRAINT [PK_MailingListMailout] PRIMARY KEY CLUSTERED 
(
	[MailoutMailingListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MailoutMailingList]  WITH CHECK ADD  CONSTRAINT [FK_MailoutMailingList_MailingList] FOREIGN KEY([MailingListID])
REFERENCES [dbo].[MailingList] ([MailingListID])
GO
ALTER TABLE [dbo].[MailoutMailingList] CHECK CONSTRAINT [FK_MailoutMailingList_MailingList]
GO
ALTER TABLE [dbo].[MailoutMailingList]  WITH CHECK ADD  CONSTRAINT [FK_MailoutMailingList_Mailout] FOREIGN KEY([MailoutID])
REFERENCES [dbo].[Mailout] ([MailoutID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MailoutMailingList] CHECK CONSTRAINT [FK_MailoutMailingList_Mailout]
GO
