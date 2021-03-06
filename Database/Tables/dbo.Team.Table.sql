USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[MlsID] [varchar](50) NOT NULL,
	[Photo] [varchar](255) NULL,
	[Email] [varchar](382) NOT NULL,
	[DisplayInDirectory] [bit] NOT NULL,
	[Phone] [varchar](20) NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_CMMicrosite]
GO
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF_Team_CMMicrositeID]  DEFAULT ((2)) FOR [CMMicrositeID]
GO
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF_Team_MlsID]  DEFAULT ('1') FOR [MlsID]
GO
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF_Team_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF_Team_DisplayInDirectory]  DEFAULT ((0)) FOR [DisplayInDirectory]
GO
