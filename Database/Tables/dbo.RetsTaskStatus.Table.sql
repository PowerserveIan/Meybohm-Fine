USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[RetsTaskStatus]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetsTaskStatus](
	[RetsTaskStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RetsTaskID] [int] NOT NULL,
	[RetsStatusID] [int] NOT NULL,
	[TaskCompleteTime] [datetime] NOT NULL,
 CONSTRAINT [PK_RetsTaskStatus] PRIMARY KEY CLUSTERED 
(
	[RetsTaskStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RetsTaskStatus]  WITH CHECK ADD  CONSTRAINT [FK_RetsTaskStatus_RetsStatus] FOREIGN KEY([RetsStatusID])
REFERENCES [dbo].[RetsStatus] ([RetsStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RetsTaskStatus] CHECK CONSTRAINT [FK_RetsTaskStatus_RetsStatus]
GO
ALTER TABLE [dbo].[RetsTaskStatus]  WITH CHECK ADD  CONSTRAINT [FK_RetsTaskStatus_RetsTask] FOREIGN KEY([RetsTaskID])
REFERENCES [dbo].[RetsTask] ([RetsTaskID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RetsTaskStatus] CHECK CONSTRAINT [FK_RetsTaskStatus_RetsTask]
GO
