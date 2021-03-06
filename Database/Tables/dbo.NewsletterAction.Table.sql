USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsletterAction]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsletterAction](
	[NewsletterActionID] [bigint] IDENTITY(1,1) NOT NULL,
	[NewsletterActionTypeID] [int] NOT NULL,
	[MailoutID] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[IPAddress] [varchar](50) NULL,
	[SubscriberID] [int] NULL,
	[Email] [varchar](200) NULL,
	[Details] [varchar](max) NULL,
 CONSTRAINT [PK_NewsletterAction] PRIMARY KEY CLUSTERED 
(
	[NewsletterActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[NewsletterAction]  WITH NOCHECK ADD  CONSTRAINT [FK_NewsletterAction_Mailout] FOREIGN KEY([MailoutID])
REFERENCES [dbo].[Mailout] ([MailoutID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsletterAction] CHECK CONSTRAINT [FK_NewsletterAction_Mailout]
GO
ALTER TABLE [dbo].[NewsletterAction]  WITH NOCHECK ADD  CONSTRAINT [FK_NewsletterAction_NewsletterActionType] FOREIGN KEY([NewsletterActionTypeID])
REFERENCES [dbo].[NewsletterActionType] ([NewsletterActionTypeID])
GO
ALTER TABLE [dbo].[NewsletterAction] CHECK CONSTRAINT [FK_NewsletterAction_NewsletterActionType]
GO
ALTER TABLE [dbo].[NewsletterAction]  WITH NOCHECK ADD  CONSTRAINT [FK_NewsletterAction_Subscriber] FOREIGN KEY([SubscriberID])
REFERENCES [dbo].[Subscriber] ([SubscriberID])
GO
ALTER TABLE [dbo].[NewsletterAction] NOCHECK CONSTRAINT [FK_NewsletterAction_Subscriber]
GO
