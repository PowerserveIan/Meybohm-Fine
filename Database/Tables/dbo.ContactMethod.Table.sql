USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ContactMethod]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactMethod](
	[ContactMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ContactMethod] PRIMARY KEY CLUSTERED 
(
	[ContactMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
