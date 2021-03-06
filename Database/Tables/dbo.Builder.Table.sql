USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Builder]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Builder](
	[BuilderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[OwnerName] [varchar](500) NULL,
	[Image] [varchar](255) NULL,
	[Website] [varchar](1000) NULL,
	[Info] [varchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Builder] PRIMARY KEY CLUSTERED 
(
	[BuilderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Builder] ADD  CONSTRAINT [DF_Builder_Active]  DEFAULT ((1)) FOR [Active]
GO
