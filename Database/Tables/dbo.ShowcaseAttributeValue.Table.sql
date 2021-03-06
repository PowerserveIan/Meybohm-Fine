USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[ShowcaseAttributeValue]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShowcaseAttributeValue](
	[ShowcaseAttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](500) NOT NULL,
	[DisplayOrder] [smallint] NOT NULL,
	[ShowcaseAttributeID] [int] NOT NULL,
	[UpperRangeValue] [varchar](50) NULL,
	[DisplayInFilters] [bit] NOT NULL,
 CONSTRAINT [PK_AttributeValue] PRIMARY KEY CLUSTERED 
(
	[ShowcaseAttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ShowcaseAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_ShowcaseAttributeValue_ShowcaseAttribute] FOREIGN KEY([ShowcaseAttributeID])
REFERENCES [dbo].[ShowcaseAttribute] ([ShowcaseAttributeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShowcaseAttributeValue] CHECK CONSTRAINT [FK_ShowcaseAttributeValue_ShowcaseAttribute]
GO
ALTER TABLE [dbo].[ShowcaseAttributeValue] ADD  CONSTRAINT [DF_ShowcaseAttributeValue_DisplayOrder]  DEFAULT ((50)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ShowcaseAttributeValue] ADD  CONSTRAINT [DF_ShowcaseAttributeValue_DisplayInFilters]  DEFAULT ((1)) FOR [DisplayInFilters]
GO
