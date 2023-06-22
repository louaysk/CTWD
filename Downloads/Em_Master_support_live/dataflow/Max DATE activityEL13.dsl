source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'Bounceback\'',
	format: 'query',
	staged: true) ~> source1
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'EmailClickthrough\'',
	format: 'query',
	staged: true) ~> source2
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'EmailOpen\'',
	format: 'query',
	staged: true) ~> source3
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'EmailSend\'',
	format: 'query',
	staged: true) ~> source4
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'FormSubmit\'',
	format: 'query',
	staged: true) ~> source5
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'PageView\'',
	format: 'query',
	staged: true) ~> source6
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'Subscribe\'',
	format: 'query',
	staged: true) ~> source7
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'Unsubscribe\'',
	format: 'query',
	staged: true) ~> source8
source(output(
		maximumdate as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select MAX(CreatedAt) as maximumdate   FROM [ods].[Em_Activity]\nwhere Instance =\'EL13\' and ActivityType=\'WebVisit\'',
	format: 'query',
	staged: true) ~> source9
source1 derive(tablename = 'activities',
		Instance = 'EL13',
		Type = 'Bounceback',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn1
source2 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'EmailClickthrough',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn2
source3 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'EmailOpen',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn3
source4 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'EmailSend',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn4
source5 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'FormSubmit',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn5
source6 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'PageView',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn6
source7 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'Subscribe',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn7
source8 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'Unsubscribe',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn8
source9 derive(Instance = 'EL13',
		tablename = 'activities',
		Type = 'WebVisit',
		maximumdate = toTimestamp(maximumdate, 'yyyy-MM-dd HH:mm:ss.SSS')) ~> derivedColumn9
derivedColumn1 alterRow(updateIf(1==1)) ~> alterRow1
derivedColumn2 alterRow(updateIf(1==1)) ~> alterRow2
derivedColumn3 alterRow(updateIf(1==1)) ~> alterRow3
derivedColumn4 alterRow(updateIf(1==1)) ~> alterRow4
derivedColumn5 alterRow(updateIf(1==1)) ~> alterRow5
derivedColumn6 alterRow(updateIf(1==1)) ~> alterRow6
derivedColumn7 alterRow(updateIf(1==1)) ~> alterRow7
derivedColumn8 alterRow(updateIf(1==1)) ~> alterRow8
derivedColumn9 alterRow(updateIf(1==1)) ~> alterRow9
alterRow1 sink(allowSchemaDrift: true,
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
	keys:['Tablename','Instance','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink1
alterRow2 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink2
alterRow3 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink3
alterRow4 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink4
alterRow5 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink5
alterRow6 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink6
alterRow7 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink7
alterRow8 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink8
alterRow9 sink(allowSchemaDrift: true,
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
	keys:['Instance','Tablename','Type'],
	skipKeyWrites:true,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Tablename = tablename,
		Instance,
		Type,
		last_modification_Date = maximumdate
	)) ~> sink9