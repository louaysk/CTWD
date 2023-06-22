parameters{
	Item as string ("")
}
source(output(
		body as (count as short, hasMore as boolean, items as (ActivityId as short, ActivityType as string, AssetId as string, AssetName as string, AssetType as string, CRMCampaignId as string, CampaignId as string, CampaignName as string, ContactId as integer, CreatedAt as string, EmailAddress as string, EmailRecipientId as string, ExternalId as string)[], limit as short, offset as boolean, totalResults as integer),
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
		ContactId = body.items.ContactId,
		CreatedAt = body.items.CreatedAt,
		EmailAddress = body.items.EmailAddress,
		EmailRecipientId = body.items.EmailRecipientId,
		ExternalId = body.items.ExternalId
	),
	skipDuplicateMapInputs: false,
	skipDuplicateMapOutputs: false) ~> flatten1
flatten1 derive(Instance = toString('EL01')) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
	validateSchema: false,
	partitionFileNames:[(concat('Activity_Subscribe_P', $Item,'.json'))],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1),
	preCommands: [],
	postCommands: []) ~> sink1