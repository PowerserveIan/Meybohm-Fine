USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[BuilderMicrosite]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuilderMicrosite](
	[BuilderMicrositeID] [int] IDENTITY(1,1) NOT NULL,
	[BuilderID] [int] NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
 CONSTRAINT [PK_BuilderMicrosite] PRIMARY KEY CLUSTERED 
(
	[BuilderMicrositeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BuilderMicrosite]  WITH CHECK ADD  CONSTRAINT [FK_BuilderMicrosite_Builder] FOREIGN KEY([BuilderID])
REFERENCES [dbo].[Builder] ([BuilderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuilderMicrosite] CHECK CONSTRAINT [FK_BuilderMicrosite_Builder]
GO
ALTER TABLE [dbo].[BuilderMicrosite]  WITH CHECK ADD  CONSTRAINT [FK_BuilderMicrosite_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuilderMicrosite] CHECK CONSTRAINT [FK_BuilderMicrosite_CMMicrosite]
GO
