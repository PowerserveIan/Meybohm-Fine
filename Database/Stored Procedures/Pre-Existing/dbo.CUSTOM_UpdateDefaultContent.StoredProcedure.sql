USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_UpdateDefaultContent]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_UpdateDefaultContent]
	@ComponentName varchar(50) = NULL,
	@Delete bit
AS
BEGIN
	DECLARE @todaysDate datetime
	SET @todaysDate = (select CAST(FLOOR(CAST(getdate() AS DECIMAL(12, 5))) AS DATETIME))
	IF (@Delete = 'true')
	BEGIN
		IF (@ComponentName IS NULL)
		BEGIN
			DELETE FROM UserRole
			DELETE FROM UserInfo
			DELETE FROM SEOData
			DELETE FROM [User] WHERE UserID != 1
			DELETE FROM SecurityQuestion
			DELETE FROM [Role] WHERE SystemRole = 0
			
			DBCC CHECKIDENT([User], RESEED, 1)WITH NO_INFOMSGS
			DBCC CHECKIDENT([UserRole], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([UserInfo], RESEED, 0)WITH NO_INFOMSGS
			
			--SET IDENTITY_INSERT UserInfo ON
			--	INSERT UserInfo(UserInfoId,UserID,FirstName,LastName,Address1,Address2,City,StateID,State,CountryID,Zip,Phone)       VALUES('1','1','Admin','McAdmin','422 SW 140th Terrace','','Newberry','10','','1','32669','(877)352-6334')
			--SET IDENTITY_INSERT UserInfo OFF

			INSERT INTO [UserRole] (UserID, RoleID) VALUES (1, 1)
			UPDATE [User] SET	Email = 'admin@352media.com',
								IsApproved = 'True',
								UniqueEmail = 1,
								Salt = '',
								[Password] = 'dev1332',
								PasswordQuestion = 'Admin password question',
								PasswordAnswer = 'Admin password answer',
								PasswordFormat = 0,
								FailedPasswordAttempts = 0,
								FailedAnswerAttempts = 0,
								Deleted = 'False',
								Locked = 'False'
			WHERE UserID = 1 
						
			DECLARE @UserID int
			DECLARE @RoleID int

			/*Blog Editor*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352blogeditor','352blogeditor@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Blog Editor')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*CMS Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352cmsadmin','352cmsadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'CMS Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*CMS Content Integrator*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352cmscontentintegrator','352cmscontentintegrator@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'CMS Content Integrator')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*CMS Page Manager*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352cmspagemanager','352cmspagemanager@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'CMS Page Manager')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Dynamic Header Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352dynamicheaderadmin','352dynamicheaderadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'DynamicHeader Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*E-Commerce Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352ecommerceadmin','352ecommerceadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'E-Commerce Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Events Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352eventsadmin','352eventsadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Events Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Member*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352member','352member@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)

			/*Newsletter Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352newsletteradmin','352newsletteradmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Newsletter Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*News Press Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352newspressadmin','352newspressadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Newspress Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Open Payment Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352openpaymentadmin','352openpaymentadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'OpenPayment Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Polls Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352pollsadmin','352pollsadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Polls Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Product Catalog Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352productcatalogadmin','352productcatalogadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Product Catalog Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Search Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352searchadmin','352searchadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Search Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Showcase Admin*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352showcaseadmin','352showcaseadmin@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Showcase Admin')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)

			/*Showcase Manager*/
			INSERT INTO [User] ([ApplicationID],[Name],[Email],[IsApproved],[UniqueEmail],[Salt],[Password],[PasswordQuestion],[PasswordAnswer],[PasswordFormat],[Created],[LastLogin],[LastActivity],[LastPasswordChange],[LastLockout],[FailedPasswordAttempts],[FailedAnswerAttempts],[Deleted],[Locked],[Online])
			VALUES (1,'352showcasemanager','352showcasemanager@352media.com',1,1,'','dev1332','Admin password question','Admin password answer',0,GETDATE(),GETDATE(),GETDATE(),GETDATE(),NULL,0,0,0,0,0)
			SET @UserID = @@identity
			SET @RoleID = (SELECT RoleID FROM [Role] WHERE [Name] = 'Showcase Manager')
			INSERT INTO [dbo].[UserRole] ([UserID],[RoleID]) VALUES (@UserID,@RoleID)
			INSERT INTO [dbo].[UserInfo] ([UserID]) VALUES (@UserID)
			
			INSERT SecurityQuestion(Question,Active) VALUES('What was your first pet''s name?','1')
			INSERT SecurityQuestion(Question,Active) VALUES('What was your high school mascot?','1')
			INSERT SecurityQuestion(Question,Active) VALUES('What is your favorite color?','1')			
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Blog') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'be_Pages'))
		BEGIN			
			DELETE FROM be_PostCategory
			DELETE FROM be_PostTag
			DELETE FROM be_Categories
			DELETE FROM be_Pages
			DELETE FROM be_PostComment
			DELETE FROM be_PostNotify
			DELETE FROM be_Posts
			DELETE FROM be_BlogRollItems
			DELETE FROM be_Blogs
			DELETE FROM be_Settings
			DELETE FROM be_PingService
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Content Manager') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CMPage'))
		BEGIN
			DELETE FROM SMItem
			DELETE FROM CMPageRegion
			DELETE FROM CMPage
			DELETE FROM CMSubmittedForm
			DELETE FROM CMMicrosite		
			DELETE FROM CMPageRole
			
			DBCC CHECKIDENT(SMItem, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(CMPageRegion, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(CMPage, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(CMSubmittedForm, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(CMMicrosite, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(CMPageRole, RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Dynamic Header') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DynamicImage'))
		BEGIN
			DELETE FROM DynamicCollection
			DELETE FROM DynamicImage			
			DBCC CHECKIDENT(DynamicCollection, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(DynamicImage, RESEED, 0)WITH NO_INFOMSGS
		END	
		IF ((@ComponentName IS NULL OR @ComponentName = 'Ecommerce') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Order'))
		BEGIN
			DELETE FROM [CartItemOption]
			DELETE FROM [CartItem]
			DELETE FROM [Transaction]
			DELETE FROM [Order]
			DELETE FROM [Cart]
			DELETE FROM [Coupon]
			DELETE FROM [ShippingMethod]
			DELETE FROM [ShippingRate]
			DELETE FROM [EcomAddress]
			DELETE FROM [OrderItemVolumePrice]
			DELETE FROM [AddressBook]
			
			DBCC CHECKIDENT([CartItemOption], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([CartItem], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Transaction], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Order], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Cart], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Coupon], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ShippingMethod], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ShippingRate], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([EcomAddress], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([OrderItemVolumePrice], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([AddressBook], RESEED, 0)WITH NO_INFOMSGS
			
			INSERT INTO [ShippingMethod] ([Name],[Price],FreeShipping) VALUES ('Standard',5.00,1)
			DECLARE @ShippingRateTypeID int;
			
			SET @ShippingRateTypeID = (SELECT TOP 1 ShippingRateTypeID FROM [ShippingRateType] WHERE [Name] = 'US');
			INSERT INTO [ShippingRate] ([SubTotalMin], [SubTotalMax], [Price], [ShippingRateTypeID]) VALUES (0, 50, 5, @ShippingRateTypeID)
			INSERT INTO [ShippingRate] ([SubTotalMin], [SubTotalMax], [Price], [ShippingRateTypeID]) VALUES (50.01, 200, 10, @ShippingRateTypeID)
			
			UPDATE [State] SET ShippingMarkup = 0, ShipTo = 'True'
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Events') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Event'))
		BEGIN
			DELETE FROM [EventEventCategory]
			DELETE FROM [Event]
			DELETE FROM [EventCategory]
			
			DBCC CHECKIDENT([Event], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([EventCategory], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([EventEventCategory], RESEED, 0)WITH NO_INFOMSGS			
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'File Library') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File'))
		BEGIN
			DELETE FROM [FileFileCategory]
			DELETE FROM [File]
			DELETE FROM [FileCategory]
			
			DBCC CHECKIDENT([File], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([FileCategory], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([FileFileCategory], RESEED, 0)WITH NO_INFOMSGS	
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Forum') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Forums'))
		BEGIN
			DELETE FROM ForumComplaints
			DELETE FROM ForumGroupPermissions
			DELETE FROM ForumGroups
			DELETE FROM ForumMessages
			DELETE FROM ForumNewTopicSubscriptions
			DELETE FROM ForumPersonalMessages
			DELETE FROM ForumPollAnswers
			DELETE FROM ForumPollOptions
			DELETE FROM ForumPolls
			DELETE FROM Forums
			DELETE FROM ForumSubforums
			DELETE FROM ForumSubscriptions
			DELETE FROM ForumTopics
			DELETE FROM ForumUploadedFiles
			DELETE FROM ForumUploadedPersonalFiles
			
			DBCC CHECKIDENT(ForumMessages, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(Forums, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(ForumTopics, RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'News Press') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'NewsPress'))
		BEGIN
			DELETE FROM NewsPressNewsPressCategory
			DELETE FROM NewsPress
			DELETE FROM NewsPressCategory
			
			DBCC CHECKIDENT(NewsPressNewsPressCategory, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(NewsPress, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(NewsPressCategory, RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Newsletters') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Newsletter'))
		BEGIN
			DELETE FROM MailoutMailingList
			DELETE FROM NewsletterAction
			DELETE FROM MailingListSubscriber
			DELETE FROM Newsletter
			DELETE FROM Subscriber
			DELETE FROM MailingList
			DELETE FROM Mailout
			
			DBCC CHECKIDENT(MailoutMailingList, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(NewsletterAction, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(MailingListSubscriber, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(Newsletter, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(Subscriber, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(MailingList, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(Mailout, RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Open Payment') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OpenPayment'))
		BEGIN
			DELETE FROM [OpenPayment]
			DELETE FROM [OpenPaymentAmount]
			
			DBCC CHECKIDENT([OpenPayment], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([OpenPaymentAmount], RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Polls') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Poll'))
		BEGIN
			DELETE FROM [Poll]
			DELETE FROM [PollAnswer]
			
			DBCC CHECKIDENT([Poll], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([PollAnswer], RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Product Catalog') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Product'))
		BEGIN
			DELETE FROM [ProductOptionValue]
			DELETE FROM [ProductOption]
			DELETE FROM [OptionValue]
			DELETE FROM [Option]
			DELETE FROM [ProductImage]
			DELETE FROM [ProductSuggest]
			DELETE FROM [ProductCategory]
			DELETE FROM [Product]
			
			DBCC CHECKIDENT([ProductOptionValue], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ProductOption], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([OptionValue], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Option], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ProductImage], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ProductSuggest], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([ProductCategory], RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT([Product], RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Search') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SearchContent'))
		BEGIN
			DELETE FROM SearchContentCache
			DELETE FROM SearchContentMetric
			DELETE FROM SearchContentIdentity
			DELETE FROM SearchContent
			
			DBCC CHECKIDENT(SearchContentCache, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(SearchContentMetric, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(SearchContentIdentity, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(SearchContent, RESEED, 0)WITH NO_INFOMSGS
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Showcase') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Showcase'))
		BEGIN
			DELETE FROM ShowcaseSettings
			DELETE FROM ShowcaseItem
			DELETE FROM ShowcaseAttribute
			DELETE FROM Showcase
			
			DBCC CHECKIDENT(ShowcaseSettings, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(ShowcaseItem, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(ShowcaseAttribute, RESEED, 0)WITH NO_INFOMSGS
			DBCC CHECKIDENT(Showcase, RESEED, 0)WITH NO_INFOMSGS
		END
	END
	ELSE
	BEGIN
		IF ((@ComponentName IS NULL OR @ComponentName = 'Blog') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'be_Pages'))
		BEGIN
			DECLARE @BlogID uniqueidentifier
			SET @BlogID = '27604f05-86ad-47ef-9e05-950bb762570c'
			
			SET IDENTITY_INSERT [dbo].[be_Blogs] ON
			INSERT [dbo].[be_Blogs] ([BlogRowId], [BlogId], [BlogName], [Hostname], [IsAnyTextBeforeHostnameAccepted], [StorageContainerName], [VirtualPath], [IsPrimary], [IsActive]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Primary', N'', 0, N'', N'~/blog', 1, 1)
			SET IDENTITY_INSERT [dbo].[be_Blogs] OFF
			
			SET IDENTITY_INSERT [dbo].[be_PingService] ON
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.technorati.com/rpc/ping')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.pingomatic.com/rpc2')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://ping.feedburner.com')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://www.bloglines.com/ping')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://services.newsgator.com/ngws/xmlrpcping.aspx')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://api.my.yahoo.com/rpc2 ')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (7, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://blogsearch.google.com/ping/RPC2')
			INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (8, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.pingthesemanticweb.com/')
			SET IDENTITY_INSERT [dbo].[be_PingService] OFF
			
			SET IDENTITY_INSERT [dbo].[be_Settings] ON
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'administratorrole', N'Administrators')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'alternatefeedurl', N'')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'authorname', N'My name')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'avatar', N'combine')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollmaxlength', N'23')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollupdateminutes', N'60')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (7, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollvisibleposts', N'3')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (8, N'27604f05-86ad-47ef-9e05-950bb762570c', N'contactformmessage', N'<p>I will answer the mail as soon as I can.</p>')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (9, N'27604f05-86ad-47ef-9e05-950bb762570c', N'contactthankmessage', N'<h1>Thank you</h1><p>The message was sent.</p>')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (10, N'27604f05-86ad-47ef-9e05-950bb762570c', N'culture', N'Auto')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (11, N'27604f05-86ad-47ef-9e05-950bb762570c', N'dayscommentsareenabled', N'0')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (12, N'27604f05-86ad-47ef-9e05-950bb762570c', N'description', N'Short description of the blog')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (13, N'27604f05-86ad-47ef-9e05-950bb762570c', N'displaycommentsonrecentposts', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (14, N'27604f05-86ad-47ef-9e05-950bb762570c', N'displayratingsonrecentposts', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (15, N'27604f05-86ad-47ef-9e05-950bb762570c', N'email', N'user@example.com')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (16, N'27604f05-86ad-47ef-9e05-950bb762570c', N'emailsubjectprefix', N'Weblog')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (17, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecommentsearch', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (18, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecommentsmoderation', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (19, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecontactattachments', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (20, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecountryincomments', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (21, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablehttpcompression', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (22, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enableopensearch', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (23, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablepingbackreceive', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (24, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablepingbacksend', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (25, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablerating', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (26, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablereferrertracking', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (27, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablerelatedposts', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (28, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablessl', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (29, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enabletrackbackreceive', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (30, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enabletrackbacksend', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (31, N'27604f05-86ad-47ef-9e05-950bb762570c', N'endorsement', N'http://www.dotnetblogengine.net/syndication.axd')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (32, N'27604f05-86ad-47ef-9e05-950bb762570c', N'fileextension', N'.aspx')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (33, N'27604f05-86ad-47ef-9e05-950bb762570c', N'geocodinglatitude', N'0')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (34, N'27604f05-86ad-47ef-9e05-950bb762570c', N'geocodinglongitude', N'0')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (35, N'27604f05-86ad-47ef-9e05-950bb762570c', N'handlewwwsubdomain', N'')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (36, N'27604f05-86ad-47ef-9e05-950bb762570c', N'iscocommentenabled', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (37, N'27604f05-86ad-47ef-9e05-950bb762570c', N'iscommentsenabled', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (38, N'27604f05-86ad-47ef-9e05-950bb762570c', N'language', N'en-US')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (39, N'27604f05-86ad-47ef-9e05-950bb762570c', N'mobiletheme', N'Mobile')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (40, N'27604f05-86ad-47ef-9e05-950bb762570c', N'name', N'Name of the blog')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (41, N'27604f05-86ad-47ef-9e05-950bb762570c', N'numberofrecentcomments', N'10')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (42, N'27604f05-86ad-47ef-9e05-950bb762570c', N'numberofrecentposts', N'10')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (43, N'27604f05-86ad-47ef-9e05-950bb762570c', N'postsperfeed', N'10')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (44, N'27604f05-86ad-47ef-9e05-950bb762570c', N'postsperpage', N'10')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (45, N'27604f05-86ad-47ef-9e05-950bb762570c', N'removewhitespaceinstylesheets', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (46, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchbuttontext', N'Search')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (47, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchcommentlabeltext', N'Include comments in search')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (48, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchdefaulttext', N'Enter search term')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (49, N'27604f05-86ad-47ef-9e05-950bb762570c', N'sendmailoncomment', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (50, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showdescriptioninpostlist', N'False')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (51, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showlivepreview', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (52, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showpostnavigation', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (53, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtppassword', N'password')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (54, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpserver', N'mail.example.dk')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (55, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpserverport', N'25')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (56, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpusername', N'user@example.com')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (57, N'27604f05-86ad-47ef-9e05-950bb762570c', N'storagelocation', N'~/App_Data/')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (58, N'27604f05-86ad-47ef-9e05-950bb762570c', N'syndicationformat', N'Rss')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (59, N'27604f05-86ad-47ef-9e05-950bb762570c', N'theme', N'Standard')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (60, N'27604f05-86ad-47ef-9e05-950bb762570c', N'timestamppostlinks', N'True')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (61, N'27604f05-86ad-47ef-9e05-950bb762570c', N'timezone', N'-5')
			INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (62, N'27604f05-86ad-47ef-9e05-950bb762570c', N'trackingscript', N'')
			SET IDENTITY_INSERT [dbo].[be_Settings] OFF
			
			DECLARE @PostID uniqueidentifier
			SET @PostID = NEWID()
			INSERT be_Posts(BlogID,PostID,Title,Description,PostContent,DateCreated,DateModified,Author,IsPublished,IsCommentEnabled,Raters,Rating,Slug)       VALUES(@BlogID,@PostID, 'Archived Webinar: Making Your Site Appeal To Both Customers & Search Engines','Webinar about making your website appeal to both search engines and customers.','<p>Here is a blog post from our Vice President of Marketing, Peter VanRysdam on our blog <a href="http://www.rantingandraving.com">rantingandraving.com</a></p>  <p>We had a tremendous turnout for our Webinar last week about search engine friendly design.&nbsp; However I do know that there were some who weren''t able to attend.&nbsp; We''ve uploaded a video of the session for you to watch on your own.<br /><br />Last time we used google video, however that service is no longer available to upload large files (the webinar is about an hour long).&nbsp; However we''ve found a service that should work.&nbsp; If you do encounter any problems, please let us know and we''ll do our best to remedy the situation.</p>  <p>Here is the link to download the wmv file to watch on your own computer:</p>  <p><a href="http://www.filefactory.com/file/ag3h114/n/webinar_2_wmv" target="_blank">Download webinar 2.wmv from FileFactory.com</a></p>',convert(datetime,'Jun 16 2009  1:08PM'),convert(datetime,'Jul  1 2009  3:26PM'),'352admin','1','1','1','3','Archived-Webinar-Making-Your-Site-Appeal-To-Both-Customers-Search-Engines')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'webinar')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'seo')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'usability')
			
			SET @PostID = NEWID()
			INSERT be_Posts(BlogID,PostID,Title,Description,PostContent,DateCreated,DateModified,Author,IsPublished,IsCommentEnabled,Raters,Rating,Slug)       VALUES(@BlogID,@PostID,'Sample Blog','Sample Blog','<p>This is a sample blog.</p>',convert(datetime,'Jun 16 2009 12:55PM'),convert(datetime,'Jul  1 2009  3:31PM'),'352admin','1','1','0','0','Sample-Blog')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'ranting and raving')
			
			SET @PostID = NEWID()
			INSERT be_Posts(BlogID,PostID,Title,Description,PostContent,DateCreated,DateModified,Author,IsPublished,IsCommentEnabled,Raters,Rating,Slug)       VALUES(@BlogID,@PostID,'Welcome to BlogEngine.NET 1.5 using Microsoft SQL Server','The description is used as the meta description as well as shown in the related posts. It is recommended that you write a description, but not mandatory','<p>If you see this post it means that BlogEngine.NET 1.5 is running with SQL Server and the DbBlogProvider is configured correctly.</p>  <h2>Setup</h2>  <p>If you are using the ASP.NET Membership provider, you are set to use existing users. If you are using the default BlogEngine.NET XML provider, it is time to setup some users. Find the sign-in link located either at the bottom or top of the page depending on your current theme and click it. Now enter "admin" in both the username and password fields and click the button. You will now see an admin menu appear. It has a link to the "Users" admin page. From there you can change the username and password.</p>  <h2>Write permissions</h2>  <p>Since you are using SQL to store your posts, most information is stored there. However, if you want to store attachments or images in the blog, you will want write permissions setup on the App_Data folder.</p>  <h2>On the web</h2>  <p>You can find BlogEngine.NET on the <a href="http://www.dotnetblogengine.net">official website</a>. Here you will find tutorials, documentation, tips and tricks and much more. The ongoing development of BlogEngine.NET can be followed at <a href="http://www.codeplex.com/blogengine">CodePlex</a> where the daily builds will be published for anyone to download.</p>  <p>Good luck and happy writing.</p>  <p>The BlogEngine.NET team</p>',convert(datetime,'Jun 12 2009 12:37PM'),convert(datetime,'Jul  1 2009  3:32PM'),'352admin','1','1','1','3','Welcome-to-BlogEngineNET-15-using-Microsoft-SQL-Server')
			
			DECLARE @CategoryID uniqueidentifier
			SET @CategoryID = NEWID()
			INSERT be_Categories(BlogID,CategoryID,CategoryName,Description,ParentID)       VALUES(@BlogID,@CategoryID,'General','',NULL)
			INSERT be_PostCategory(BlogID,PostID,CategoryID)       VALUES(@BlogID,@PostID,@CategoryID)
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'sample')
			
			SET @PostID = NEWID()
			INSERT be_Posts(BlogID,PostID,Title,Description,PostContent,DateCreated,DateModified,Author,IsPublished,IsCommentEnabled,Raters,Rating,Slug)       VALUES(@BlogID,@PostID,'Interactive Media Happenings--June 15th, 2009','Blog Post from 352 Media Group''s Blog, Ranting and Raving','<p>This is a blog post from our President and CEO, Geoff Wilson on 352 Media''s blog <a href="http://www.rantingandraving.com">rantingandraving.com:</a></p>  <p>Here are some&nbsp;interesting&nbsp;articles that our interactive media team&nbsp;came across&nbsp;this past week</p>  <ul>  <li>&ldquo;Dell makes $3 Million from Twitter-Related Sales&rdquo; &gt;&gt; <a href="http://www.informationweek.com/news/hardware/desktop/showArticle.jhtml?articleID=217801030&amp;subSection=E-Business" target="_blank">Read Article</a></li>  <li>&ldquo;16 Design Tools for Prototyping and Wireframing&rdquo; &gt;&gt; <a href="http://www.sitepoint.com/article/tools-prototyping-wireframing/" target="_blank">Read Article</a></li>  <li>&ldquo;&lsquo;Hunch&rsquo; Web site will make decisions for you&rdquo; &gt;&gt; <a href="http://edition.cnn.com/2009/TECH/06/15/hunch.online.decisions/" target="_blank">Read Article</a></li>  </ul>  <p>Enjoy!</p>',convert(datetime,'Jun 16 2009 12:59PM'),convert(datetime,'Jul  1 2009  3:31PM'),'352admin','1','1','0','0','Interactive-Media-Happenings-June-15th-2009')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'setup')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'write permissions')
			INSERT be_PostTag(BlogID,PostID,Tag)       VALUES(@BlogID,@PostID,'on the web')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Content Manager') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CMPage'))
		BEGIN	
			IF ((SELECT COUNT(*) FROM CMMicrosite WHERE Name = 'Gainesville') = 0)
			BEGIN
				INSERT CMMicrosite(Name,Active,Published,Description,Location,Image)       VALUES('Gainesville','1','1','This is where you would put content about the specific city, product, or other item you are creating a microsite for.','Gainesville, FL','image1030200924404PM63.png')
			END
			IF ((SELECT COUNT(*) FROM CMMicrosite WHERE Name = 'Jacksonville') = 0)
			BEGIN
				INSERT CMMicrosite(Name,Active,Published,Description,Location,Image)       VALUES('Jacksonville','1','1','This is where you would put content about the specific city, product, or other item you are creating a microsite for.','Jacksonville, FL','image1030200924508PM63.png')
			END
			IF ((SELECT COUNT(*) FROM CMMicrosite WHERE Name = 'Tampa') = 0)
			BEGIN
				INSERT CMMicrosite(Name,Active,Published,Description,Location,Image)       VALUES('Tampa','1','1','This is where you would put content about the specific city, product, or other item you are creating a microsite for.','Tampa, FL','image1030200924717PM63.png')
			END
			IF ((SELECT COUNT(*) FROM CMMicrosite WHERE Name = 'Atlanta') = 0)
			BEGIN
				INSERT CMMicrosite(Name,Active,Published,Description,Location,Image)       VALUES('Atlanta','1','1','This is where you would put content about the specific city, product, or other item you are creating a microsite for.','Atlanta, GA','image1030200924736PM63.png')
			END
			
			DECLARE @CMPageID int
			DECLARE @CMTemplateID int
			DECLARE @CMMicrositeID int
			DECLARE @CMRegionID int
			SET @CMTemplateID = (SELECT TOP 1 CMTemplateID FROM CMTemplate WHERE Name = 'Microsite Template')
			SET @CMRegionID = (SELECT TOP 1 CMRegionID FROM CMRegion WHERE Name = 'MainRegion')
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE Name = 'Gainesville')
			IF ((SELECT COUNT(*) FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID) = 0)
			BEGIN
				INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       VALUES(@CMTemplateID,'Home','Home.aspx',@todaysDate,'0','1','','0',@CMMicrositeID,'0','0')
				INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, ContentClean)
					VALUES (@@Identity, @CMRegionID, 'This is where you would put content about the specific city, product, or other item you are creating a microsite for.&nbsp; See the <a class="ApplyClass" href="[[ROOT]]Atlanta/Home.aspx">Atlanta microsite </a>example for more information.<br>',
							'True', '10/31/2009 2:00:00 PM', 'This is where you would put content about the specific city, product, or other item you are creating a microsite for.  See the Atlanta microsite example for more information.')
			END
			
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE Name = 'Jacksonville')
			IF ((SELECT COUNT(*) FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID) = 0)
			BEGIN
				INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       VALUES(@CMTemplateID,'Home','Home.aspx',@todaysDate,'0','1','','0',@CMMicrositeID,'0','0')
			END
			
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE Name = 'Tampa')
			IF ((SELECT COUNT(*) FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID) = 0)
			BEGIN
				INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       VALUES(@CMTemplateID,'Home','Home.aspx',@todaysDate,'0','1','','0',@CMMicrositeID,'0','0')
			END
						
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE Name = 'Atlanta')
			IF ((SELECT COUNT(*) FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID) = 0)
			BEGIN
				INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       VALUES(@CMTemplateID,'Home','Home.aspx',@todaysDate,'0','1','','0',@CMMicrositeID,'0','0')
				INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, ContentClean)				
					VALUES (@@Identity, @CMRegionID, 'This is where you would put content about the specific city, product, or other item you are creating a microsite for.',						
							'True', '10/31/2009 2:00:00 PM', 'This is where you would put content about the specific city, product, or other item you are creating a microsite for.')							DECLARE @SMItemParentID int			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Home')
			END
			
			SET @CMTemplateID = (SELECT TOP 1 CMTemplateId FROM CMTemplate)
			SET @CMRegionID = (SELECT TOP 1 CMRegionID FROM CMRegion WHERE Name = 'MainRegion')
		
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'Home','default.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, ContentClean)
				VALUES (@@Identity, @CMRegionID, '<h1>Welcome To Our Demo Site</h1> <p>This Web site allows you to test drive our robust features that are available to be integrated into your Web site. This entire Web site is controlled by our easy-to-use Content Management System and also includes our Dynamic Header, News &amp; Press Release Center and HTML Newsletter &amp; E-Mail Blaster features.</p> <p>Through this demo site, you can also try out the administration tools that come with our features.  By going to the administrative interface <a href="admin/" target="_blank">here</a> you will see how easy it is for you to edit this Web site’s content, change pictures in the Dynamic Header, add News &amp; Press Releases, create HTML Newsletters and more.</p> <p>You will find that our easy-to-use Content Management System allows you to quickly and easily edit the Web site’s content, add photos, insert links, upload documents and create new Web pages.  Our Content Management System also allows you to add an unlimited number of pages to the Web site and easily edit the Web site’s sitemap and menu bar.</p> <p>Please take a look around our demo site and give our administration tools a try.  Once you do, we hope you’ll agree that we are the perfect partner for your project!</p>',
						'True', @todaysDate, 'Welcome To Our Demo Site    This Web site allows you to test drive our robust features that are available to be integrated into your Web site. This entire Web site is controlled by our easy-to-use Content Management System and also includes our Dynamic Header, News & Press Release Center and HTML Newsletter & E-Mail Blaster features.      Through this demo site, you can also try out the administration tools that come with our features. By going to the administrative interface here you will see how easy it is for you to edit this Web site’s content, change pictures in the Dynamic Header, add News & Press Releases, create HTML Newsletters and more.      You will find that our easy-to-use Content Management System allows you to quickly and easily edit the Web site’s content, add photos, insert links, upload documents and create new Web pages. Our Content Management System also allows you to add an unlimited number of pages to the Web site and easily edit the Web site’s sitemap and menu bar.      Please take a look around our demo site and give our administration tools a try. Once you do, we hope you’ll agree that we are the perfect partner for your project!')
		
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'About 352 Media','about-352-media.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, ContentClean)
			VALUES (@@Identity, @CMRegionID, '<h1>About 352 Media Group</h1><p>There are many different words to describe our company, but none more accurate than "professional." With a staff of more than 50 people, we have the resources to dedicate a team of specialized professionals to your project. We blend their experience and expertise to create a fully integrated solution seamlessly combining exceptional graphic design, dynamic Web programming, and powerful online marketing.</p><p>We have been developing Web sites and interactive media projects for small businesses and Fortune 1000 clients alike for more than ten years. Our integrated team approach can handle any interactive venture, including Web site design, Web application development, Flash animation, CD and DVD production, Web marketing and more.</p><p>Our headquarters in North Central Florida is located near the University of Florida, where we draw from a pool that is rich in talent and education. Our main office acts as a hub for production and supports our Project Development and Sales Office in Atlanta in addition to our regional sales offices in Seattle, Ann Arbor, Jacksonville, Tampa, Los Angeles, and New York.</p><h2>Why We''re Better:</h2><li>We won more than 50 ADDY & design awards from 2005-2008 including three “Best In Show” distinctions</li><li>We were ranked on the Inc. 5000 list of the fastest growing privately held companies in America in 2007 and 2008</li><li>We were selected as one of the Top 3 Web design companies in the US by TopSEOs in 2008</li><li>We are a Microsoft Certified Partner and a member of the Microsoft Silverlight Partner Program</li><li>We are one of only sixteen approved Microsoft Vendors for Digital Marketing Campaigns</li><li>We have been selected as one of the Top 200 Marketing Service Agencies in the US by AdAge Magazine for four straight years (2005-2008)</li>',
					'True', @todaysDate, 'About 352 Media Group There are many different words to describe our company, but none more accurate than "professional." With a staff of more than 50 people, we have the resources to dedicate a team of specialized professionals to your project. We blend their experience and expertise to create a fully integrated solution seamlessly combining exceptional graphic design, dynamic Web programming, and powerful online marketing. We have been developing Web sites and interactive media projects for small businesses and Fortune 1000 clients alike for more than ten years. Our integrated team approach can handle any interactive venture, including Web site design, Web application development, Flash animation, CD and DVD production, Web marketing and more. Our headquarters in North Central Florida is located near the University of Florida, where we draw from a pool that is rich in talent and education. Our main office acts as a hub for production and supports our Project Development and Sales Office in Atlanta in addition to our regional sales offices in Seattle, Ann Arbor, Jacksonville, Tampa, Los Angeles, and New York. Why We''re Better: We won more than 50 ADDY & design awards from 2005-2008 including three “Best In Show” distinctions We were ranked on the Inc. 5000 list of the fastest growing privately held companies in America in 2007 and 2008 We were selected as one of the Top 3 Web design companies in the US by TopSEOs in 2008 We are a Microsoft Certified Partner and a member of the Microsoft Silverlight Partner Program We are one of only sixteen approved Microsoft Vendors for Digital Marketing Campaigns We have been selected as one of the Top 200 Marketing Service Agencies in the US by AdAge Magazine for four straight years (2005-2008)')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'Features','features.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			INSERT INTO CMPageRegion (CMPageID, CMRegionID, Content, CurrentVersion, Created, ContentClean)
			VALUES (@@Identity, @CMRegionID, '<H1>Features</H1><P>Our dynamic programming capabilities coupled with our award-winning design allow us to offer you premium features at an affordable price. Through our easy-to-use administrative interface you can update your visitors with your latest News and Press releases, and quickly release beautifully designed Newsletters to your e-mail list. </P><H2>News &amp; Press</H2><P>Our News &amp; Press feature allows you to keep your visitors up-to-date with your most current happenings via articles displayed in an efficient and organized listing. The feature also includes a "quick-view" on the homepage where a determined number of articles are briefly displayed with a short summary of the article''s contents. </P><P>Check out the <A href="news-press.aspx">News &amp; Press</A>&nbsp;page now!</P><H2>Newsletter</H2><P>Newsletters are an extremely effective marketing tool that allows you to periodically reach subscribers by email. Our designers will create a design that professionally communicates your message. You can also access an archive of your Newsletters in an easy-to-navigate page on your website.</P><P>Check out the <A href="[[ROOT]]newsletter.aspx">Newsletter </A>page now!</P><H2>Content Management System</H2><P>Adding or editing content is quick and easy! It is as simple as typing a document in a word processor.</P><P>You can try out our Content Management System by going to the administrative interface <A href="[[ROOT]]admin/content-manager/content-manager.aspx" target=_blank>here</A>. You will find that our Content Management System allows you to edit the Web site’s content, add photos, insert links, upload documents and create new Web pages. Our Content Management System also allows you to add an unlimited number of pages to the Web site and easily edit the Web site’s sitemap and menu bar.</P><H2>E-commerce</H2><P>This feature allows your customer to add products they would like to purchase to a cart, pick shipping options, and checkout. You can also separate the products into categories and add up to four pictures of each product. The user has the choice to view 5, 15, or 30 rows of products per page. </P><P>Check out the <A href="[[ROOT]]product-category.aspx">e-commerce section </A>now!</P><H2>Blog</H2><P>This feature allows any author with permission to edit the site to publish a blog post. You can upload images to the post and also tag the post with keywords to make your post more search-engine friendly. </P><P>Check out our <A href="[[ROOT]]blog/">example blog</A> on the now!</P><H2>Open Payment</H2><P>This feature is different from e-commerce in that it is used to accept payments without having a product catalog. For example, if you are an online magazine that charges membership dues you could accept payment in this section. Other examples include charities accepting donations, ticket-ordering services accepting payment, or apartment complexes accepting rent.</P><P>Check out the <A href="[[ROOT]]open-payment.aspx">open payment </A>page now!</P><H2>Polls</H2><P>In the poll manager you can ask a question and post up to four answers that users can choose from. You can also upload pictures to each answer choice.</P><P>Check out the<A href="[[ROOT]]polls.aspx"> poll page</A> now!</P><H2>Search</H2><P>This feature allows your users to do a keyword search through all the content on your site. Any documents you upload will also be searched.</P><P>Check out the<A href="[[ROOT]]search.aspx"> search page</A> now!</P><H2>Events</H2><P>This feature allows you to place your company''s important events into a calendar interface on your website. You can enter a start date and end date for your events so only the upcoming events are featured.</P><P>Check out the<A href="[[ROOT]]events.aspx"> event page</A> now!</P><H2>Forums</H2><P>This feature allows you to post topics for your users to discuss back and forth. You have the option to moderate the conversations or let your users post whatever they like.</P><P>Check out the<A href="[[ROOT]]forum/"> forum</A> now!</P><H2>Members Area</H2><P>This feature allows your users to register and manage an account on your website. This can be used to protect certain content on your website, track the actions of your users on your site or allow your users to quickly fill out forms from previously entered information. </P><P>Check out the<A href="[[ROOT]]members-home.aspx"> members area </A>now!</P>',
					'True', @todaysDate, 'Features Our dynamic programming capabilities coupled with our award-winning design allow us to offer you premium features at an affordable price. Through our easy-to-use administrative interface you can update your visitors with your latest News and Press releases, and quickly release beautifully designed Newsletters to your e-mail list.  News & Press Our News & Press feature allows you to keep your visitors up-to-date with your most current happenings via articles displayed in an efficient and organized listing. The feature also includes a "quick-view" on the homepage where a determined number of articles are briefly displayed with a short summary of the article''s contents.  Check out the News & Press page now! Newsletter Newsletters are an extremely effective marketing tool that allows you to periodically reach subscribers by email. Our designers will create a design that professionally communicates your message. You can also access an archive of your Newsletters in an easy-to-navigate page on your website. Check out the Newsletter page now! Content Management System Adding or editing content is quick and easy! It is as simple as typing a document in a word processor. You can try out our Content Management System by going to the administrative interface here. You will find that our Content Management System allows you to edit the Web site’s content, add photos, insert links, upload documents and create new Web pages. Our Content Management System also allows you to add an unlimited number of pages to the Web site and easily edit the Web site’s sitemap and menu bar. E-commerce This feature allows your customer to add products they would like to purchase to a cart, pick shipping options, and checkout. You can also separate the products into categories and add up to four pictures of each product. The user has the choice to view 5, 15, or 30 rows of products per page.  Check out the e-commerce section now! Blog This feature allows any author with permission to edit the site to publish a blog post. You can upload images to the post and also tag the post with keywords to make your post more search-engine friendly.  Check out our example blog on the now! Open Payment This feature is different from e-commerce in that it is used to accept payments without having a product catalog. For example, if you are an online magazine that charges membership dues you could accept payment in this section. Other examples include charities accepting donations, ticket-ordering services accepting payment, or apartment complexes accepting rent. Check out the open payment page now! Polls In the poll manager you can ask a question and post up to four answers that users can choose from. You can also upload pictures to each answer choice. Check out the poll page now! Search This feature allows your users to do a keyword search through all the content on your site. Any documents you upload will also be searched. Check out the search page now! Events This feature allows you to place your company''s important events into a calendar interface on your website. You can enter a start date and end date for your events so only the upcoming events are featured. Check out the event page now! Forums This feature allows you to post topics for your users to discuss back and forth. You have the option to moderate the conversations or let your users post whatever they like. Check out the forum now! Members Area This feature allows your users to register and manage an account on your website. This can be used to protect certain content on your website, track the actions of your users on your site or allow your users to quickly fill out forms from previously entered information.  Check out the members area now! Check out Sub-Page 3 or Sub-Page 4 now!')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'Privacy Policy','privacy-policy.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'Sample Custom Form','sample-custom-form.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			INSERT INTO CMPageRegion(CMPageId,CMRegionID,Content,CurrentVersion,Created,UserId,ContentClean) 
				VALUES (@@Identity,@CMRegionID,'This is a sample custom form.&nbsp; You may add as many textbox, textarea, and checkbox fields to the page as you want.&nbsp; Be sure that you give each input a descriptive name so that you can figure out what a user answered for that input.&nbsp; You will also need to add a submit button to the page to allow the user to submit their form.<br><br><h2>Contact Us</h2><table><tbody><tr><td>First Name</td><td><input name="firstName"   class="required text" style="width: 100px; height: 22px;" type="text" /></td></tr><tr><td>Last Name</td><td><input name="lastName"   class="required text" style="width: 100px; height: 22px;" type="text" /></td></tr><tr><td>E-mail</td><td><input name="emailAddress"   class="required text" style="width: 100px; height: 22px;" type="text" /></td></tr></tbody></table><input name="dynamicsubmit"   value="Submit" style="width: 50px; height: 22px;" type="submit" />',
						'True',@todaysDate,'1','This is a sample custom form.  You may add as many textbox, textarea, and checkbox fields to the page as you want.  Be sure that you give each input a descriptive name so that you can figure out what a user answered for that input.  You will also need to add a submit button to the page to allow the user to submit their form.  Contact Us   First Name    Last Name    E-mail')
			
			SET @UserID = (SELECT TOP 1 UserID FROM [User] WHERE Name = '352cmscontentintegrator')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(@CMTemplateID,'Unapproved Page','unapproved-page.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			INSERT INTO CMPageRegion(CMPageId,CMRegionID,Content,CurrentVersion,Created,UserId,ContentClean,NeedsApproval,EditorUserIDs) 
				VALUES (@@Identity,@CMRegionID,'This is a page with unapproved content on it.&nbsp; Changes will not show up for non-admins until they are approved by a CMS administrator.&nbsp; Editors who come to this page will see a message at the top alerting them of any unapproved changes.',
						'False',@todaysDate,@UserID,'This is a page with unapproved content on it.  Changes will not show up for non-admins until they are approved by a CMS administrator.  Editors who come to this page will see a message at the top alerting them of any unapproved changes.',
						'True',@UserID)
				
						
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'default.aspx')
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (NULL, @CMPageID, 'Home', 0)
			END
			
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'about-352-media.aspx')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (NULL, @CMPageID, 'About', 4)
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'About')
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Locations','locations.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			SET @CMPageID = @@Identity
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Locations', 0)
			
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Locations')
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE [Name] = 'Atlanta')
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID)
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'Atlanta', 1, 'False')
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE [Name] = 'Gainesville')
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID)
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'Gainesville', 2, 'False')
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE [Name] = 'Jacksonville')
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID)
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'Jacksonville', 3, 'False')
			SET @CMMicrositeID = (SELECT TOP 1 CMMicrositeID FROM CMMicrosite WHERE [Name] = 'Tampa')
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'Home.aspx' AND CMMicrositeID = @CMMicrositeID)
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'Tampa', 4, 'False')				
			
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'features.aspx')
			SET @SMItemParentID = NULL
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (NULL, @CMPageID, 'Features', 3)
				SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Features')
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'News Press','news-press.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'News & Press Releases', 0)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Newsletters','newsletter.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Newsletters',1)		
			END

