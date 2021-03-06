USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[MailingListSubscriber]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailingListSubscriber](
	[MailingListSubscriberID] [int] IDENTITY(1,1) NOT NULL,
	[MailingListID] [int] NOT NULL,
	[SubscriberID] [int] NOT NULL,
	[NewsletterFormatID] [int] NULL,
	[Active] [bit] NOT NULL,
	[EntityID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MailingListSubscriber] PRIMARY KEY CLUSTERED 
(
	[MailingListSubscriberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MailingListSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_MailingListSubscriber_MailingList] FOREIGN KEY([MailingListID])
REFERENCES [dbo].[MailingList] ([MailingListID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MailingListSubscriber] CHECK CONSTRAINT [FK_MailingListSubscriber_MailingList]
GO
ALTER TABLE [dbo].[MailingListSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_MailingListSubscriber_NewsletterFormat] FOREIGN KEY([NewsletterFormatID])
REFERENCES [dbo].[NewsletterFormat] ([NewsletterFormatID])
GO
ALTER TABLE [dbo].[MailingListSubscriber] CHECK CONSTRAINT [FK_MailingListSubscriber_NewsletterFormat]
GO
ALTER TABLE [dbo].[MailingListSubscriber]  WITH CHECK ADD  CONSTRAINT [FK_MailingListSubscriber_Subscriber] FOREIGN KEY([SubscriberID])
REFERENCES [dbo].[Subscriber] ([SubscriberID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MailingListSubscriber] CHECK CONSTRAINT [FK_MailingListSubscriber_Subscriber]
GO
