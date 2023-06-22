parameters{
	Item as string ("")
}
source(output(
		body as (count as short, hasMore as boolean, items as (ActivityId as integer, ActivityType as string, CRMCampaignId as string, CampaignId as boolean, CampaignName as string, CampaignResponseCreatedAt as string, ContactId as integer, CreatedAt as string, ExternalId as string, IpAddress as string, IsWebTrackingOptedIn as string, LinkedToContactDate as string, MemberStatus as string, PageViewSavedId as integer, ReferrerUrl as string, Url as string, VisitorExternalId as string, VisitorId as integer, WebVisitId as integer)[], limit as short, offset as boolean, totalResults as integer),
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
		CRMCampaignId = body.items.CRMCampaignId,
		CampaignId = body.items.CampaignId,
		CampaignName = body.items.CampaignName,
		CampaignResponseCreatedAt = body.items.CampaignResponseCreatedAt,
		ContactId = body.items.ContactId,
		CreatedAt = body.items.CreatedAt,
		ExternalId = body.items.ExternalId,
		IpAddress = body.items.IpAddress,
		IsWebTrackingOptedIn = body.items.IsWebTrackingOptedIn,
		LinkedToContactDate = body.items.LinkedToContactDate,
		MemberStatus = body.items.MemberStatus,
		PageViewSavedId = body.items.PageViewSavedId,
		ReferrerUrl = body.items.ReferrerUrl,
		Url = body.items.Url,
		VisitorExternalId = body.items.VisitorExternalId,
		VisitorId = body.items.VisitorId,
		WebVisitId = body.items.WebVisitId
	),
	skipDuplicateMapInputs: false,
	skipDuplicateMapOutputs: false) ~> flatten1
flatten1 derive(Instance = toString('EL13')) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
	validateSchema: false,
	partitionFileNames:[(concat('Activity_PageView_P', $Item,'.json'))],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1),
	preCommands: [],
	postCommands: []) ~> sink1