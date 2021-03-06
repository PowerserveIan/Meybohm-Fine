USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 09/12/2013 08:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Office](
	[OfficeID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CMMicrositeID] [int] NOT NULL,
	[MlsID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NOT NULL,
	[Fax] [varchar](25) NULL,
	[HasNewHomes] [bit] NOT NULL,
	[HasRentals] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Image] [varchar](255) NULL,
	[IsMeybohm] [bit] NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Office]  WITH NOCHECK ADD  CONSTRAINT [FK_Office_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_Address]
GO
ALTER TABLE [dbo].[Office]  WITH CHECK ADD  CONSTRAINT [FK_Office_CMMicrosite] FOREIGN KEY([CMMicrositeID])
REFERENCES [dbo].[CMMicrosite] ([CMMicroSiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Office] CHECK CONSTRAINT [FK_Office_CMMicrosite]
GO
ALTER TABLE [dbo].[Office] ADD  CONSTRAINT [DF_Office_HasNewHomes]  DEFAULT ((0)) FOR [HasNewHomes]
GO
ALTER TABLE [dbo].[Office] ADD  CONSTRAINT [DF_Office_HasRentals]  DEFAULT ((0)) FOR [HasRentals]
GO
ALTER TABLE [dbo].[Office] ADD  CONSTRAINT [DF_Office_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Office] ADD  CONSTRAINT [DF_Office_IsMeybohm]  DEFAULT ((1)) FOR [IsMeybohm]
GO
