USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NewsletterActionType]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsletterActionType](
	[NewsletterActionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[DisplayName] [varchar](50) NULL,
 CONSTRAINT [PK_NewsletterActionType] PRIMARY KEY CLUSTERED 
(
	[NewsletterActionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
