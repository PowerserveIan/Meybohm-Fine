USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[RetsUpdatePageTracker]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetsUpdatePageTracker](
	[RetsUpdatePageTrackerID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentRunStartTime] [datetime] NOT NULL,
	[RunCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_RetsUpdatePageTracker] PRIMARY KEY CLUSTERED 
(
	[RetsUpdatePageTrackerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
