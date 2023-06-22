source(output(
		Id as string,
		SinkCreatedOn as timestamp,
		SinkModifiedOn as timestamp,
		statecode as long,
		statuscode as long,
		dwtc_orgname as long,
		owninguser as string,
		owninguser_entitytype as string,
		owningteam as string,
		owningteam_entitytype as string,
		createdonbehalfby as string,
		createdonbehalfby_entitytype as string,
		modifiedby as string,
		modifiedby_entitytype as string,
		createdby as string,
		createdby_entitytype as string,
		owningbusinessunit as string,
		owningbusinessunit_entitytype as string,
		modifiedonbehalfby as string,
		modifiedonbehalfby_entitytype as string,
		ownerid as string,
		ownerid_entitytype as string,
		createdonbehalfbyyominame as string,
		dwtc_deferralglcode as string,
		owneridname as string,
		dwtc_glcode as string,
		dwtc_name as string,
		importsequencenumber as long,
		dwtc_productgroupid as string,
		utcconversiontimezonecode as long,
		createdbyyominame as string,
		modifiedbyname as string,
		versionnumber as long,
		dwtc_departmentcode as string,
		modifiedbyyominame as string,
		timezoneruleversionnumber as long,
		owneridtype as string,
		dwtc_groupid as string,
		owneridyominame as string,
		modifiedon as timestamp,
		modifiedonbehalfbyyominame as string,
		createdbyname as string,
		createdon as string,
		owningbusinessunitname as string,
		createdonbehalfbyname as string,
		modifiedonbehalfbyname as string,
		overriddencreatedon as timestamp
	),
	allowSchemaDrift: true,
	validateSchema: false,
	store: 'synapse',
	databaseType: 'spark',
	format: 'table',
	database: 'dataverse_dubaiworldtr_orgf51d320e',
	tableName: 'dwtc_productgroup') ~> source1
source1 select(mapColumn(
		GlCode = dwtc_glcode,
		GroupeID = dwtc_groupid,
		PGID = dwtc_productgroupid,
		PGName = dwtc_name,
		statecode,
		statuscode
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select1
select1 sink(allowSchemaDrift: true,
	validateSchema: false,
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	truncate:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError') ~> sink1