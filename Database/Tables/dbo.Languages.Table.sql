USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Culture] [nvarchar](100) NOT NULL,
	[CultureName] [varchar](20) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_CultureName]  DEFAULT ('en') FOR [CultureName]
GO
ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_Enabled]  DEFAULT ((1)) FOR [Active]
GO
