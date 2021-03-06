USE [Meybohm_com]
GO
/****** Object:  StoredProcedure [dbo].[CUSTOM_Newsletter_MailingList_GetMailingListSubscribersWithEmailsByListOfMailingListIDs]    Script Date: 09/12/2013 08:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CUSTOM_Newsletter_MailingList_GetMailingListSubscribersWithEmailsByListOfMailingListIDs]
	@MailingListIDs varchar(2000),
	@ExistingMailoutId int = NULL
AS
BEGIN

	DECLARE @TempMailingListIDs TABLE
	(
		TempMailingListID int
	)

--Call the Split function from Site Template and insert all IDs of mailing lists into the temp table
	INSERT INTO @TempMailingListIDs (TempMailingListID)
	SELECT [Value] FROM UTILfn_Split(@MailingListIDs,',')

	IF (@ExistingMailoutId IS NULL)
	BEGIN
		SELECT DISTINCT Subscriber.SubscriberID, Subscriber.Email, Subscriber.DefaultNewsletterFormatID, (select top 1 EntityID from MailingListSubscriber mls where mls.subscriberid=subscriber.subscriberid) as 'EntityID'
		FROM Subscriber
			INNER JOIN MailingListSubscriber ON MailingListSubscriber.SubscriberID = Subscriber.SubscriberID
			INNER JOIN MailingList ON MailingListSubscriber.MailingListID = MailingList.MailingListID
		WHERE MailingListSubscriber.[Active] = 'true'
			AND Subscriber.[Deleted]='0'	
			AND MailingListSubscriber.MailingListID IN (SELECT * FROM @TempMailingListIDs t)
			AND MailingList.Deleted = '0'
	END
	ELSE
	BEGIN
		DECLARE @ActionTypeSendID int
		SET @ActionTypeSendID = (SELECT TOP 1 NewsletterActionTypeID FROM NewsletterActionType WHERE [Type] = 'Send')
		SELECT DISTINCT Subscriber.SubscriberID, Subscriber.Email, Subscriber.DefaultNewsletterFormatID, (select top 1 EntityID from MailingListSubscriber mls where mls.subscriberid=subscriber.subscriberid) as 'EntityID'
		FROM Subscriber
			INNER JOIN MailingListSubscriber ON MailingListSubscriber.SubscriberID = Subscriber.SubscriberID
			INNER JOIN MailingList ON MailingListSubscriber.MailingListID = MailingList.MailingListID
			LEFT JOIN NewsletterAction ON Subscriber.SubscriberID = NewsletterAction.SubscriberID AND NewsletterAction.[NewsletterActionTypeID] = @ActionTypeSendID AND NewsletterAction.MailoutID = @ExistingMailoutId
		WHERE MailingListSubscriber.[Active] = 'true'
			AND Subscriber.[Deleted]='0'	
			AND MailingListSubscriber.MailingListID IN (SELECT * FROM @TempMailingListIDs t)
			AND NewsletterAction.NewsletterActionID IS NULL
			AND MailingList.Deleted = '0'
	END
END
GO
