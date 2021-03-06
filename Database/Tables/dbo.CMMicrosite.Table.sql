USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMMicrosite]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMMicrosite](
	[CMMicroSiteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[Description] [varchar](1000) NULL,
	[Location] [varchar](255) NULL,
	[Image] [varchar](255) NULL,
	[Phone] [varchar](25) NULL,
 CONSTRAINT [PK_CMMicrosite] PRIMARY KEY CLUSTERED 
(
	[CMMicroSiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UC_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CMMicrosite] ADD  CONSTRAINT [DF_CMMicrosite_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[CMMicrosite] ADD  CONSTRAINT [DF_CMMicrosite_Published]  DEFAULT ((0)) FOR [Published]
GO
