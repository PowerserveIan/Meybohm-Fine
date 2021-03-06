USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[State]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Abb] [varchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[ShipTo] [bit] NOT NULL,
	[ShippingMarkup] [money] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[State]  WITH NOCHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_ShipTo]  DEFAULT ((1)) FOR [ShipTo]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_ShippingMarkup]  DEFAULT ((0)) FOR [ShippingMarkup]
GO
