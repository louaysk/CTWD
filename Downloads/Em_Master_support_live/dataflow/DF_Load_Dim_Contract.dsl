source(output(
		ContractID as string,
		ProposalName as string,
		{Amount-Contract} as decimal(38,2),
		OpportunityID as string,
		CreatedOn as string,
		StatusCode as long,
		NetSqm as decimal(38,2),
		ProposalID as string,
		EventName as string,
		StandNumber as string,
		TypeOfContract as long,
		Hallname as string,
		OrderID as string,
		EventID as string,
		dwtc_exhibitorpoint as long,
		dwtc_eventsector as string,
		dwtc_paymentplankit as string,
		ownerid as string,
		value as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: ' select c.*, d.[value] \n  FROM [ods].[EM_Contracts_CRM] c left join (select * from \n  [ods].[EM_StringMap_CRM]  a \n  where  a.[attributename] = \'statuscode\' and  a.[objecttypecode] =\'contract\') d\n  on c.StatusCode=d.[attributevalue] ',
	format: 'query',
	staged: true) ~> OdsContract
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
		Execution_Date as timestamp
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> DimEvent
source(output(
		Opportunity_ID as integer,
		Event_ID as integer,
		Customer_ID as integer,
		Lead_ID as integer,
		OpportunityNumber as string,
		OpportunityId as string,
		StageCode as string,
		RequesterID as string,
		AgentID as string,
		DiscountAmount as decimal(38,2),
		RequestorType as string,
		TotalAmountofOpportunity as decimal(38,2),
		TradeAssocID as string,
		Status as long,
		{CreatedOn-Opportunity} as string,
		NetSQMofOpportunity as decimal(38,2),
		{RetainedY/N} as string,
		OnwerID as string,
		ProbabilityCode as long,
		OpportunityClosingDate as timestamp,
		Execution_Date as timestamp
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> DimOpportunity
source(output(
		Proposal_ID as integer,
		QuoteID as string,
		Opportunity_ID as integer,
		{Amount-Quote} as decimal(38,2),
		Netsqm as decimal(38,2),
		StatusCode as long,
		CreatedOn as timestamp,
		QuoteState as string,
		Execution_Date as timestamp,
		Typeofcontract as string,
		Paymentplan as string,
		RevisionID as string,
		Name as string,
		Potentialcustomer as string,
		Eventname as string,
		Owner as string,
		EventSector as string,
		DiscountLevel as string,
		ReasonforDiscountRequest as string,
		AmendmentType as string,
		Justification as string,
		Description as string,
		TotalAEDDiscount as decimal(38,2),
		TotalDiscount as decimal(38,2),
		IsLatestDiscountApproved as string,
		ExpiredProductApproved as string,
		LatestBarterApproved as string,
		LatestOAFApproved as string,
		DiscountApprovalMemoStatus as string,
		ExpiredProductMemoStatus as string,
		BarterMemoStatus as string,
		OAFApprovalStatus as string,
		Barter as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> DimProposal
OdsContract, DimEvent lookup(OdsContract@EventID == DimEvent@EventID,
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup1
lookup1, DimOpportunity lookup(OdsContract@OpportunityID == DimOpportunity@OpportunityId,
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup2
lookup3 derive(Execution_Date = currentUTC(),
		CreatedOn = toTimestamp(split(replace(OdsContract@CreatedOn,'T',' '), '.')[1]),
		dwtc_exhibitorpoint = toString(dwtc_exhibitorpoint)) ~> derivedColumn1
derivedColumn1 alterRow(upsertIf(1==1)) ~> alterRow1
lookup2, DimProposal lookup(ProposalID == QuoteID,
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup3
alterRow1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Contract_ID as integer,
		ContractID as string,
		Event_ID as integer,
		Opportunity_ID as integer,
		Amount_Contract as decimal(38,2),
		CreatedOn as timestamp,
		NetSqm as decimal(38,2),
		TypeOfContract as long,
		OrderID as string,
		HallName as string,
		StandNumber as string,
		StatusCode as string,
		Execution_Date as timestamp,
		Exhibitorpoints as string,
		Eventsector as string,
		Paymentplan as string,
		Owner as string,
		Proposal_ID as integer
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:true,
	keys:['ContractID'],
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		ContractID,
		Event_ID = DimEvent@Event_ID,
		Opportunity_ID = DimOpportunity@Opportunity_ID,
		Amount_Contract = {Amount-Contract},
		CreatedOn,
		NetSqm,
		TypeOfContract,
		OrderID,
		HallName = Hallname,
		StandNumber,
		StatusCode = value,
		Execution_Date,
		Exhibitorpoints = dwtc_exhibitorpoint,
		Eventsector = dwtc_eventsector,
		Paymentplan = dwtc_paymentplankit,
		Owner,
		Proposal_ID
	)) ~> sink1