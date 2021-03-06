USE [Meybohm_com]
GO
/****** Object:  Table [dbo].[UserTestimonial]    Script Date: 09/12/2013 08:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTestimonial](
	[UserTestimonialID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Testimonial] [varchar](255) NOT NULL,
	[GiverNameAndLocation] [varchar](500) NULL,
 CONSTRAINT [PK_UserTestimonial] PRIMARY KEY CLUSTERED 
(
	[UserTestimonialID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserTestimonial]  WITH NOCHECK ADD  CONSTRAINT [FK_UserTestimonial_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTestimonial] CHECK CONSTRAINT [FK_UserTestimonial_User]
GO
