USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[PropertyStatisticsEmailLog]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropertyStatisticsEmailLog](
	[PropertyStatisticsEmailLogID] [int] IDENTITY(1,1) NOT NULL,
	[ShowcaseItemID] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[TimeSent] [datetime] NOT NULL,
 CONSTRAINT [PK_PropertyStatisticsEmailLogID] PRIMARY KEY CLUSTERED 
(
	[PropertyStatisticsEmailLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PropertyStatisticsEmailLog]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStatisticsEmailLogID_ShowcaseItem] FOREIGN KEY([ShowcaseItemID])
REFERENCES [dbo].[ShowcaseItem] ([ShowcaseItemID])
GO
ALTER TABLE [dbo].[PropertyStatisticsEmailLog] CHECK CONSTRAINT [FK_PropertyStatisticsEmailLogID_ShowcaseItem]
GO