--Begin Product Catalog Sitemap insertion			
			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
			VALUES (NULL, 'Product Catalog', 'product-category.aspx', getdate(), 'False', 1, NULL, NULL, 'False')

			SET @CMPageId = @@Identity
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank)
			VALUES (@SMItemParentID, @CMPageId, 'Product Catalog', 2)
			DECLARE @ProductCatalogSMItemParentID int
			SET @ProductCatalogSMItemParentID = @@Identity

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'Product', 'product.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			SET @CMPageId = @@Identity
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
			VALUES (@ProductCatalogSMItemParentID, @CMPageId, 'Product Details', 0, 0)

			DECLARE @CatalogSMItemID int
			DECLARE @Rank int
			DECLARE @OldSMItemParentID int
			SET @OldSMItemParentID = @SMItemParentID
			
			SET @CatalogSMItemID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Product Catalog')
			SET @Rank = (SELECT MAX(Rank) + 1 FROM SMItem WHERE SMItemParentID = @CatalogSMItemID)
			IF (@Rank IS NULL)
			BEGIN
				SET @Rank = 0
			END

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Cart Empty', 'ecommerce-cart-empty.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@CatalogSMItemID, @@Identity, 'Shopping Cart Is Empty', @Rank, 0)
			SET @Rank = @Rank + 1

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout Complete', 'ecommerce-checkout-complete.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@CatalogSMItemID, @@Identity, 'Checkout Complete', @Rank, 0)
			SET @Rank = @Rank + 1

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Cart', 'ecommerce-cart.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@CatalogSMItemID, @@Identity, 'Shopping Cart', @Rank, 0)
			SET @Rank = @Rank + 1
			SET @SMItemParentID = @@Identity

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout', 'ecommerce-checkout.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@SMItemParentID, @@Identity, 'Checkout', 0, 0)

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout Billing', 'ecommerce-checkout-billing.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@CatalogSMItemID, @@Identity, 'Checkout - Billing', @Rank, 0)
			SET @SMItemParentID = @@Identity

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout Shipping', 'ecommerce-checkout-shipping.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@SMItemParentID, @@Identity, 'Shipping Address', 0, 0)
			SET @SMItemParentID = @@Identity

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout Shipping Method', 'ecommerce-checkout-shipping-method.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@SMItemParentID, @@Identity, 'Shipping Method', 1, 0)
			SET @SMItemParentID = @@Identity

			INSERT INTO CMPage (CMTemplateId, Title, FileName, Created, Deleted, UserId, FormRecipient, ResponsePageId, CanDelete) 
				VALUES (NULL, 'E-Commerce Checkout Payment', 'ecommerce-checkout-payment.aspx', getdate(), 'False', 1, NULL, NULL, 'False')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu)
				VALUES (@SMItemParentID, @@Identity, 'Payment', 2, 0)
				
			SET @SMItemParentID = @OldSMItemParentID
