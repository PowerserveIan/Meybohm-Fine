USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[WhatsNearByLocation]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WhatsNearByLocation](
	[WhatsNearByLocationID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Phone] [varchar](25) NULL,
	[Website] [varchar](1000) NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_WhatsNearByLocation] PRIMARY KEY CLUSTERED 
(
	[WhatsNearByLocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[WhatsNearByLocation]  WITH NOCHECK ADD  CONSTRAINT [FK_WhatsNearByLocation_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WhatsNearByLocation] CHECK CONSTRAINT [FK_WhatsNearByLocation_Address]
GO
ALTER TABLE [dbo].[WhatsNearByLocation] ADD  CONSTRAINT [DF_WhatsNearByLocation_Active]  DEFAULT ((1)) FOR [Active]
GO
