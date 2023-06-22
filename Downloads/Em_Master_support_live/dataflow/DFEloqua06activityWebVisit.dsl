parameters{
	Item as string ("")
}
source(output(
		body as (count as short, hasMore as boolean, items as (ActivityId as integer, ActivityType as string, ContactId as integer, CreatedAt as string, Duration as string, ExternalId as string, FirstPageViewUrl as string, IpAddress as string, LinkedToContactDate as string, NumberOfPages as short, ReferrerUrl as string, VisitorExternalId as string, VisitorId as integer, WebVisitSavedId as integer)[], limit as short, offset as boolean, totalResults as integer),
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
		ContactId = body.items.ContactId,
		CreatedAt = body.items.CreatedAt,
		Duration = body.items.Duration,
		ExternalId = body.items.ExternalId,
		FirstPageViewUrl = body.items.FirstPageViewUrl,
		IpAddress = body.items.IpAddress,
		LinkedToContactDate = body.items.LinkedToContactDate,
		NumberOfPages = body.items.NumberOfPages,
		ReferrerUrl = body.items.ReferrerUrl,
		VisitorExternalId = body.items.VisitorExternalId,
		VisitorId = body.items.VisitorId,
		WebVisitSavedId = body.items.WebVisitSavedId
	),
	skipDuplicateMapInputs: false,
	skipDuplicateMapOutputs: false) ~> flatten1
flatten1 derive(Instance = toString('EL06')) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
	validateSchema: false,
	partitionFileNames:[(concat('Activity_WebVisit_P', $Item,'.json'))],
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	partitionBy('hash', 1),
	preCommands: [],
	postCommands: []) ~> sink1