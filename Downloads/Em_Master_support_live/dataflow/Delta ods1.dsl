parameters{
	Date_execution as string ("")
}
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as integer,
		CampaignName as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailDeploymentId as integer,
		EmailRecipientId as string,
		ExternalId as string,
		SmtpErrorCode as string,
		SmtpMessage as string,
		Instance as string,
		SmtpStatusCode as integer
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source1
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as integer,
		CampaignName as string,
		CampaignResponseCreatedAt as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailClickedThruLink as string,
		EmailDeploymentId as integer,
		EmailRecipientId as string,
		EmailSendType as string,
		EmailWebLink as string,
		ExternalId as string,
		IpAddress as string,
		MemberStatus as string,
		SubjectLine as string,
		VisitorExternalId as string,
		VisitorId as integer,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source2
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as string,
		CampaignName as string,
		CampaignResponseCreatedAt as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailRecipientId as string,
		EmailSendType as string,
		EmailWebLink as string,
		ExternalId as string,
		IpAddress as string,
		MemberStatus as string,
		SubjectLine as string,
		VisitorExternalId as string,
		VisitorId as integer,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source3
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as integer,
		CampaignName as string,
		CampaignResponseCreatedAt as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailRecipientId as string,
		EmailSendType as string,
		EmailWebLink as string,
		ExternalId as string,
		MemberStatus as string,
		SubjectLine as string,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source4
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as string,
		CampaignName as string,
		CampaignResponseCreatedAt as string,
		ContactId as integer,
		CreatedAt as string,
		ExternalId as string,
		FormSubmitSavedId as integer,
		MemberStatus as string,
		RawData as string,
		VisitorExternalId as string,
		VisitorId as integer,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source5
source(output(
		ActivityId as integer,
		ActivityType as string,
		CRMCampaignId as string,
		CampaignId as boolean,
		CampaignName as string,
		CampaignResponseCreatedAt as string,
		ContactId as integer,
		CreatedAt as string,
		ExternalId as string,
		IpAddress as string,
		IsWebTrackingOptedIn as string,
		LinkedToContactDate as string,
		MemberStatus as string,
		PageViewSavedId as integer,
		ReferrerUrl as string,
		Url as string,
		VisitorExternalId as string,
		VisitorId as integer,
		WebVisitId as integer,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source6
source(output(
		ActivityType as string,
		AssetId as string,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as string,
		CampaignName as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailRecipientId as string,
		ExternalId as string,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source7
source(output(
		ActivityId as integer,
		ActivityType as string,
		AssetId as integer,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as integer,
		CampaignName as string,
		ContactId as integer,
		CreatedAt as string,
		EmailAddress as string,
		EmailRecipientId as string,
		ExternalId as string,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source8
source(output(
		ActivityId as integer,
		ActivityType as string,
		ContactId as integer,
		CreatedAt as string,
		Duration as string,
		ExternalId as string,
		FirstPageViewUrl as string,
		IpAddress as string,
		LinkedToContactDate as string,
		NumberOfPages as integer,
		ReferrerUrl as string,
		VisitorExternalId as string,
		VisitorId as integer,
		WebVisitSavedId as integer,
		Instance as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false,
	documentForm: 'documentPerLine') ~> source9
source1 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn1
source2 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn2
source3 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn3
source4 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn4
source5 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn5
source6 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn6
source7 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn7
source8 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn8
source9 derive(each(match(1==1), $$ = toString($$))) ~> derivedColumn9
derivedColumn1, derivedColumn2, derivedColumn3, derivedColumn4, derivedColumn5, derivedColumn6, derivedColumn7, derivedColumn8, derivedColumn9 union(byName: true)~> union1
union1 derive(Date_Execution = $Date_execution) ~> derivedColumn10
derivedColumn10 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		ActivityId as string,
		ActivityType as string,
		AssetId as string,
		AssetName as string,
		AssetType as string,
		CRMCampaignId as string,
		CampaignId as string,
		CampaignName as string,
		ContactId as string,
		CreatedAt as string,
		EmailAddress as string,
		EmailDeploymentId as string,
		EmailRecipientId as string,
		ExternalId as string,
		SmtpErrorCode as string,
		SmtpMessage as string,
		SmtpStatusCode as string,
		Instance as string,
		CampaignResponseCreatedAt as string,
		EmailClickedThruLink as string,
		EmailSendType as string,
		EmailWebLink as string,
		IpAddress as string,
		MemberStatus as string,
		SubjectLine as string,
		VisitorExternalId as string,
		VisitorId as string,
		FormSubmitSavedId as string,
		RawData as string,
		IsWebTrackingOptedIn as string,
		LinkedToContactDate as string,
		PageViewSavedId as string,
		ReferrerUrl as string,
		Url as string,
		WebVisitId as string,
		Duration as string,
		FirstPageViewUrl as string,
		NumberOfPages as string,
		WebVisitSavedId as string,
		Date_Execution as string
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	format: 'table',
	staged: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		ActivityId,
		ActivityType,
		AssetId,
		AssetName,
		AssetType,
		CRMCampaignId,
		CampaignId,
		CampaignName,
		ContactId,
		CreatedAt,
		EmailAddress,
		EmailDeploymentId,
		EmailRecipientId,
		ExternalId,
		SmtpErrorCode,
		SmtpMessage,
		SmtpStatusCode,
		Instance,
		CampaignResponseCreatedAt,
		EmailClickedThruLink,
		EmailSendType,
		EmailWebLink,
		IpAddress,
		MemberStatus,
		SubjectLine,
		VisitorExternalId,
		VisitorId,
		FormSubmitSavedId,
		RawData,
		IsWebTrackingOptedIn,
		LinkedToContactDate,
		PageViewSavedId,
		ReferrerUrl,
		Url,
		WebVisitId,
		Duration,
		FirstPageViewUrl,
		NumberOfPages,
		WebVisitSavedId,
		Date_Execution
	)) ~> sink1