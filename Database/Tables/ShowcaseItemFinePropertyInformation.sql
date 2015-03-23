/****** Object:  Table [dbo].[ShowcaseItemFinePropertyInformation]    Script Date: 11/11/2013 11:02:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShowcaseItemFinePropertyInformation](
	[ShowcaseItemFinePropertyInformationId] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemId] [int] NOT NULL,
	[IsFine] [bit] NOT NULL,
	[Description] [varchar](6000) NULL,
	[IsFineFeatured] [bit] NOT NULL,
	[Features] [varchar](2000) NULL,
	[Tags] [varchar](255) NULL,
 CONSTRAINT [PK_ShowcaseItemFinePropertyInformationId] PRIMARY KEY CLUSTERED 
(
	[ShowcaseItemFinePropertyInformationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ShowcaseItemFinePropertyInformation]  WITH NOCHECK ADD  CONSTRAINT [FK_ShowcaseItemFinePropertyInformation_ShowcaseItem] FOREIGN KEY([ShowcaseItemId])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
GO

ALTER TABLE [dbo].[ShowcaseItemFinePropertyInformation] NOCHECK CONSTRAINT [FK_ShowcaseItemFinePropertyInformation_ShowcaseItem]
GO

ALTER TABLE [dbo].[ShowcaseItemFinePropertyInformation] ADD  CONSTRAINT [DF_ShowcaseItemFinePropertyInformation_IsFine]  DEFAULT ((0)) FOR [IsFine]
GO

ALTER TABLE [dbo].[ShowcaseItemFinePropertyInformation] ADD  CONSTRAINT [DF_ShowcaseItemFinePropertyInformation_IsFineFeatured]  DEFAULT ((0)) FOR [IsFineFeatured]
GO


