USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseAttribute]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseAttribute](
	[ShowcaseAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[ShowcaseFilterID] [int] NOT NULL,
	[Numeric] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[DisplayOrder] [smallint] NULL,
	[ShowcaseID] [int] NOT NULL,
	[ImportItemAttribute] [bit] NOT NULL,
	[MLSAttributeName] [varchar](50) NULL,
	[MinimumValue] [decimal](12, 2) NULL,
	[MaximumValue] [decimal](12, 2) NULL,
	[SingleItemValue] [bit] NOT NULL,
 CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
(
	[ShowcaseAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseAttribute_Showcase] FOREIGN KEY([ShowcaseID])
REFERENCES [dbo].[Showcase] ([ShowcaseID])
GO
ALTER TABLE [dbo].[ShowcaseAttribute] CHECK CONSTRAINT [FK_ShowcaseAttribute_Showcase]
GO
ALTER TABLE [dbo].[ShowcaseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseAttribute_ShowcaseFilter] FOREIGN KEY([ShowcaseFilterID])
REFERENCES [dbo].[ShowcaseFilter] ([ShowcaseFilterID])
GO
ALTER TABLE [dbo].[ShowcaseAttribute] CHECK CONSTRAINT [FK_ShowcaseAttribute_ShowcaseFilter]
GO
ALTER TABLE [dbo].[ShowcaseAttribute] ADD  CONSTRAINT [DF_ShowcaseAttribute_ImportItemAttribute]  DEFAULT ((0)) FOR [ImportItemAttribute]
GO
ALTER TABLE [dbo].[ShowcaseAttribute] ADD  CONSTRAINT [DF_ShowcaseAttribute_SingleItemValue]  DEFAULT ((0)) FOR [SingleItemValue]
GO
