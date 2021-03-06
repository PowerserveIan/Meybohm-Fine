USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Subscriber]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subscriber](
	[SubscriberID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Email] [varchar](382) NOT NULL,
	[DefaultNewsletterFormatID] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Subscriber] PRIMARY KEY CLUSTERED 
(
	[SubscriberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Subscriber]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriber_Format] FOREIGN KEY([DefaultNewsletterFormatID])
REFERENCES [dbo].[NewsletterFormat] ([NewsletterFormatID])
GO
ALTER TABLE [dbo].[Subscriber] CHECK CONSTRAINT [FK_Subscriber_Format]
GO
ALTER TABLE [dbo].[Subscriber]  WITH CHECK ADD  CONSTRAINT [CK_Subscriber] CHECK  (([dbo].[ValidateEmail]([Email])=(1)))
GO
ALTER TABLE [dbo].[Subscriber] CHECK CONSTRAINT [CK_Subscriber]
GO
ALTER TABLE [dbo].[Subscriber] ADD  CONSTRAINT [DF_Subscriber_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
