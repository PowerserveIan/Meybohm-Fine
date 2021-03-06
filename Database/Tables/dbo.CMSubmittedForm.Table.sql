USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[CMSubmittedForm]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMSubmittedForm](
	[CMSubmittedFormID] [int] IDENTITY(1,1) NOT NULL,
	[FormHTML] [varchar](max) NOT NULL,
	[ResponsePageID] [int] NULL,
	[DateSubmitted] [datetime] NOT NULL,
	[FormRecipient] [varchar](255) NULL,
	[IsProcessed] [bit] NOT NULL,
	[CMMicrositeID] [int] NULL,
	[UploadedFile] [varchar](50) NULL,
 CONSTRAINT [PK_CMSubmittedForm] PRIMARY KEY CLUSTERED 
(
	[CMSubmittedFormID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CMSubmittedForm]  WITH CHECK ADD  CONSTRAINT [FK_CMSubmittedForm_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CMSubmittedForm] CHECK CONSTRAINT [FK_CMSubmittedForm_CMMicrosite]
GO
ALTER TABLE [dbo].[CMSubmittedForm]  WITH NOCHECK ADD  CONSTRAINT [FK_CMSubmittedForm_CMPage] FOREIGN KEY([ResponsePageID])
REFERENCES [dbo].[CMPage] ([CMPageID])
GO
ALTER TABLE [dbo].[CMSubmittedForm] CHECK CONSTRAINT [FK_CMSubmittedForm_CMPage]
GO
ALTER TABLE [dbo].[CMSubmittedForm] ADD  CONSTRAINT [DF_CMSubmittedForm_IsProcessed]  DEFAULT ((0)) FOR [IsProcessed]
GO
