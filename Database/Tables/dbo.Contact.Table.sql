USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeID] [int] NOT NULL,
	[ContactStatusID] [int] NOT NULL,
	[ContactTimeID] [int] NOT NULL,
	[ContactMethodID] [int] NOT NULL,
	[AddressID] [int] NULL,
	[AgentID] [int] NULL,
	[TeamID] [int] NULL,
	[CMMicrositeID] [int] NULL,
	[ShowcaseItemID] [int] NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Email] [varchar](382) NULL,
	[Message] [varchar](1000) NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Contact]  WITH NOCHECK ADD  CONSTRAINT [FK_Contact_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Address]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_CMMicrosite]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactMethod] FOREIGN KEY([ContactMethodID])
REFERENCES [dbo].[ContactMethod] ([ContactMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactMethod]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactStatus] FOREIGN KEY([ContactStatusID])
REFERENCES [dbo].[ContactStatus] ([ContactStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactStatus]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactTime] FOREIGN KEY([ContactTimeID])
REFERENCES [dbo].[ContactTime] ([ContactTimeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactTime]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactType] FOREIGN KEY([ContactTypeID])
REFERENCES [dbo].[ContactType] ([ContactTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactType]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ShowcaseItem]
GO
ALTER TABLE [dbo].[Contact]  WITH NOCHECK ADD  CONSTRAINT [FK_Contact_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Contact] NOCHECK CONSTRAINT [FK_Contact_Team]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_User] FOREIGN KEY([AgentID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_User]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Created]  DEFAULT (getdate()) FOR [Created]
GO
