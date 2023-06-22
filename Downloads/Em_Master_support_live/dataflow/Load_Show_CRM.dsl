source(output(
		Id as string,
		SinkCreatedOn as timestamp,
		SinkModifiedOn as timestamp,
		statecode as long,
		statuscode as long,
		dwtc_orgname as long,
		modifiedonbehalfby as string,
		modifiedonbehalfby_entitytype as string,
		owningteam as string,
		owningteam_entitytype as string,
		owninguser as string,
		owninguser_entitytype as string,
		createdonbehalfby as string,
		createdonbehalfby_entitytype as string,
		owningbusinessunit as string,
		owningbusinessunit_entitytype as string,
		modifiedby as string,
		modifiedby_entitytype as string,
		createdby as string,
		createdby_entitytype as string,
		dwtc_clusterid as string,
		dwtc_clusterid_entitytype as string,
		ownerid as string,
		ownerid_entitytype as string,
		createdonbehalfbyyominame as string,
		dwtc_address as string,
		dwtc_emailid as string,
		owneridname as string,
		dwtc_name as string,
		dwtc_clusteridname as string,
		dwtc_showeventid as string,
		importsequencenumber as long,
		utcconversiontimezonecode as long,
		createdbyyominame as string,
		modifiedbyname as string,
		versionnumber as long,
		modifiedbyyominame as string,
		timezoneruleversionnumber as long,
		owneridtype as string,
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
	tableName: 'dwtc_showevent') ~> source1
source1 select(mapColumn(
		ShowName = dwtc_name,
		ShowID = dwtc_showeventid,
		CreatedOn = createdon,
		ClusterID = dwtc_clusterid,
		ClusterName = dwtc_clusteridname
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