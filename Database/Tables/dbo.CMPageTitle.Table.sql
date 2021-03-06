USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMPageTitle]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMPageTitle](
	[CMPageTitleID] [int] IDENTITY(1,1) NOT NULL,
	[CMPageID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_CMPageTitle] PRIMARY KEY CLUSTERED 
(
	[CMPageTitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CMPageTitle]  WITH CHECK ADD  CONSTRAINT [FK_CMPageTitle_CMPage] FOREIGN KEY([CMPageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMPageTitle] CHECK CONSTRAINT [FK_CMPageTitle_CMPage]
GO
ALTER TABLE [dbo].[CMPageTitle]  WITH CHECK ADD  CONSTRAINT [FK_CMPageTitle_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[CMPageTitle] CHECK CONSTRAINT [FK_CMPageTitle_Languages]
GO
ALTER TABLE [dbo].[CMPageTitle] ADD  CONSTRAINT [DF_CMPageTitle_CMPageID]  DEFAULT ((1033)) FOR [CMPageID]
GO
