USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsletterDesign]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsletterDesign](
	[NewsletterDesignID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Path] [varchar](150) NULL,
	[Template] [text] NULL,
 CONSTRAINT [PK_NewsletterDesign] PRIMARY KEY CLUSTERED 
(
	[NewsletterDesignID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
