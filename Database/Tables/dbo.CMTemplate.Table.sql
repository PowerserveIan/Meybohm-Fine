USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMTemplate]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMTemplate](
	[CMTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Addable] [bit] NOT NULL,
	[MicrositeEnabled] [bit] NOT NULL,
	[FileName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_CMTemplate] PRIMARY KEY CLUSTERED 
(
	[CMTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CMTemplate] ADD  CONSTRAINT [DF_CMTemplates_Addable]  DEFAULT ((0)) FOR [Addable]
GO
ALTER TABLE [dbo].[CMTemplate] ADD  CONSTRAINT [DF_CMTemplates_MicrositeEnabled]  DEFAULT ((0)) FOR [MicrositeEnabled]
GO
