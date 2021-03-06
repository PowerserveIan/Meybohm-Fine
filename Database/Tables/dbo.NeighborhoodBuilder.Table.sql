USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[NeighborhoodBuilder]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeighborhoodBuilder](
	[NeighborhoodBuilderID] [int] IDENTITY(1,1) NOT NULL,
	[NeighborhoodID] [int] NOT NULL,
	[BuilderID] [int] NOT NULL,
 CONSTRAINT [PK_NeighborhoodBuilder] PRIMARY KEY CLUSTERED 
(
	[NeighborhoodBuilderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NeighborhoodBuilder]  WITH NOCHECK ADD  CONSTRAINT [FK_NeighborhoodBuilder_Builder] FOREIGN KEY([BuilderID])
REFERENCES [dbo].[Builder] ([BuilderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeighborhoodBuilder] CHECK CONSTRAINT [FK_NeighborhoodBuilder_Builder]
GO
ALTER TABLE [dbo].[NeighborhoodBuilder]  WITH NOCHECK ADD  CONSTRAINT [FK_NeighborhoodBuilder_Neighborhood] FOREIGN KEY([NeighborhoodID])
REFERENCES [dbo].[Neighborhood] ([NeighborhoodID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NeighborhoodBuilder] CHECK CONSTRAINT [FK_NeighborhoodBuilder_Neighborhood]
GO
