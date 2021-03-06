USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[SEOData]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEOData](
	[SEODataID] [int] IDENTITY(1,1) NOT NULL,
	[PageURL] [varchar](250) NOT NULL,
	[FriendlyFilename] [varchar](50) NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Keywords] [varchar](500) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateLastUpdated] [datetime] NOT NULL,
	[LanguageID] [int] NULL,
	[Approved] [bit] NOT NULL,
	[ApprovedSEODataID] [int] NULL,
 CONSTRAINT [PK_SEOData] PRIMARY KEY CLUSTERED 
(
	[SEODataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SEOData]  WITH CHECK ADD  CONSTRAINT [FK_SEOData_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[SEOData] CHECK CONSTRAINT [FK_SEOData_Languages]
GO
ALTER TABLE [dbo].[SEOData]  WITH CHECK ADD  CONSTRAINT [FK_SEOData_SEOData] FOREIGN KEY([ApprovedSEODataID])
REFERENCES [dbo].[SEOData] ([SEODataID])
GO
ALTER TABLE [dbo].[SEOData] CHECK CONSTRAINT [FK_SEOData_SEOData]
GO
ALTER TABLE [dbo].[SEOData] ADD  CONSTRAINT [DF_SEOData_Approved]  DEFAULT ((1)) FOR [Approved]
GO
