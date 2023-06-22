source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(C_DateModified) as maximumdate FROM [ods].[Em_Contact]\nwhere instance =\'EL01\'\n\n',
	format: 'query',
	staged: true) ~> source1
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(C_DateModified) as maximumdate FROM [ods].[Em_Contact]\nwhere instance =\'EL06\'',
	format: 'query',
	staged: true) ~> source2
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(C_DateModified) as maximumdate FROM [ods].[Em_Contact]\nwhere instance =\'EL13\'\n\n',
	format: 'query',
	staged: true) ~> source3
source1 derive(Tablename = 'contacts',
		Instance = 'EL01') ~> derivedColumn1
derivedColumn1 alterRow(updateIf(1==1)) ~> alterRow3
source2 derive(Instance = 'EL06',
		Tablename = 'contacts') ~> derivedColumn2
derivedColumn2 alterRow(updateIf(1==1)) ~> alterRow4
source3 derive(Instance = 'EL13',
		Tablename = 'contacts') ~> derivedColumn3
derivedColumn3 alterRow(updateIf(1==1)) ~> alterRow5
alterRow3 cast(output(
		maximumdate as timestamp 'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\''
	),
	errors: true) ~> cast1
alterRow4 cast(output(
		maximumdate as timestamp 'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\''
	),
	errors: true) ~> cast2
alterRow5 cast(output(
		maximumdate as timestamp 'yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\''
	),
	errors: true) ~> cast3
cast1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Tablename as string,
		Username as string,
		Instance as string,
		bodyexpdef as string,
		parsejson_expdef as string,
		parsejson_output_data as string,
		index as string,
		Type as string,
		last_modification_Date as timestamp
	),
	deletable:false,
	insertable:false,
	updateable:true,
	upsertable:false,
	keys:['Instance','Tablename'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename,
		Instance,
		last_modification_Date = maximumdate
	)) ~> sink3
cast2 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Tablename as string,
		Username as string,
		Instance as string,
		bodyexpdef as string,
		parsejson_expdef as string,
		parsejson_output_data as string,
		index as string,
		Type as string,
		last_modification_Date as timestamp
	),
	deletable:false,
	insertable:false,
	updateable:true,
	upsertable:false,
	keys:['Instance','Tablename'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Instance,
		Tablename,
		last_modification_Date = maximumdate
	)) ~> sink4
cast3 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Tablename as string,
		Username as string,
		Instance as string,
		bodyexpdef as string,
		parsejson_expdef as string,
		parsejson_output_data as string,
		index as string,
		Type as string,
		last_modification_Date as timestamp
	),
	deletable:false,
	insertable:false,
	updateable:true,
	upsertable:false,
	keys:['Instance','Tablename'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Instance,
		Tablename,
		last_modification_Date = maximumdate
	)) ~> sink5