USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Showcase]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Showcase](
	[ShowcaseID] [int] IDENTITY(1,1) NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[MLSData] [bit] NOT NULL,
 CONSTRAINT [PK_Showcase_1] PRIMARY KEY CLUSTERED 
(
	[ShowcaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Showcase]  WITH NOCHECK ADD  CONSTRAINT [FK_Showcase_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
GO
ALTER TABLE [dbo].[Showcase] NOCHECK CONSTRAINT [FK_Showcase_CMMicrosite]
GO
ALTER TABLE [dbo].[Showcase] ADD  CONSTRAINT [DF_Showcase_CMMicrositeID]  DEFAULT ((2)) FOR [CMMicrositeID]
GO
ALTER TABLE [dbo].[Showcase] ADD  CONSTRAINT [DF_Showcase_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Showcase] ADD  CONSTRAINT [DF_Showcase_MLSData_1]  DEFAULT ((1)) FOR [MLSData]
GO
