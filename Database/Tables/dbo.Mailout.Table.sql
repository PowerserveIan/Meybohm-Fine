USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Mailout]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mailout](
	[MailoutID] [int] IDENTITY(1,1) NOT NULL,
	[NewsletterID] [int] NULL,
	[Timestamp] [datetime] NOT NULL,
	[DisplayDate] [datetime] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Issue] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Body] [text] NULL,
	[BodyText] [text] NULL,
	[Keywords] [text] NULL,
	[DesignID] [int] NULL,
 CONSTRAINT [PK_Mailout] PRIMARY KEY CLUSTERED 
(
	[MailoutID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Mailout]  WITH CHECK ADD  CONSTRAINT [FK_Mailout_Newsletter] FOREIGN KEY([NewsletterID])
REFERENCES [dbo].[Newsletter] ([NewsletterID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Mailout] CHECK CONSTRAINT [FK_Mailout_Newsletter]
GO
