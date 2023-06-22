parameters{
	Item as string ("")
}
source(output(
		body as (count as short, hasMore as boolean, items as (ActivityId as integer, ActivityType as string, AssetId as short, AssetName as string, AssetType as string, CRMCampaignId as string, CampaignId as string, CampaignName as string, CampaignResponseCreatedAt as string, ContactId as integer, CreatedAt as string, EmailAddress as string, EmailDeploymentId as short, EmailRecipientId as string, EmailSendType as string, EmailWebLink as string, ExternalId as string, IpAddress as string, MemberStatus as string, SubjectLine as string, VisitorExternalId as string, VisitorId as integer)[], limit as short, offset as boolean, totalResults as integer),
		headers as [string,string]
	),
	allowSchemaDrift: true,
	validateSchema: false,
	httpMethod: 'GET',
	timeout: 30,
	requestInterval: 0,
	paginationRules: ['supportRFC5988' -> 'true'],
	responseFormat: ['type' -> 'json', 'documentForm' -> 'singleDocument']) ~> source1
source1 foldDown(unroll(body.items),
	mapColumn(
		ActivityId = body.items.ActivityId,
		ActivityType = body.items.ActivityType,
		AssetId = body.items.AssetId,
		AssetName = body.items.AssetName,
		AssetType = body.items.AssetType,
		CRMCampaignId = body.items.CRMCampaignId,
		CampaignId = body.items.CampaignId,
		CampaignName = body.items.CampaignName,
		CampaignResponseCreatedAt = body.items.CampaignResponseCreatedAt,
		ContactId = body.items.ContactId,
		CreatedAt = body.items.CreatedAt,
		EmailAddress = body.items.EmailAddress,
		EmailDeploymentId = body.items.EmailDeploymentId,
		EmailRecipientId = body.items.EmailRecipientId,
		EmailSendType = body.items.EmailSendType,
		EmailWebLink = body.items.EmailWebLink,
		ExternalId = body.items.ExternalId,
		IpAddress = body.items.IpAddress,
		MemberStatus = body.items.MemberStatus,
		SubjectLine = body.items.SubjectLine,
		VisitorExternalId = body.items.VisitorExternalId,
		VisitorId = body.items.VisitorId
	),
	skipDuplicateMapInputs: false,
	skipDuplicateMapOutputs: false) ~> flatten1
flatten1 derive(Instance = toString('EL01')) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
	validateSchema: false,
	partitionFileNames:[(concat('Activity_EmailOpen_P', $Item,'.json'))],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1),
	preCommands: [],
	postCommands: []) ~> sink1