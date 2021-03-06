USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[DynamicCollection]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DynamicCollection](
	[DynamicCollectionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_DynamicCollection] PRIMARY KEY CLUSTERED 
(
	[DynamicCollectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DynamicCollection] ADD  CONSTRAINT [DF_DynamicCollection_Active]  DEFAULT ((0)) FOR [Active]
GO
