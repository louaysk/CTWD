source(output(
		FormName as string,
		Instance as string,
		Count as string,
		{Event Name} as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: true) ~> source1
source(output(
		Event_ID as integer,
		EventID as string,
		EventName as string,
		ShowName as string,
		ShowName2 as string,
		TypeID as long,
		EventStatus as long,
		EventStartDate as date,
		ShellScheme as decimal(38,2),
		SpecialStands as decimal(38,2),
		OutdoorSpaceOnly as decimal(38,2),
		SpaceOnlyAED as decimal(38,2),
		ShellSchemeSqm as decimal(38,2),
		SponsorshipAED as decimal(38,2),
		CorporateDeck as decimal(38,2),
		EventIDValue as string,
		ClusterName as string,
		Execution_Date as timestamp,
		PriceList as string,
		Category as string,
		Class as string,
		EventType as string,
		OrgName as string,
		EventTeam as string,
		EventAdmin as string,
		ShowDirector as string,
		Groupemailaddress as string,
		EBSEventID as string,
		Advance_pricecut_off_days as string,
		Standard_price_cut_off_days as string,
		Loyalty_product_cut_off_days as string,
		Enable_audit_functionality as string,
		Bulk_fulfill_order_flag as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> source2
source(output(
		assetid as string,
		assetname as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select assetid, assetname from  [EM_DWH].[FACT_ACTIVITY] where activitytype=\'formsubmit\'\n',
	format: 'query',
	staged: true) ~> source3
source1, source2 lookup(upper({Event Name}) == upper(EventName),
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup1
source2 select(mapColumn(
		Event_ID,
		EventID,
		EventName,
		ShowName,
		ShowName2
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select1
source3 select(mapColumn(
		assetid,
		assetname
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select2
lookup1 select(mapColumn(
		FormName,
		{Event Name},
		Event_ID
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select3
select3, select2 lookup(upper(FormName) == upper(assetname),
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup2
lookup2 select(mapColumn(
		FormName,
		{Event Name},
		Event_ID,
		assetid
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select4
select4 alterRow(upsertIf(1==1)) ~> alterRow1
alterRow1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Form_ID as integer,
		FormName as string,
		EventName as string,
		Event_ID as integer,
		Asset_ID as string
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:true,
	keys:['Asset_ID'],
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		FormName,
		EventName = {Event Name},
		Event_ID,
		Asset_ID = assetid
	)) ~> sink1