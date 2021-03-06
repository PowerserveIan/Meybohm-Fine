USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseAttributeHeader]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseAttributeHeader](
	[ShowcaseAttributeHeaderID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseAttributeID] [int] NOT NULL,
	[Text] [varchar](20) NOT NULL,
	[NoPreferenceColumn] [bit] NOT NULL,
 CONSTRAINT [PK_ShowcaseAttributeHeader] PRIMARY KEY CLUSTERED 
(
	[ShowcaseAttributeHeaderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseAttributeHeader]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseAttributeHeader_ShowcaseAttribute] FOREIGN KEY([ShowcaseAttributeID])
REFERENCES [dbo].[ShowcaseAttribute] ([ShowcaseAttributeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseAttributeHeader] CHECK CONSTRAINT [FK_ShowcaseAttributeHeader_ShowcaseAttribute]
GO
ALTER TABLE [dbo].[ShowcaseAttributeHeader] ADD  CONSTRAINT [DF_ShowcaseAttributeHeader_NoPreferenceColumn]  DEFAULT ((0)) FOR [NoPreferenceColumn]
GO
