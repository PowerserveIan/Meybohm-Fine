USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[TeamLanguageSpoken]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamLanguageSpoken](
	[TeamLanguageSpokenID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_TeamLanguageSpoken] PRIMARY KEY CLUSTERED 
(
	[TeamLanguageSpokenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TeamLanguageSpoken]  WITH CHECK ADD  CONSTRAINT [FK_TeamLanguageSpoken_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamLanguageSpoken] CHECK CONSTRAINT [FK_TeamLanguageSpoken_Languages]
GO
ALTER TABLE [dbo].[TeamLanguageSpoken]  WITH NOCHECK ADD  CONSTRAINT [FK_TeamLanguageSpoken_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamLanguageSpoken] CHECK CONSTRAINT [FK_TeamLanguageSpoken_Team]
GO