--End Product Catalog Sitemap insertion			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Blog','blog/',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Blog', 3)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Open Payment','open-payment.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Open Payment', 4)		
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Polls','polls.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Polls', 5)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Search','search.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Search', 6)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Events','events.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Events', 7)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Forums','forum/',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Forums', 8)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Members Home','members-home.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Members Home', 10)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Showcase','showcase.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Showcase', 9)
			END
			
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE FileName = 'unapproved-page.aspx')
			INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, NeedsApproval) 
			VALUES (@SMItemParentID, @CMPageID, 'Unapproved Page', 11,1)
			
			INSERT INTO SMItemUser (UserID,CMMicrositeID,MicrositeDefault,LanguageID)
			VALUES (@UserID, NULL, 0,1)
			
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Showcase')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Location Showcase','showcase.aspx?showcaseid=1',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Location Showcase', 1)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Staff Showcase','showcase.aspx?showcaseid=2',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Staff Showcase', 1)
			END
			
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Members Home')
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Register','register.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Register', 1)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Lost Password','lost-password.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Lost Password', 1)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Change Password','change-password.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Change Password', 1)
			END
			
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Profile','profile.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank) VALUES (@SMItemParentID, @CMPageID, 'Edit Profile', 1)
			END
			
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'News & Press Releases')
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'News & Press Article','news-press-details.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'News & Press Article', 1, 'False')
			END
			
			SET @SMItemParentID = (SELECT TOP 1 SMItemID FROM SMItem WHERE Name = 'Events')
			INSERT INTO CMPage(CMTemplateId,Title,FileName,Created,Deleted,UserId,FormRecipient,CanDelete,CMMicrositeID,MicrositeDefault,FeaturedPage)       
			VALUES(NULL,'Event Details','event-details.aspx',@todaysDate,'0','1','','0',NULL,'0','0')
			
			SET @CMPageID = @@Identity
			IF (@CMPageID IS NOT NULL)
			BEGIN
				INSERT INTO SMItem (SMItemParentID, CMPageId, Name, Rank, ShowInMenu) VALUES (@SMItemParentID, @CMPageID, 'Event Details', 1, 'False')
			END
			UPDATE SMItem SET LanguageID = 1
			
			INSERT CMSubmittedForm(FormHTML,ResponsePageId,DateSubmitted,FormRecipient,IsProcessed,CMMicrositeID) VALUES('A new page submission on sample-custom-form.aspx.   firstName  :   John lastName  :   Smith emailAddress  :   support@352media.com ',NULL,dateadd(d, -1, getdate()),'','0',NULL)
		
			/*CM Page Roles*/

			SET @RoleID = (SELECT TOP 1 RoleID FROM [Role] WHERE [Name] = 'Admin')
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE [FileName] = 'change-password.aspx')
			
			INSERT CMPageRole (CMPageID, RoleID) VALUES (@CMPageID, @RoleID)
			SET @CMPageID = (SELECT TOP 1 CMPageID FROM CMPage WHERE [FileName] = 'profile.aspx')
			INSERT CMPageRole (CMPageID, RoleID) VALUES (@CMPageID, @RoleID)
			
			/*SEO Items*/
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
			VALUES('~/default.aspx','Home','','',@todaysDate,@todaysDate)
			
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
			VALUES('~/about-352-media.aspx','About 352 Media','','',@todaysDate,@todaysDate)
			
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
			VALUES('~/features.aspx','Features','','',@todaysDate,@todaysDate)
			
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
			VALUES('~/sample-custom-form.aspx','Sample Custom Form','','',@todaysDate,@todaysDate)
			
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)
			VALUES('~/privacy-policy.aspx','Privacy Policy','','',@todaysDate,@todaysDate)
			
			EXEC CUSTOM_CMS_CreateCMPageTitlesFromCMPages @LanguageID = 1
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Dynamic Header') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DynamicImage'))
		BEGIN
			DECLARE @CollectionID int
			INSERT INTO DynamicCollection (Name, Active) VALUES ('Homepage', 1)
			SET @CollectionID = @@Identity
			
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('3.jpg', '352 Media Group Company Cars (Yes, we designed them!)', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('4.jpg', '352 Media Group Company Cars (Yes, we designed them!)', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('5.jpg', '352 Media Group Company Cars (Yes, we designed them!)', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('6.jpg', '352 Media Group Company Cars (Yes, we designed them!)', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('2.jpg', 'Our Internet Cafe at BAE Systems Product Expo', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('image23200920346PM63.jpg', 'Part of our Team at our Annual Company &quot;Field Day&quot; in 2007', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('1.jpg', 'Winning A Ton Of Addy Awards in 2007', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('8.jpg', 'Our tradeshow booth (Designed by us) at the MPlanet show in Orlando', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('9.jpg', 'In action at a tradeshow in London', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('10.jpg', 'In action at a tradeshow in London', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			INSERT INTO DynamicImage (Name, Title, Active) VALUES ('11.jpg', 'In action at a tradeshow in London', 'True')
			INSERT INTO DynamicImageCollection (DynamicImageID, DynamicCollectionID, DisplayOrder) SELECT @@Identity, @CollectionID, (SELECT CASE WHEN MAX(DisplayOrder) IS NULL THEN 1 ELSE MAX(DisplayOrder) + 1 END FROM DynamicImageCollection)
			
			IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CMPage'))
			BEGIN
				UPDATE CMPage SET DynamicCollectionID = @CollectionID
				WHERE FileName = 'default.aspx' AND CMMicrositeID IS NULL AND MicrositeDefault = 0 AND OriginalCMPageId IS NULL
			END
		END	
		IF ((@ComponentName IS NULL OR @ComponentName = 'Ecommerce') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Order'))
		BEGIN
			IF ((SELECT COUNT(*) FROM Coupon WHERE CouponCode = 'Free Shipping') = 0)
			BEGIN
				INSERT Coupon(CouponCode,BeginDate,EndDate,CouponTypeID,CouponDateTimeEventTypeID,DiscountAmount,Active,UPSFreeShipping,FedExFreeShipping)       VALUES('Free Shipping',NULL,NULL,'3','1',convert(money,'10.00'),'1','0','0')
			END
			IF ((SELECT COUNT(*) FROM Coupon WHERE CouponCode = 'Black Friday Discount') = 0)
			BEGIN
				INSERT Coupon(CouponCode,BeginDate,EndDate,CouponTypeID,CouponDateTimeEventTypeID,DiscountAmount,Active,UPSFreeShipping,FedExFreeShipping)       VALUES('Black Friday Discount',convert(datetime,'Nov 27 2009 12:00AM'),NULL,'1','2',convert(money,'0.05'),'1','0','0')
			END
			IF ((SELECT COUNT(*) FROM Coupon WHERE CouponCode = 'Rebate') = 0)
			BEGIN
				INSERT Coupon(CouponCode,BeginDate,EndDate,CouponTypeID,CouponDateTimeEventTypeID,DiscountAmount,Active,UPSFreeShipping,FedExFreeShipping)       VALUES('Rebate',convert(datetime,'Dec  7 2009 12:00AM'),convert(datetime,'Dec 11 2009 12:00AM'),'2','3',convert(money,'5.00'),'1','0','0')
			END
			
			DECLARE @BillingAddressID int
			DECLARE @ShippingAddressID int
			INSERT EcomAddress(FirstName, LastName, Address1, Address2, City, StateID, StateOther, Zip, CountryID, Email, Phone, IsShipping, IsBilling, UserID) VALUES ('John','Smith', '123 Mockingbird Lane', NULL, 'Beverly Hills',	5, NULL, 90210,	1, 'support@352media.com', '(555)867-5309', 'False',	'True',	1)
			SET @BillingAddressID = @@Identity
			INSERT EcomAddress(FirstName, LastName, Address1, Address2, City, StateID, StateOther, Zip, CountryID, Email, Phone, IsShipping, IsBilling, UserID) VALUES ('John','Smith', '123 Mockingbird Lane', NULL, 'Beverly Hills',	5, NULL, 90210,	1, 'support@352media.com', '(555)867-5309', 'True',	'False', 1)
			SET @ShippingAddressID = @@Identity
			
			DECLARE @OrderID int
			INSERT [Order](Total, Subtotal, Tax, Discount, ShippingTotal, StartDate, EndDate, OrderNumber, UserID, CartID, OrderStatusID, TransactionGroupID, AuthorizeTransactionID, CaptureTransactionID, CouponCode, CouponDescription, CouponID, Notes, Placed, ShippingAddressID, BillingAddressID, ShippingMethodName, TrackingNumber) VALUES(60.0000, 60.0000, 0.0000, 0.0000, 0.0000, DATEADD(hh, -1, @todaysDate), getdate(), '12ee3fad-4567-8c90-bab1-12345fdce678', 1, NULL, 3, '81ee1fad-2595-4c83-bab5-05064fdce681', 1, 2, 'Free Shipping', 'Free shipping', 1,	NULL, 'True', @ShippingAddressID, @BillingAddressID, 'Standard', NULL)
			SET @OrderID = @@Identity
			INSERT OrderItem(Image, Price, Name, OrderID, Quantity, Weight, EcommerceComponentID, ComponentItemID) VALUES ('0128904211266390351.jpg', 12.0000, '352 Media Group Apron', @OrderID, 5, 5.0000,1,1)
			
			INSERT OrderItemVolumePrice(OrderID, CartID, OrderItemID, Quantity, BasePrice, VolumePrice, Date) VALUES (@OrderID, NULL, @@Identity, 5, 14.9900, 12.0000, @todaysDate)
						
			INSERT AddressBook(UserID,FirstName,LastName,Address1,Address2,City,StateID,StateOther,CountryID,Zip,Phone,Email,IsDefaultBilling)       VALUES('1','John','Smith','123 Mockingbird Lane','','Beverly Hills','5','','1','90210','(555)867-5309','support@352media.com','0')
			
			INSERT [Transaction](TransactionGroupingID, TransactionDate, OrderID, CartID, OpenPaymentID, UserID, CCName, CCType, CCExpirationDate, TransactionTypeID, IsLive, OrderTotal, PaymentGateway, PaymentMethod, TransactionCommand, TransactionResult, TransactionCode, TransactionPNREF, AVSResult, IsSuccessful) VALUES ('81ee1fad-2595-4c83-bab5-05064fdce681',	'12/8/2009 4:08:12 PM',	@OrderID, NULL, NULL, NULL, 'John Smith',	'Visa',	'12/1/2009 12:00:00 AM', '2', 'False', 60.0000, 'VERISIGN', 'Credit Card', 'TRXTYPE[1]=A&ACCT[16]=411111XXXXXX1111&NAME[10]=John Smith&EXPDATE[4]=1209&CVV2[3]=XXX&TENDER[1]=C&INVNUM[2]=37&AMT[5]=60.00&CURRENCY[3]=USD&TAXAMT[4]=0.00&SHIPPINGAMT[4]=0.00&COMMENT1[34]=OrderID 37   CartID 102   UserID 1&STREET[20]=123 Mockingbird Lane&BILLTOSTREET2[0]=&CITY[13]=Beverly Hills&STATE[2]=CA&COUNTRY[2]=US&ZIP[5]=90210&PHONENUM[13]= 555 867 5309&EMAIL[19]=zfloyd 352media com&FIRSTNAME[4]=John&LASTNAME[5]=Smith&SHIPTOSTREET[20]=123 Mockingbird Lane&SHIPTOSTREET2[0]=&SHIPTOCITY[13]=Beverly Hills&SHIPTOSTATE[2]=CA&SHIPTOCOUNTRY[2]=US&SHIPTOZIP[5]=90210&SHIPTOFIRSTNAME[4]=John&SHIPTOLASTNAME[5]=Smith&USER[12]=testmerchant&VENDOR[12]=testmerchant&PARTNER[11]=silverscape&PWD[9]=XXXXXXXXX', 'RESULT=0&PNREF=V18A2A280368&RESPMSG=Approved&AUTHCODE=988PNI&AVSADDR=Y&AVSZIP=N&CVV2MATCH=Y&IAVS=N', '988PNI', 'V18A2A280368', 'AVSAddr=Y&AVSZIP=N', 'True')
			INSERT [Transaction](TransactionGroupingID, TransactionDate, OrderID, CartID, OpenPaymentID, UserID, CCName, CCType, CCExpirationDate, TransactionTypeID, IsLive, OrderTotal, PaymentGateway, PaymentMethod, TransactionCommand, TransactionResult, TransactionCode, TransactionPNREF, AVSResult, IsSuccessful) VALUES ('81ee1fad-2595-4c83-bab5-05064fdce681',	'12/9/2009 1:30:38 PM',	@OrderID, NULL, NULL, NULL, NULL,	NULL, NULL, '3', 'False', 60.0000, 'VERISIGN', NULL, 'TRXTYPE[1]=D&USER[12]=testmerchant&VENDOR[12]=testmerchant&PARTNER[11]=silverscape&PWD[9]=XXXXXXXXX&ORIGID[12]=V18A2A280368', 'RESULT=0&PNREF=V78A1EE2928B&RESPMSG=Approved&AUTHCODE=988PNI&AVSADDR=Y&AVSZIP=N&CVV2MATCH=Y', '988PNI', 'V78A1EE2928B', NULL, 'True')
			INSERT [Transaction](TransactionGroupingID, TransactionDate, OrderID, CartID, OpenPaymentID, UserID, CCName, CCType, CCExpirationDate, TransactionTypeID, IsLive, OrderTotal, PaymentGateway, PaymentMethod, TransactionCommand, TransactionResult, TransactionCode, TransactionPNREF, AVSResult, IsSuccessful) VALUES ('e2031b4b-d4da-432c-88ab-3ae7fa094816',	'12/10/2009 1:48:37 PM', NULL, NULL, NULL, 1, 'John Smith', 'Visa', '12/1/2009 12:00:00 AM', '1', 'False', 25.0000, 'VERISIGN', 'Credit Card', 'TRXTYPE[1]=S&ACCT[16]=411111XXXXXX1111&NAME[10]=John Smith&EXPDATE[4]=1209&CVV2[3]=XXX&TENDER[1]=C&INVNUM[1]=0&AMT[5]=25.00&CURRENCY[3]=USD&TAXAMT[4]=0.00&SHIPPINGAMT[4]=0.00&COMMENT1[31]=OrderID 0   CartID 0   UserID 0&STREET[20]=123 Mockingbird Lane&BILLTOSTREET2[0]=&CITY[13]=Beverly Hills&STATE[2]=CA&COUNTRY[13]=United States&ZIP[5]=90210&PHONENUM[13]= 555 867 5309&EMAIL[19]=zfloyd 352media com&FIRSTNAME[4]=John&LASTNAME[5]=Smith&USER[12]=testmerchant&VENDOR[12]=testmerchant&PARTNER[11]=silverscape&PWD[9]=XXXXXXXXX', 'RESULT=0&PNREF=V78A1EE5222D&RESPMSG=Approved&AUTHCODE=165PNI&AVSADDR=Y&AVSZIP=N&CVV2MATCH=Y&IAVS=N', '165PNI', 'V78A1EE5222D', 'Y&N', 'True')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Events') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Event'))
		BEGIN
			INSERT Event(Title,Location,Description,Summary,BeginDate,EndDate,Active,Featured,HasBeginTime,HasEndTime)       VALUES('352 Media Group Softball Game','Diamond Sports Park','Come watch 352 Media Group play softball at 6:30 PM Tuesday night! Don''t forget to bring your glove.<br />  ','352 Media Group Co-ed Softball Team plays at 6:30', DATEADD(hh, 18, DATEADD(mi, 30, @todaysDate)),DATEADD(hh, 19, DATEADD(mi, 40, @todaysDate)),'1','0','1','1')
			INSERT Event(Title,Location,Description,Summary,BeginDate,EndDate,Active,Featured,HasBeginTime,HasEndTime)       VALUES('Sample Event','352 Media Group','This is a sample event. In this space you would write more detail about what the event will entail. For example you could write more about a speaker or a reminder to bring something to the event.<br />  ','Sample event',DATEADD(d, 1, DATEADD(hh, 12, @todaysDate)),DATEADD(d, 1, DATEADD(hh, 13, @todaysDate)),'1','0','1','1')
			INSERT Event(Title,Location,Description,Summary,BeginDate,EndDate,Active,Featured,HasBeginTime,HasEndTime)       VALUES('Usability Webinar','352  Media Group','We will host a webinar on website usability. Presenters will include our President and CEO Geoff Wilson, Vice President of Marketing, Peter VanRysdam, Director of Development, Kelli Kimpton, and a Senior Designer Lincoln Anderson.We will review a few example sites live in the webinar and point out positives and negatives of each site''s usability. We will show you how to turn your website visitors into customers. <br />  ','Our staff talks about website usability',DATEADD(d, 2, DATEADD(hh, 13, @todaysDate)),DATEADD(d, 2, DATEADD(hh, 14, @todaysDate)),'1','0','1','1')
			INSERT Event(Title,Location,Description,Summary,BeginDate,EndDate,Active,Featured,HasBeginTime,HasEndTime)       VALUES('Web Design Directory Launched','www.352media.com/web-design-company-directory','Our Web Design Directory will launch July 16th!<br />  <br />  &nbsp;The site lists companies by city and state and lists them in order of  rank based on user ratings.&nbsp; With so many companies out there, this is  a great way for people to wade through the choices.<br />  <br />  The latest  upgrade to the site gives companies the ability to become "featured,"  simply by putting a badge like the one below on their site.&nbsp; Once they  register to be included, they recieve instructions to help them get  even more exposure on the site. <br />  ','352 Media Group Launches Web Design Directory',DATEADD(d, 3, DATEADD(hh, 8, @todaysDate)),DATEADD(d, 3, DATEADD(hh, 9, @todaysDate)),'1','0','1','1')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'File Library') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'File'))
		BEGIN
			INSERT [File](FileTypeID,Name,Location,Image,FileSize,UploadDate,Summary,Description,Active,Featured)       VALUES(1,'Test PDF','PLANpage121200922658PM63.pdf', '414200954826 P1113200943406PM6121200922722PM63.jpg',541937,@todaysDate,'This Web site allows you to test drive our robust features that are available to be integrated into your Web site. This entire Web site is controlled by our easy-to-use Content Management System and also includes our Dynamic Header, News & Press Release Center and HTML Newsletter & E-Mail Blaster features.', 'This Web site allows you to test drive our robust features that are available to be integrated into your Web site. This entire Web site is controlled by our easy-to-use Content Management System and also includes our Dynamic Header, News & Press Release Center and HTML Newsletter & E-Mail Blaster features.', 1, 0)
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Forum') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Forums'))
		BEGIN
			INSERT ForumGroups(GroupName) VALUES('General')
			
			DECLARE @ForumID int
			INSERT Forums(Title,Description,Premoderated,GroupID,MembersOnly,OrderByNumber,RestrictTopicCreation)       VALUES('352 Media Demo Site Forum','This is where we talk about stuff','0',@@Identity,'0','0','0')
			SET @ForumID = @@Identity
			
			INSERT ForumTopics(ForumID,UserID,Subject,Visible,LastMessageID,IsSticky,IsClosed,ViewsCount,RepliesCount)       VALUES(@@Identity,'1','Windows 7 Better Than Vista','1','1','0','0','6','1')
			INSERT ForumMessages(TopicID,UserID,Body,CreationDate,Visible,IPAddress)       VALUES(@@Identity,'1','Recent reports show Microsoft''s new operating system, Window''s 7 has better functionality and design than Window''s Vista. Most PC users have been sticking to XP until Microsoft releases an operating system that runs better. What will it take for you to switch from XP?',convert(datetime,'Aug  3 2009  4:45PM'),'1','24.250.248.52')
			
			INSERT ForumTopics(ForumID,UserID,Subject,Visible,LastMessageID,IsSticky,IsClosed,ViewsCount,RepliesCount)       VALUES(@@Identity,'1','Youtube''s New Feature: Local News','1','2','0','0','91','1')
			INSERT ForumMessages(TopicID,UserID,Body,CreationDate,Visible,IPAddress)       VALUES(@@Identity,'1','Youtube has partnered with around 200 local news stations. The news stations will split the revenues with Youtube for ads beside the videos. I get my local news from twitter or local newspaper sites. Will anyone use this feature?',convert(datetime,'Aug  3 2009  4:51PM'),'1','24.250.248.52')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'News Press') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'NewsPress'))
		BEGIN
			DECLARE @NewsPressID int
			DECLARE @NewsPressCategoryID int
			INSERT INTO NewsPressCategory ([Name], Active, DisplayOrder) VALUES ('Press Releases', 'True', 0)
			SET @NewsPressCategoryID = @@Identity			
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group to Attend TFM&A Show in London, England', 'Development Team', '20090219 00:00:00', 'Web design company to release small business Web design service to international community', '<p>Award-winning Web design company, 352 Media Group, will be exhibiting at the Technology of Marketing and Advertising (TFM&amp;A) show, Feb. 24-25 in London, England.</p> <p>At TFM&amp;A, 352 Media Group’s first international industry show, the Web design company will officially release EXPRESS, a small business Website design service, to the international community.</p> <p>The EXPRESS package utilizes several standard layouts that offer excellent usability and functionality. Each client works with one of 352 Media Group’s professional designers to tailor the Website colors, graphics and style specifically for their organization’s brand.</p> <p>“Considering today’s economic climate and the favorable exchange rate for U.K. companies buying American, we’re looking forward to speaking with companies face-to-face about the quality and affordability of 352 Media Group’s custom services and EXPRESS package,” said Peter Van Rysdam, vice president of marketing for 352 Media Group.</p> <p>EXPRESS enables 352 Media Group’s expert designers to streamline the design process while still tailoring the site to the client’s specific needs, offering a much more customizable option than template Website designs.</p> <p>352 Media Group’s EXPRESS small business Website design package includes:</p> <ul> <li> Design consultation</li> <li>Web design tailored around choice of standard page layouts</li> <li>Two revision rounds with one of 352 Media Group’s professional Website designers</li> <li>Easy-to-use content management system (CMS) so customers can edit their own site content on an ongoing basis, plus a 1-hour training session and training manual</li> <li>Content integration for home page and four interior pages</li> <li>Access to 352 Media Group’s stock photo library</li> <li>Creation of one Web form for lead gathering</li> <li>Attendees can find 352 Media Group at booth H38 at TFM&amp;A. Before the show, visit <a href="http://www.352media.com/tfmagiveaway.aspx" target="_blank">www.352media.com/tfmagiveaway.aspx</a> to learn about 352 Media Group’s special promotions at the event.</li> </ul> <h2>About 352 Media Group</h2> <p>352 Media Group <a href="http://www.352media.com" target="_blank">(www.352Media.com)</a> is an award-winning Web design company and one of 16 approved Microsoft vendor partners. Headquartered in Gainesville, Fla., with offices in Atlanta, Los Angeles, New York and Seattle, 352 Media Group is a full-service interactive agency, offering a wide range of services, including Web design, ASP.NET Web application development, Flash and Silverlight development, ecommerce and more.</p> <p>For more information on EXPRESS, 352 Media Group’s small business Website design service, visit <a href="http://www.352media.com/express_Web_design.aspx" target="_blank">www.352media.com/express_Web_design.aspx</a>.</p>', 1, 1, 0)			
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)		
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group to Attend TFM&A Show in London, England','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
				VALUES('TopSEOs Acknowledges 352 Media Group As One of the Top 5 Web Design Firms for the Month of February', 'Development Team', '20090201 00:00:00', '352 Media Group is named an exceptional web design firm for the month of February 2009 by TopSEOs.', '<p>352 Media Group has secured the fifth rank on this month’s list of the top web design firms. The monthly rankings list published by TopSEOs is a guide to the cream of the crop internet marketing vendors in the industry.</p><p>“352 Media Group has put in a lot of hard work into establishing ourselves as a leading Web development firm and we are delighted that our efforts have been acknowledged in such an exciting way,” said Peter VanRysdam, 352 Media Group’s vice president of marketing.</p><p>352 Media Group is included in this list for its consistent performance and the superior services rendered to its clients.</p><p>TopSEOs seeks out the leading firms in the industry through a rigorous evaluation criteria that includes:</p><ul>    <li>Competitive advantage</li>    <li>Superior services and pricing</li>    <li>Customer and technical support</li>    <li>Response to client problems</li>    <li>Innovations that set it apart from the competition</li>    <li>Overall efficiency</li>    <li>Overall performance</li></ul><p>As part of the evaluation process, clients of 352 Media Group are asked to give feedback on general and project specific questions such as:</p><ul>    <li>Rate your overall experience.</li>    <li>What type of needs analysis was conducted before work initiated?</li>    <li>What form of planning and strategy was undertaken by the agency before they started on your project?</li>    <li>Do your pages pass W3C standards?</li>    <li>Does your website have a search engine friendly design?</li></ul><p>“The whole industry looks to us to identify reliable and accurate benchmarks and 352 Media Group has proven by its performance that they deserve to be on this coveted list”, shared Jeev Trika, partner at TopSEOs.</p><p>352 Media Group,&nbsp;<a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p><h2>About TopSEOs</h2><p>Since its introduction in 2002, TopSEOs has been identified as an independent authority on vendors who supply internet marketing products and services ranging from the best search engine optimization companies to the best pay per click management tools. In addition, TopSEOs connects thousands of businesses each year that are looking for internet marketing services with those who provide it.</p><p>With dedicated online presence in the US, UK, Canada and Australia, TopSEOs continues to make a global impact in the internet marketing arena.</p><p></p><p>Company Contact:<br />847-329-1159<br />service@topseos.com<br /><a href="http://www.topseos.com">www.topseos.com</a></p>', 1, 1, 0)		
 			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'topseos Acknowledges 352 Media Group As One of the Top 5 Web Design Firms for the Month of February','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
 			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
 				VALUES('352 Media Group Announces Small Business Web Site Design Service', 'Development Team', '20090123 00:00:00', 'Award-winning Web design company, 352 Media Group, announces the release of EXPRESS, a small business Web site design service.', '<p>Award-winning Web design company, 352 Media Group, announces the release of EXPRESS, a small business Web site design service.</p><p>The EXPRESS package utilizes several standard layouts that offer excellent usability and functionality. Each client works with one of 352 Media Group''s professional designers to tailor the Website colors, graphics and style specifically for their organization''s brand.</p><p>"Oftentimes, a professionally designed Web site can be cost-prohibitive for small-to-midsize businesses, especially in this economic climate," said Peter VanRysdam, vice president of marketing for 352 Media Group. "EXPRESS enables us to streamline the design process while still tailoring the site to the client''s specific needs. The service makes professionally designed Websites accessible to smaller budget organizations, offering a much more customizable option than template Web site designs."</p><p>352 Media Group''s EXPRESS small business Web site design package includes:</p><ul>    <li>Design consultation</li>    <li>Web design tailored around choice of standard page layouts</li>    <li>Two revision rounds with one of 352 Media Group''s professional Website designers</li>    <li>Easy-to-use content management system (CMS) so customers can edit their own site content on an ongoing basis, plus a 1-hour training session and training manual</li>    <li>Content integration for home page and four interior pages</li>    <li>Access to 352 Media Group''s stock photo library</li>    <li>Creation of one Web form for lead gathering</li></ul>    <h2>About 352 Media Group</h2>    <p>352 Media Group is an award-winning Web design company and one of 16 approved Microsoft vendor partners. Headquartered in Gainesville, Fla., with offices in Atlanta, Los Angeles, New York and Seattle, 352 Media Group is a full-service interactive agency, offering a wide range of services, including Web design, ASP.NET Web application development, Flash and Silverlight development, ecommerce and more.</p>    <p>For more information on EXPRESS, 352 Media Group''s small business Website design service, visit <a href="http://www.352media.com/express_Web_design.aspx">http://www.352media.com/express_Web_design.aspx.</a></p></ul>', 1, 1, 0)			
 			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Announces Small Business Web Site Design Service','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
 			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('This Is An Example News Article', 'Development Team', '20090312 00:00:00', 'This is where you could place a news article or press release...', '<p>This is an example news article.  If you order 352 Media Group’s News &amp; Press Release Center for your own Web site,  you will be able to easily add or edit news articles through a very simple administrative interface.</p><p>Adding a news article is quick and easy!  It is as simple as typing a document in a word processor.  You can even take an existing press release or news story that you have written in a program like Microsoft Word and copy and paste it into the administrative interface.</p><p>Try it for yourself… login using the demo administrator account and try adding your own news articles here to see how easy it is!</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'This Is An Example News Article','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group Repeats on Inc. 5000 List', 'Development Team', '20080820 00:00:00', '352 Media Group, an interactive marketing firm, is on Inc. Magazine’s “Inc. 5000 List” for the second consecutive year. The list, which indexes the nation’s fastest growing privately-held companies in America, was released August 20th, 2008.', '<p>352 Media Group, an interactive marketing firm, is on Inc. Magazine’s “Inc. 5000 List” for the second consecutive year. The list, which indexes the nation’s fastest growing privately-held companies in America, was released August 20th, 2008.</p><p>“We’ve been fortunate to grow in many ways over the past few years, and not just financially,” said 352 Media Group’s President and CEO, Geoff Wilson, whose company has seen significant growth in revenue and number of employees. “This is a testament to the hard work of our staff and the quality of work we’ve been able to produce for our clients.”</p><p>The list, which is available online at <a href="http://www.inc.com/inc5000/">www.inc.com/inc5000</a>, compares the growth rate of companies over a three year period and ranks businesses on the overall growth percentage. 352 Media Group, which grew by almost 84% over that time, ranked 3,721 overall. 352 Media was also among the top 250 Florida-based companies. The company ranked 3,384 in 2007.</p><p>“Our company has always focused on responsible growth,” said Peter VanRysdam, 352 Media Group’s Vice President of Marketing. “Our business grew in an era while many ‘dot-com’s’ were failing, and has continued to grow even in the recent economy.”</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Repeats on Inc. 5000 List','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
						
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
				VALUES('352 Media Group Among Fastest Growing Marketing Service Agencies According to Ad Age', 'Development Team', '20080819 00:00:00', '352 Media Group, an interactive marketing firm, is among the 100 fastest growing marketing services agencies according to a survey released by AdAge Magazine.', '<p>352 Media Group, an interactive marketing firm, is among the 100 fastest growing marketing services agencies according to a survey released by AdAge Magazine. The study analyzed hundreds of agencies'' revenues and growth percentages over the past two years. 352 Media Group is the 57th fastest growing company in this sector and the 210th largest by overall revenue.</p><p>This is 352 Media Group’s fourth consecutive year on the list.  The full list is available at <a href="http://adage.com/datacenter/datapopup.php?article_id=126713">http://adage.com/datacenter/datapopup.php?article_id=126713</a>.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world. </p>', 1, 1, 0)					
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Among Fastest Growing Marketing Service Agencies According to Ad Age','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
				VALUES('352 Media Ranked as Top 3 Web Designer Nationally by TopSEOs.com', 'Development Team', '20080801 00:00:00', '352 Media Group, an interactive marketing firm, was named among the top 3 Web Design companies for 2008. The list, released in August, ranks Web Design agencies based on TopSEO’s.com’s independent market research.', '<p>352 Media Group, an interactive marketing firm, was named among the top 3 Web Design companies for 2008. The list, released in August, ranks Web Design agencies based on TopSEOs.com’s independent market research. The complete list is available at <a href="http://www.topseos.com/rankings-of-best-web-design-companies" http:="" www.topseos.com="" rankings-of-best-web-design-companies=""></a>.</p><p>“Once again, we’re honored to see our work appreciated in the industry,” said Geoff Wilson, 352 Media Group’s President and CEO. “TopSEOs is a highly respected independent authority in the interactive field, so this ranking means a lot to our staff.”</p><p>Topseos seeks out the leading firms in the industry through a rigorous evaluation criteria that includes:</p><ul>    <li>Competitive advantage</li>    <li>Superior services and pricing</li>    <li>Customer and technical support</li>    <li>Response to client problems</li>    <li>Innovations that set it apart from the competition</li>    <li>Overall efficiency</li>    <li>Overall performance</li></ul><p>As part of the evaluation process, clients of 352 Media Group are asked to give feedback on general and project specific questions such as:</p><ul>    <li> Rate your overall experience.</li>    <li>What type of needs analysis was conducted before work initiated?</li>    <li>What form of planning and strategy was undertaken by the agency before they started on your project?</li>    <li>Do your pages pass W3C standards?</li>    <li>Does your website have a search engine friendly design?</li></ul><p>This is not 352 Media Group’s first appearance on TopSEO’s rankings. 352 Media was ranked 5th in last year’s study.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p><p>Since its introduction in 2002, TopSEOs has been identified as an independent authority on vendors who supply internet marketing products and services ranging from the best search engine optimization companies to the best pay per click management tools. In addition, TopSEOs connects thousands of businesses each year that are looking for internet marketing services with those who provide it.</p><p>With dedicated online presence in the US, UK, Canada and Australia, TopSEOs continues to make a global impact in the internet marketing arena.</p>', 1, 1, 0) 			
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Ranked as Top 3 Web Designer Nationally by TopSEOs.com','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
				VALUES('352 Media Group Launches American Body Armor™ Web Site for BAE Systems Product Group', 'Development Team', '20080722 00:00:00', '352 Media Group, and award winning interactive marketing firm, announces the launch of the American Body Armor (ABA) web site. The site, which can be viewed online at http://www.americanbodyarmor.com, was developed in conjunction with BAE Systems Product Group. 352 Media Group is a preferred Web development vendor for all BAE Systems Products Group’s brands.', '<p>352 Media Group, and award winning interactive marketing firm, announces the launch of the American Body Armor (ABA) web site. The site, which can be viewed online at www.americanbodyarmor.com, was developed in conjunction with BAE Systems Product Group. 352 Media Group is a preferred Web development vendor for all BAE Systems Products Group’s brands.</p><p>"Our company is privileged to work alongside a company dedicated to saving lives,” said Peter VanRysdam, 352 Media’s Vice President of Marketing. “Our hope is that the new and improved site increases awareness and puts ABA’s products in the hands of more law enforcement professionals who need them.”</p><p>“We’re extremely proud of the new Web site for the American Body Armor brand,” said Mark Zucco, Brand Manager for American Body Armor. “This site represents the first launch since our rededication to online marketing. We’re working with 352 Media Group to enhance the user experience across all of our brands’ Web sites.”</p><p>The ABA site, which is geared towards law enforcement professionals, provides detailed descriptions of their line of ballistic products as well as information on purchasing the products.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p>', 1, 1, 0)			
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Launches American Body Armor™ Web Site for BAE Systems Product Group','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)				
				VALUES('Humana Foundation Partners With 352 Media Group To Create Wellness Information Web Site', 'Development Team', '20080701 00:00:00', 'The Humana Foundation, the philanthropic arm of Humana Inc., one of the nation''s leading health-benefits companies, has selected 352 Media Group to enhance the Wellness Information Zone (WZ) Web site.', '<p>The Humana Foundation, the philanthropic arm of Humana Inc., one of the nation''s leading health-benefits companies, has selected 352 Media Group to enhance the Wellness Information Zone (WZ) Web site.</p><p>The free Web site is a key component of the Wellness Information Zone Project, developed by The Humana Foundation in partnership with Libraries For the Future (LFF). Consumers will find basic and up-to-date health information in everyday language at <a href="http://www.wellzone.org">www.wellzone.org</a>.</p><p>“There is so much health information available today and some of it is misleading,” said Virginia Judd, executive director of The Humana Foundation. “Wellzone.org connects anyone with Internet access directly to reliable health information and now, 352 Media Group is enhancing navigational features to make the site even easier to use.”</p><p>LFF Executive Director Bruce Astrein added, “Libraries are a wonderful resource for health information, and this project adds a new dimension with designated WZ centers in libraries and specialized librarian training.”</p><p>The project pilot launched in September 2007 in Atlanta. Since then, The Humana Foundation and LFF have increased promotion to empower people with health information and continue to monitor the pilot’s success.</p><p>Judd added, “Our ‘high tech, high touch’ approach to health literacy also includes Humana employee volunteers as trained health information guides” at WZ centers located in nonprofit organizations.</p><p>“We’re thrilled for the opportunity Humana has given us to work on a site that will have such a positive impact on people’s lives,” said Peter VanRysdam, 352 Media’s vice president of marketing. “Our goal is to develop a site that exceeds the Foundation’s expectations.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p><p>The Humana Foundation supports and nurtures charitable activities that promote healthy lives and healthy communities. The Foundation is located in Louisville, Kentucky, the site of Humana''s corporate headquarters.</p><p>Libraries for the Future is a national nonprofit that supports innovation and investment in America''s libraries. Since 1992, LFF has helped public libraries respond creatively to the changing needs and opportunities of their communities. Through professional development activities, targeted grants, forums, and research projects, LFF transforms libraries into 21st century community centers for information and education.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'Humana Foundation Partners With 352 Media Group To Create Wellness Information Web Site','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
						
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group is now Microsoft Certified Partner', 'Development Team', '20080225 00:00:00', '352 Media Group, the award-winning Web design, Web application development, CD and DVD production and motion graphics projects development company, today announced that the company has achieved status as a Microsoft Certified Partner. This designation represents a high degree of competence and expertise with Microsoft technologies, which 352 Media earned in the area of Custom Development Solutions.', '<p>352 Media Group, the award-winning Web design, Web application development, CD and DVD production and motion graphics projects development company, today announced that the company has achieved status as a Microsoft Certified Partner. This designation represents a high degree of competence and expertise with Microsoft technologies, which 352 Media earned in the area of Custom Development Solutions.</p><p>“We are pleased to have earned this important designation as a Microsoft Certified Partner,” said Geoff Wilson, President and CEO of 352 Media. “This enables us to offer a real set of advantages and important expertise which we can pass on to our clients to help them get ahead.”</p><p>Requirements for earning this status include having multiple Microsoft Certified Professionals on staff, attending certain training events, and receiving references from clients for whom Microsoft tools have been used for development.</p><p>The Custom Development Solutions status which 352 Media has earned is described by Microsoft as “designed for technology partners who provide custom-developed solutions to customers who require value-added capabilities to optimize business and operational effectiveness.” The designation is for Microsoft partners who develop with Microsoft Visual Studio 2005, Visual Studio Tools for Office, SQL Server, Windows Server 2003, BizTalk, Windows XP, and Microsoft Office 2003. Areas of specialization for this competency are Application Server Environment Development, Smart Client Development and Web Development.</p><p>With its unique integrated team approach, 352 Media Group’s wide range of award-winning services include Web design, information architecture, ASP.NET Web application development, Intranet and Extranet development, Web marketing, Flash animation, E-commerce and more.</p><p>Since its inception over 10 years ago, 352 Media Group has been developing Web sites, interactive media projects, Web applications, CDs, DVDs and interactive marketing campaigns for small businesses and Fortune 1000 clients around the globe. Clients include American Express, Ben & Jerry’s, Microsoft, Earthlink, Outback Steakhouse, and University of Florida among others. For more information, please visit <a href="http://www.352media.com">www.352media.com</a>.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group is now Microsoft Certified Partner','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group Continues Winning Ways at Addy Awards Gala', 'Development Team', '20080222 00:00:00', '352 Media Group took home top honors at the Addy Awards Banquet for the fourth straight year, which recognizes design work produced in 2007. 352 Media added to their trophy case by winning twelve more awards including the Best in Show – Interactive honor. The ceremony was hosted by the Gainesville Advertising Federation, a member of the fourth district of the American Advertising Federation. A panel of industry experts selected the winner’s from hundreds of entries.', '<p>352 Media Group took home top honors at the Addy Awards Banquet for the fourth straight year, which recognizes design work produced in 2007. 352 Media added to their trophy case by winning twelve more awards including the Best in Show – Interactive honor. The ceremony was hosted by the Gainesville Advertising Federation, a member of the fourth district of the American Advertising Federation. A panel of industry experts selected the winner’s from hundreds of entries.</p><p>“We strive to bolster the user experience on every project we create,” said Peter VanRysdam, 352 Media’s Vice President of Marketing. “These awards, which judge our work primarily on its design merits, recognize the success of that focus on user interface design.”</p><p>352 Media received awards in several categories, including a Gold Addy for the Web Video Host on 352 Media’s company history page, as well as Gold Addy’s for the Third Millennium Trade Show Video, the American Express Travel Web site campaign, and the University of Florida Genetics Department Web site. Silver Addy’s were awarded to 352 Media Group for 352’s own business card design, the Newport Group Web site, CoCo’s Ballroom Boutique’s e-commerce Web site, the BuyCast’s Web site, the NCCER Web site design, Ranting and Raving – the 352 Media Group Blog, and 352 Media’s fleet of wrapped vehicles.</p><p>Both the 352 Web Video Host and the University of Florida Genetics Web site were among finalists for the Best in Show – Interactive award, with the Web Video Host taking the prize. Gold award winners will go on to compete in the regional completion before advancing to the national awards later this year.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Continues Winning Ways at Addy Awards Gala','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group Opens Office in Tampa, Hires 20-Year Technology Veteran to Run Location', 'Development Team', '20080222 00:00:00', '352 Media Group, the award-winning Web design, Web application development, CD and DVD production and motion graphics projects development company, has opened an office at 401 Harbour Place Drive, Unit 1426 in Tampa, Florida. The office, officially opened on March 1, is the second of two Florida sales offices for the company, which is headquartered in Gainesville and has 50 employees in seven locations total across the U.S.', '<p>352 Media Group, the award-winning Web design, Web application development, CD and DVD production and motion graphics projects development company, has opened an office at 401 Harbour Place Drive, Unit 1426 in Tampa, Florida. The office, officially opened on March 1, is the second of two Florida sales offices for the company, which is headquartered in Gainesville and has 50 employees in seven locations total across the U.S.</p><p>Leonard A. Doland, a 20-year veteran of technology sales and sales management, will lead the Tampa office as Regional Sales Manager. Prior to joining 352 Media Group, Doland served as Director of Sales for Magnetic, a web development, application, product and services firm, where he was responsible for significant year-over-year growth that included three consecutive record quarters. Doland has also served as Director of Sales for Bayshore Solutions and Applications Consulting Specialists, Inc., as well as Director of Business Development for Allidex, Inc.</p><p>With its unique integrated team approach, 352 Media Group’s wide range of award-winning services include Web design, information architecture, ASP.NET Web application development, Intranet and Extranet development, Web marketing, Flash animation, E-commerce and more.</p><p>Since its inception over 10 years ago, 352 Media Group has been developing Web sites, interactive media projects, Web applications, CDs, DVDs and interactive marketing campaigns for small businesses and Fortune 1000 clients around the globe. Clients include American Express, Ben & Jerry’s, Microsoft, Earthlink, Outback Steakhouse, and University of Florida among others. For more information, please visit <a href="http://www.352media.com">www.352media.com</a>.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Opens Office in Tampa, Hires 20-Year Technology Veteran to Run Location','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('352 Media Group Creates “Meet the Candidates” Website', 'Development Team', '20071218 00:00:00', 'Award-Winning Web Developers Utilize New Microsoft® Silverlight™ Technology To Provide Voters with Quick, Easy Reference on Candidates and Their Issues', '<p>352 Media Group, the award-winning Web design, Web application development, CD and DVD production and motion graphics projects development company, has created a website, the “2008 Presidential Candidate Filter”, where voters can learn about the presidential candidates and the issues they support and oppose. The website can be found at <a href="http://candidates.352media.com/">http://candidates.352media.com/</a>.</p><p>352 Media Group’s “2008 Presidential Candidate Filter” is designed to give users a quick overview of where the candidates stack up on the issues that matter most to them. Developed using Microsoft Silverlight technology, the site provides a visual representation for quick reference on where the candidates stand on issues such as abortion rights, the death penalty, Iraq war withdrawal, same-sex marriage, and many more. To get more information on each candidate, users can simply click on the candidate’s photo, or click on the supplied link to the candidate’s official website.</p><p>Microsoft&#174; Silverlight&#8482; is a cross-browser, cross-platform plug-in for delivering the next generation of .NET based media experiences and rich interactive applications for the Web. Silverlight offers a flexible programming model that supports AJAX, VB, C#, Python, and Ruby, and integrates with existing Web applications. Silverlight supports fast, cost-effective delivery of high-quality video to all major browsers running on the Mac OS or Windows.</p><p>With its unique integrated team approach, 352 Media Group’s wide range of award-winning services include Web design, information architecture, ASP.NET Web application development, Intranet and Extranet development, Web marketing, Flash animation, E-commerce and more.</p><p>Since its inception over 10 years ago, 352 Media Group has been developing Web sites, interactive media projects, Web applications, CDs, DVDs and interactive marketing campaigns for small businesses and Fortune 1000 clients around the globe. Clients include American Express, Ben &amp; Jerry’s, Microsoft, Earthlink, Outback Steakhouse, and University of Florida among others.</p><p>For more information, please visit <a href="http://www.352media.com">www.352media.com</a>.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'352 Media Group Creates “Meet the Candidates” Website','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
			
			INSERT INTO dbo.NewsPress(Title, Author, Date, Summary, StoryHTML, Featured, Active, Archived)
				VALUES('TopSEOs.com Ranks 352 Media Group Among Top Five Web Designers', 'Development Team', '20071209 00:00:00', '352 Media Group, an award winning interactive marketing firm, ranks as one of the top five Web design companies based on a report published this week. Released by TopSEOs.com, a resource for evaluating Internet marketing and services providers, the report ranks 352 Media Group as the fourth leading Web design firm.', '<p>352 Media Group has secured the fifth rank on this month’s list of the top web design firms. The monthly rankings list published by TopSEOs is a guide to the cream of the crop internet marketing vendors in the industry.</p><p>“352 Media Group has put in a lot of hard work into establishing ourselves as a leading Web development firm and we are delighted that our efforts have been acknowledged in such an exciting way,” said Peter VanRysdam, 352 Media Group’s vice president of marketing.</p><p>352 Media Group is included in this list for its consistent performance and the superior services rendered to its clients.</p><p>TopSEOs seeks out the leading firms in the industry through a rigorous evaluation criteria that includes:</p><ul>    <li>Competitive advantage</li>    <li>Superior services and pricing</li>    <li>Customer and technical support</li>    <li>Response to client problems</li>    <li>Innovations that set it apart from the competition</li>    <li>Overall efficiency</li>    <li>Overall performance</li></ul><p>As part of the evaluation process, clients of 352 Media Group are asked to give feedback on general and project specific questions such as:</p><ul>    <li>Rate your overall experience.</li>    <li>What type of needs analysis was conducted before work initiated?</li>    <li>What form of planning and strategy was undertaken by the agency before they started on your project?</li>    <li>Do your pages pass W3C standards?</li>    <li>Does your website have a search engine friendly design?</li></ul><p>“The whole industry looks to us to identify reliable and accurate benchmarks and 352 Media Group has proven by its performance that they deserve to be on this coveted list”, shared Jeev Trika, partner at topseos.</p><p>352 Media Group, <a href="http://www.352media.com">www.352media.com</a>, is a full-service interactive development firm headquartered in Gainesville, Florida, with offices in Atlanta, Los Angeles, New York, and Seattle. 352 Media Group provides its clients with a complete approach to business development, offering Web development, Web applications, CD/DVD Production, motion graphics, and more. Since its founding in 1997, 352 Media Group has served more than 1000 clients across the United States and around the world.</p><h2>About TopSEOs</h2><p>Since its introduction in 2002, TopSEOs has been identified as an independent authority on vendors who supply internet marketing products and services ranging from the best search engine optimization companies to the best pay per click management tools. In addition, TopSEOs connects thousands of businesses each year that are looking for internet marketing services with those who provide it.</p><p>With dedicated online presence in the US, UK, Canada and Australia, topseos continues to make a global impact in the internet marketing arena.</p>', 1, 1, 0)
			SET @NewsPressID = @@Identity
			INSERT INTO NewsPressNewsPressCategory (NewsPressID, NewsPressCategoryID) VALUES (@NewsPressID, @NewsPressCategoryID)
			INSERT SEOData(PageURL,Title,Description,Keywords,DateCreated,DateLastUpdated)       VALUES('~/news-press-details.aspx?id=' + cast(@NewsPressID as varchar),'TopSEOs.com Ranks 352 Media Group Among Top Five Web Designers','The NewsPress Description would go here.','Keyword 1, keyword 2, keyword 3, keyword 4 ',getdate(),getdate())
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Newsletters') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Newsletter'))
		BEGIN
			DECLARE @NewsletterID int
			INSERT INTO Newsletter (CreatedDate, DisplayDate, Active, Featured, Archived, Title, Issue, [Description], Body, BodyText, Keywords, DesignID, Deleted)
					VALUES ('1/26/2009 2:56:53 PM', '3/13/2009 12:00:00 AM', 'True', 'True', 'False', 
							'This Is An Example HTML Newsletter', 'Issue I', 'Our HTML Newsletter & E-Mail Blaster feature allows you to quickly distribute your marketing message…',
							'<p>This is an example HTML Newsletter.  If you order 352 Media Group’s HTML Newsletter & E-Mail Blaster for your own Web site,  you will be able to create newsletters through a very simple administrative interface, and then you can blast the newsletter to an E-Mail list of your contacts!</p><p>Creating a newsletter is quick and easy!  It is as simple as typing a document in a word processor.  What you type will be surrounded by a professional design we create to give your newsletter a polished look.  Try it out yourself… login using the demo administrator account and try creating your own newsletter here to see how easy it is!</p><p>You can setup an unlimited number of E-Mail lists of contacts and blast your newsletter to any of the E-Mail lists you choose.  It is easy to add or remove contacts from any of your E-Mail lists, and your contacts also have the ability to automatically unsubscribe from your lists.</p><p>Try it and you will agree that our HTML Newsletter & E-Mail Blaster is the perfect solution for staying in touch with your customers and sending them special offers and announcements!</p>',
							'This is an example HTML Newsletter. If you order 352 Media Group’s HTML Newsletter & E-Mail Blaster for your own Web site, you will be able to create newsletters through a very simple administrative interface, and then you can blast the newsletter to an E-Mail list of your contacts!  Creating a newsletter is quick and easy! It is as simple as typing a document in a word processor. What you type will be surrounded by a professional design we create to give your newsletter a polished look. Try it out yourself… login using the demo administrator account and try creating your own newsletter here to see how easy it is!  You can setup an unlimited number of E-Mail lists of contacts and blast your newsletter to any of the E-Mail lists you choose. It is easy to add or remove contacts from any of your E-Mail lists, and your contacts also have the ability to automatically unsubscribe from your lists.  Try it and you will agree that our HTML Newsletter & E-Mail Blaster is the perfect solution for staying in touch with your customers and sending them special offers and announcements!',
							NULL, 1, 'False')
			SET @NewsletterID = @@Identity
			
			INSERT INTO Newsletter (CreatedDate, DisplayDate, Active, Featured, Archived, Title, Issue, [Description], Body, BodyText, Keywords, DesignID, Deleted)
					VALUES ('3/13/2009 1:17:36 PM', '1/21/2009 12:00:00 AM', 'True', 'True', 'False', 
							'Writing Effective Copy for Your Web Site', 'Issue II', 'Copywriting for the Web is very different than copywriting for print.  Here are some tips and tricks for effective Web copywriting',
							'<p>Copywriting for the Web is very different than copywriting for print. First and foremost, depending on your scenario make sure you do your research. If you hiring a copywriter to write content for your Web site make sure they have experience with Web copywriting. Or if you are writing your own content for your Web site make sure that these best practices of Web copywriting  are followed:</p><h2>Web site Users Don’t Read Your Web Pages</h2><p>Your Web site visitors rarely read your Web pages word by word; instead, they scan the page, picking and choosing individual words and sentences. In research on how people read Websites it’s determined that 79 percent of our users scan and only 16 percent read word-by-word.</p><p>A new study has been released that users read email newsletters even more abruptly than Web site pages concluding that emailed newsletters are the best way to maintain customer relationships on the Internet.</p><h2>Scannable Text is the Most Effective Way to Communicate</h2><p>Depending on the content depends on how it is organized. Make it your Web content user friendly so your users can find the information they are looking for easily.</p><img src="[[ROOT]]uploads/images/inverted-pyramid.gif"><ul>    <li>Highlight keywords (hypertext links serve as one form of highlighting; typeface variations and color are others)</li>    <li>Use clear and concise sub-headings (avoid "clever" ones)</li>    <li>Apply bulleted lists where appropriate (for example, like this list)</li>    <li>Emphasize one idea per paragraph (users will skip over any additional ideas if your information is cluttered)</li>    <li>Write using the inverted pyramid style, starting with the conclusion (opposite of what you were taught in grade school)</li>    <li>Minimize your letters/words (too much information will overwhelm your user, say straight and to the point, as if you were breaking up with someone)</li></ul>Credibility is KeyYour Web users may questions as to where the information on your site came from and whether it’s legit or a bunch of mumbo-jumbo. You can increase credibility by using high-quality graphics, excellent writing and outbound hypertext links. Including links to other sites showing other legitimate authors who have done their homework can help.',
							'Copywriting for the Web is very different than copywriting for print. First and foremost, depending on your scenario make sure you do your research. If you hiring a copywriter to write content for your Web site make sure they have experience with Web copywriting. Or if you are writing your own content for your Web site make sure that these best practices of Web copywriting are followed: Web site Users Don’t Read Your Web Pages Your Web site visitors rarely read your Web pages word by word; instead, they scan the page, picking and choosing individual words and sentences. In research on how people read Websites it’s determined that 79 percent of our users scan and only 16 percent read word-by-word. A new study has been released that users read email newsletters even more abruptly than Web site pages concluding that emailed newsletters are the best way to maintain customer relationships on the Internet. Scannable Text is the Most Effective Way to Communicate Depending on the content depends on how it is organized. Make it your Web content user friendly so your users can find the information they are looking for easily.  Highlight keywords (hypertext links serve as one form of highlighting; typeface variations and color are others) Use clear and concise sub-headings (avoid "clever" ones) Apply bulleted lists where appropriate (for example, like this list) Emphasize one idea per paragraph (users will skip over any additional ideas if your information is cluttered) Write using the inverted pyramid style, starting with the conclusion (opposite of what you were taught in grade school) Minimize your letters/words (too much information will overwhelm your user, say straight and to the point, as if you were breaking up with someone)  Credibility is Key   Your Web users may questions as to where the information on your site came from and whether it’s legit or a bunch of mumbo-jumbo. You can increase credibility by using high-quality graphics, excellent writing and outbound hypertext links. Including links to other sites showing other legitimate authors who have done their homework can help.',
							NULL, 1, 'False')
			INSERT INTO Newsletter (CreatedDate, DisplayDate, Active, Featured, Archived, Title, Issue, [Description], Body, BodyText, Keywords, DesignID, Deleted)
					VALUES ('3/13/2009 1:23:45 PM', '12/8/2008 12:00:00 AM', 'True', 'True', 'False', 
							'Common Web Site Usability Issues to Avoid', 'Issue III', 'A user friendly Web site is one of the most important factors to keep users coming back. Here are some common Web site usability issues to avoid.',
							'<p>A user friendly Web site is one of the most important factors to keep users coming back. Whether it’s making a purchase or information gathering, people are visiting your site for a reason. If visitors can’t find the information they need or can’t easily accomplish their task, then you can expect them to go someplace else…like your competitors'' Web site perhaps?</p><p>Here are some common Web site usability issues to avoid:</p><img src="[[ROOT]]uploads/images/ux3.bmp" width="297" height="261"><h2>Inconsistent, Confusing Site Navigation</h2><p>Your site navigation should be consistent throughout the entire Web site. Make your navigation titles clear and meaningful so users know what information is under each section.</p><h2>Misleading Registration Forms</h2><p>I had a client once who wanted to make their two-part form have a “Submit” button on the first part rather than “Next” or “Continue.” Misleading users into thinking they are done with a form when really there are more steps to follow is not the route to take. If a form is long, then split it up into multiple steps and show the user where they are with each step. This is a good rule of thumb for registration and checkout on e-commerce sites.</p><h2>Long Paragraphs and Difficult to Scan Content</h2><p>Content is king. Users scan and search for information on the Web. Users rarely read the content line by line. Your visitors know what they want and they are determined to find it. Use appropriate headings, action words, bullets and tables to convey information that is easy for the user to see.</p><h2>Misidentified and Unidentifed Links</h2><p>Make links underlined and/or a different font color than the other text. Avoid underlining words/phrases that aren’t links. It’s frustrating for users when clicking on an underlined word results in no action. Though some Web sites make links a different color only on mouse rollover, this is not the ideal situation because some users are not intuitive enough to know it’s a link without some type of minor differentiation from the outset.</p><h2>Hiding Content from Unregistered Users</h2><p>This is an annoying experience I often encounter; after searching for something on Google, and I find the information I need, but I have to be a member or fill out some long ridiculous form in order to view it? No bueno. Frequently, I will ditch that Web site and find information elsewhere that doesn’t require registration. Ask yourself if there is a better way to entice users to register on your site---perhaps a newsletter signup?</p><h2>Searching for Contact Information</h2><p>Usually visitors to your site are looking for some way to contact you. Make it easy for the users to find your contact information to submit both positive and constructive feedback.</p><h2>Summary</h2><p>You can avoid a cluttered and confusing Web site by developing a Web site that allows your visitors to intuitively perform the actions they need to perform.  Presenting information clearly and concisely to visitors will help them to find exactly what information they are seeking and complete their task with no problems. You can accomplish a user friendly Web site by giving visitors the correct choices in an obvious way.</p>',
							'A user friendly Web site is one of the most important factors to keep users coming back. Whether it’s making a purchase or information gathering, people are visiting your site for a reason. If visitors can’t find the information they need or can’t easily accomplish their task, then you can expect them to go someplace else…like your competitors Web site perhaps?    Here are some common Web site usability issues to avoid:   Inconsistent, Confusing Site Navigation Your site navigation should be consistent throughout the entire Web site. Make your navigation titles clear and meaningful so users know what information is under each section. Misleading Registration Forms I had a client once who wanted to make their two-part form have a “Submit” button on the first part rather than “Next” or “Continue.” Misleading users into thinking they are done with a form when really there are more steps to follow is not the route to take. If a form is long, then split it up into multiple steps and show the user where they are with each step. This is a good rule of thumb for registration and checkout on e-commerce sites. Long Paragraphs and Difficult to Scan Content Content is king. Users scan and search for information on the Web. Users rarely read the content line by line. Your visitors know what they want and they are determined to find it. Use appropriate headings, action words, bullets and tables to convey information that is easy for the user to see. Misidentified and Unidentifed Links Make links underlined and/or a different font color than the other text. Avoid underlining words/phrases that aren’t links. It’s frustrating for users when clicking on an underlined word results in no action. Though some Web sites make links a different color only on mouse rollover, this is not the ideal situation because some users are not intuitive enough to know it’s a link without some type of minor differentiation from the outset. Hiding Content from Unregistered Users This is an annoying experience I often encounter; after searching for something on Google, and I find the information I need, but I have to be a member or fill out some long ridiculous form in order to view it? No bueno. Frequently, I will ditch that Web site and find information elsewhere that doesn’t require registration. Ask yourself if there is a better way to entice users to register on your site---perhaps a newsletter signup? Searching for Contact Information Usually visitors to your site are looking for some way to contact you. Make it easy for the users to find your contact information to submit both positive and constructive feedback. Summary You can avoid a cluttered and confusing Web site by developing a Web site that allows your visitors to intuitively perform the actions they need to perform. Presenting information clearly and concisely to visitors will help them to find exactly what information they are seeking and complete their task with no problems. You can accomplish a user friendly Web site by giving visitors the correct choices in an obvious way.',
							NULL, 1, 'False')
			
			DECLARE @MailingListID int
			INSERT INTO MailingList (Name, Active, Deleted) VALUES ('352 Media Mailing List', 1, 0)
			SET @MailingListID = @@Identity
			
			DECLARE @SubscriberID int
			INSERT Subscriber(UserID,Email,DefaultNewsletterFormatID,Deleted)       VALUES(NULL,'support@352media.com','1','0')
			SET @SubscriberID = @@Identity
			
			INSERT MailingListSubscriber(MailingListID,SubscriberID,NewsletterFormatID,Active,EntityID) VALUES(@MailingListID,@SubscriberID,'1','1','6CA4D2FE-0080-4B93-B925-BCA43B613699')
			
			DECLARE @MailoutID int
			INSERT Mailout(NewsletterID,Timestamp,DisplayDate,Title,Issue,Description,Body,BodyText,Keywords,DesignID)       VALUES(@NewsletterID,@todaysDate,convert(datetime,'Dec  8 2008 12:00AM'),'Common Web Site Usability Issues to Avoid','Issue III','A user friendly Web site is one of the most important factors to keep users coming back. Here are some common Web site usability issues to avoid.','<p>A user friendly Web site is one of the most important factors to keep users coming back. Whether it''s making a purchase or information gathering, people are visiting your site for a reason. If visitors can’t find the information they need or can’t easily accomplish their task, then you can expect them to go someplace else…like your competitors'' Web site perhaps?</p><p>Here are some common Web site usability issues to avoid:</p><img src="[[ROOT]]uploads/images/ux3.bmp" width="297" height="261"><h2>Inconsistent, Confusing Site Navigation</h2><p>Your site navigation should be consistent throughout the entire Web site. Make your navigation titles clear and meaningful so users know what information is under each section.</p><h2>Misleading Registration Forms</h2><p>I had a client once who wanted to make their two-part form have a “Submit” button on the first part rather than “Next” or “Continue.” Misleading users into thinking they are done with a form when really there are more steps to follow is not the route to take. If a form is long, then split it up into multiple steps and show the user where they are with each step. This is a good rule of thumb for registration and checkout on e-commerce sites.</p><h2>Long Paragraphs and Difficult to Scan Content</h2><p>Content is king. Users scan and search for information on the Web. Users rarely read the content line by line. Your visitors know what they want and they are determined to find it. Use appropriate headings, action words, bullets and tables to convey information that is easy for the user to see.</p><h2>Misidentified and Unidentifed Links</h2><p>Make links underlined and/or a different font color than the other text. Avoid underlining words/phrases that aren’t links. It’s frustrating for users when clicking on an underlined word results in no action. Though some Web sites make links a different color only on mouse rollover, this is not the ideal situation because some users are not intuitive enough to know it’s a l','A user friendly Web site is one of the most important factors to keep users coming back. Whether it’s making a purchase or information gathering, people are visiting your site for a reason. If visitors can’t find the information they need or can’t easily accomplish their task, then you can expect them to go someplace else…like your competitors Web site perhaps?    Here are some common Web site usability issues to avoid:   Inconsistent, Confusing Site Navigation Your site navigation should be consistent throughout the entire Web site. Make your navigation titles clear and meaningful so users know what information is under each section. Misleading Registration Forms I had a client once who wanted to make their two-part form have a “Submit” button on the first part rather than “Next” or “Continue.” Misleading users into thinking they are done with a form when really there are more steps to follow is not the route to take. If a form is long, then split it up into multiple steps and show the user where they are with each step. This is a good rule of thumb for registration and checkout on e-commerce sites. Long Paragraphs and Difficult to Scan Content Content is king. Users scan and search for information on the Web. Users rarely read the content line by line. Your visitors know what they want and they are determined to find it. Use appropriate headings, action words, bullets and tables to convey information that is easy for the user to see. Misidentified and Unidentifed Links Make links underlined and/or a different font color than the other text. Avoid underlining words/phrases that aren’t links. It’s frustrating for users when clicking on an underlined word results in no action. Though some Web sites make links a different color only on mouse rollover, this is not the ideal situation because some users are not intuitive enough to know it’s a link without some type of minor differentiation from the outset. Hiding Content from Unregistered Users This is an annoying exper','','1')
			SET @MailoutID = @@Identity
			
			INSERT NewsletterAction(NewsletterActionTypeID,MailoutID,Timestamp,IPAddress,SubscriberID,Email,Details)       VALUES('1',@MailoutID,@todaysDate,'127.0.0.1','1','support@352media.com','')
			INSERT NewsletterAction(NewsletterActionTypeID,MailoutID,Timestamp,IPAddress,SubscriberID,Email,Details)       VALUES('2',@MailoutID,@todaysDate,'127.0.0.1','1','support@352media.com','')
			INSERT NewsletterAction(NewsletterActionTypeID,MailoutID,Timestamp,IPAddress,SubscriberID,Email,Details)       VALUES('4',@MailoutID,@todaysDate,'127.0.0.1','1','support@352media.com','http://www.352media.com')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Open Payment') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OpenPayment'))
		BEGIN
			INSERT OpenPaymentAmount(Amount)       VALUES(convert(money,'5.00'))
			INSERT OpenPaymentAmount(Amount)       VALUES(convert(money,'10.00'))
			INSERT OpenPaymentAmount(Amount)       VALUES(convert(money,'25.00'))
					
			INSERT OpenPayment(FirstName,LastName,Address1,Address2,StateID,StateOther,CountryID,City,Zip,Phone,Email,TransactionGroupID,Amount,AdditionalInfo,DonationNotes)       VALUES('John','Smith','123 Mockingbird Lane','','5','','1','Beverly Hills','90210','(555)867-5309','support@352media.com','E2031B4B-D4DA-432C-88AB-3AE7FA094816',convert(money,'25.00'),'You make great websites!','')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Polls') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Poll'))
		BEGIN
			DECLARE @PollID int
			INSERT Poll(Question,Active,DateCreated,StartDate,EndDate,Voteable,Featured)       VALUES('Here is a sample poll','1','Jun 16 2009 12:33PM',getdate(),DATEADD(d, 1, @todaysDate),'1','0')
			SET @PollID = @@Identity
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Here is sample answer #1','','1','4')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Here is sample answer #2','','2','7')
			
			INSERT Poll(Question,Active,DateCreated,StartDate,EndDate,Voteable,Featured)       VALUES('What do you think is the most useful social media tool?','1','Jun 16 2009 12:35PM',getdate(),DATEADD(d, 1, @todaysDate),'1','1')
			SET @PollID = @@Identity
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Facebook','image792009124405PM63.png','1','11')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Twitter','image792009124419PM63.png','2','14')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'LinkedIn','image792009124445PM63.png','3','1')
			
			INSERT Poll(Question,Active,DateCreated,StartDate,EndDate,Voteable,Featured)       VALUES('What is your favorite feature that 352 Media Group offers? ','1','Jun 16 2009  1:20PM',getdate(),DATEADD(d, 1, @todaysDate),'1','0')
			SET @PollID = @@Identity
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'e-commerce','','1','6')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Blog','','2','10')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Polls','','3','8')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'Dynamic Header','','4','22')
			INSERT PollAnswer(PollID,Answer,Image,DisplayOrder,NumberVotes)       VALUES(@PollID,'News Press','','6','2')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Product Catalog') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Product'))
		BEGIN
			DECLARE @Option1ID int
			DECLARE @OptionBlackID int
			DECLARE @OptionBlueID int
			DECLARE @OptionGreenID int
			DECLARE @OptionGreyID int
			INSERT [Option](Name,DisplayOrder,Active)       VALUES('Color','0','1')
			SET @Option1ID = @@Identity			
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Black','',@Option1ID,convert(money,'0.00'),'1','1')
			SET @OptionBlackID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Blue','',@Option1ID,convert(money,'0.00'),'1','2')
			SET @OptionBlueID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Green','',@Option1ID,convert(money,'0.00'),'1','3')
			SET @OptionGreenID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Gray','',@Option1ID,convert(money,'0.00'),'1','4')
			SET @OptionGreyID = @@Identity
			
			DECLARE @Option2ID int
			INSERT [Option](Name,DisplayOrder,Active)       VALUES('Size','0','1')
			SET @Option2ID = @@Identity
			
			DECLARE @Option3ID int
			DECLARE @OptionLogo1ID int
			DECLARE @OptionLogo2ID int
			DECLARE @OptionLogo3ID int
			INSERT [Option](Name,DisplayOrder,Active)       VALUES('Logo','0','1')
			SET @Option3ID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Logo 1','image610200935712PM63.jpg',@Option3ID,convert(money,'0.00'),'1','1')
			SET @OptionLogo1ID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Logo 2','image610200935746PM63.jpg',@Option3ID,convert(money,'0.00'),'1','2')
			SET @OptionLogo2ID = @@Identity
			INSERT OptionValue(Name,Thumbnail,OptionID,PriceAdjustment,Active,DisplayOrder)       VALUES('Logo 3','image610200935802PM63.jpg',@Option3ID,convert(money,'0.00'),'1','3')
			SET @OptionLogo3ID = @@Identity	
			
			DECLARE @ProductCategoryID int
			DECLARE @ProductID int
			DECLARE @ProductOptionID int
			/*First Category*/
			INSERT ProductCategory(ParentProductCategoryID,Name,Description,Image,Active,DisplayOrder)       VALUES(NULL,'Shirts','Shirts from 352 Media','shirts.jpg','1','0')
			SET @ProductCategoryID = @@Identity
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group T shirts','123','These are 352 Media Group t-shirts. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'19.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option1ID,'1','1','0')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('White',0,'0',NULL,@ProductOptionID,1,'1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Gray',0,'0',@OptionGreyID,@ProductOptionID,2,'1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Green',0,'0',@OptionGreenID,@ProductOptionID,3,'1')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option2ID,'1','1','1')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Small',0,'0',NULL,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Medium',0,'0',NULL,@ProductOptionID,'2','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Large',0,'0',NULL,@ProductOptionID,'3','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('X-Large',0,'0',NULL,@ProductOptionID,'4','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234564842127.jpg','0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234668434551.jpg','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234811088975.jpg','2')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234970774431.jpg','3')
						
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Long Sleeve T Shirts','1234','These are 352 Media Group shirts. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'34.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option1ID,'1','1','0')
			SET @ProductOptionID = @@Identity			
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Blue',0,'0',@OptionBlueID,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Black',0,'0',@OptionBlackID,@ProductOptionID,'2','1')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option2ID,'1','1','1')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Small',0,'0',NULL,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Medium',0,'0',NULL,@ProductOptionID,'2','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Large',0,'0',NULL,@ProductOptionID,'3','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('X-Large',0,'0',NULL,@ProductOptionID,'4','1')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option3ID,'1','1','2')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Logo 1',0,'0',@OptionLogo1ID,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Logo 2',0,'0',@OptionLogo2ID,@ProductOptionID,'2','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Logo 3',0,'0',@OptionLogo3ID,@ProductOptionID,'3','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904236899187247.jpg','0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904236991217319.jpg','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904237267932527.jpg','2')
						
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Dry Fit Shirt','123456','This is a 352 Media Group dry fit shirt. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'24.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option1ID,'1','1','0')
			SET @ProductOptionID = @@Identity			
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Blue',0,'0',@OptionBlueID,@ProductOptionID,1,'1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Black',0,'0',@OptionBlackID,@ProductOptionID,2,'1')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option2ID,'1','1','1')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Small',0,'0',NULL,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Medium',0,'0',NULL,@ProductOptionID,'2','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Large',0,'0',NULL,@ProductOptionID,'3','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('X-Large',0,'0',NULL,@ProductOptionID,'4','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234010630471.jpg','0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904234133597647.jpg','1')
						
			/*Second Category*/	
			INSERT ProductCategory(ParentProductCategoryID,Name,Description,Image,Active,DisplayOrder)       VALUES(NULL,'Accessories ','Hats, water bottles, etc.','accessories.jpg','1','0')
			SET @ProductCategoryID = @@Identity
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Hats','1234567','These are 352 Media Group hats.  This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'19.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option1ID,'1','1','0')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Green',0,'0',@OptionGreenID,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Blue',0,'0',@OptionBlueID,@ProductOptionID,'2','1')			
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Black',0,'0',@OptionBlackID,@ProductOptionID,'3','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904230574736951.jpg','0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904230717703871.jpg','1')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Water Bottles','12345678','These are 352 Media Group water bottles. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'24.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductOption(ProductID,OptionID,Required,Active,DisplayOrder)       VALUES(@ProductID,@Option1ID,'1','1','0')
			SET @ProductOptionID = @@Identity
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Green',0,'0',@OptionGreenID,@ProductOptionID,'1','1')
			INSERT ProductOptionValue(Name,Price,DefaultSelectedOption,OptionValueID,ProductOptionID,DisplayOrder,Active)       VALUES('Blue',0,'0',@OptionBlueID,@ProductOptionID,'2','1')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'50128904182828941855.jpg','0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'51128904182829566847.jpg','1')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Bag','1','This is a 352 Media Group messenger bag. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904179436329031.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Frisbee','','This is a 352 Media Group frisbee. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904180470222047.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Umbrella','','This is a 352 Media Group umbrella. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'29.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904135490641543.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Mouse Pad','','This is a 352 Media Group mouse pad. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904133881755887.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Paper','','This is a pad of 352 Media Group paper. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'19.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'27128904180798030351.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Seat Cushion','','This is a 352 Media group seat cushion. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product. ',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904180964590719.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Ornament','','This is a 352 Media Group ornament. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'48128904180638188647.jpg','0')			
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Cooler','','This is a 352 Media Group cooler. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'12.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'44128904180172100863.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Apron','','This is a 352 Media group apron. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904211266390351.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Freezer Mug','','This is a 352 Media Group freezer mug. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904211748259183.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Bumper Sticker','','This is a 352 Media Group bumper sticker. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'2.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904212136066719.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Golf Ball','','These are 352 Media Group golf balls. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904213035742703.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Golf Towel','','This is a 352 Media Group golf towel. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904213576829527.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Megaphone','','This is a 352 Media Group megaphone. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'5.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904213968855759.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Plastic Cup','','This is 352 Media Group plastic cup. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'4.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904214389944119.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Drawstring Bag','','This is a 352 Media Group drawstring bag. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904214942593295.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Teddy Bear','','This is a 352 Media group teddy bear. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904215572741479.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Tote Bag','','This is a 352 Media Group tote bag. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904216201639679.jpg','0')
			
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Visor','','This is a 352 Media Group visor. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'19.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904216606946991.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Wine Glass','','This is a 352 Media Group wine glass. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product.',convert(money,'14.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904217008191855.jpg','0')
			
			INSERT Product(Name,SKU,Description,Price,Active,Featured,Deleted,CanAddToCart,ReasonToDisableCart)       VALUES('352 Media Group Mug','','This is 352 Media Group coffee mug. This is where you would add more detail about the product you are offering to the user. Users like as much information about products as they can get so be sure to provide a detailed explanation of your product. ',convert(money,'9.99'),'1','0','0','1','')
			SET @ProductID = @@Identity
			INSERT ProductProductCategory(ProductID,ProductCategoryID,Featured)       VALUES(@ProductID,@ProductCategoryID,'0')
			INSERT ProductImage(ProductID,Filename,DisplayOrder)       VALUES(@ProductID,'0128904219253788111.jpg','0')
						
			DECLARE @BaseProductID int
			DECLARE @SuggestedProductID int
			SET @BaseProductID = (SELECT TOP 1 ProductID FROM Product WHERE Name = '352 Media Group Dry Fit Shirt')
			SET @SuggestedProductID = (SELECT TOP 1 ProductID FROM Product WHERE Name = '352 Media Group T shirts')
			INSERT ProductSuggest(ProductID,SuggestProductID,DisplayOrder)       VALUES(@BaseProductID,@SuggestedProductID,'1')
		END
		IF ((@ComponentName IS NULL OR @ComponentName = 'Showcase') AND EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Showcase'))
		BEGIN
			SELECT 1
		END
	END
END
GO
