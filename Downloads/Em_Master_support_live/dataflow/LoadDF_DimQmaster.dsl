source(output(
		QID as string,
		UAID as string,
		Display_Question as string,
		Question as string,
		ALID as string,
		Answers_List as string,
		Question_Type as string,
		Question_ValueTypeNew as string,
		TypeNew as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> ODSQMaster
derivedColumn1 alterRow(upsertIf(1==1)) ~> alterRow1
ODSQMaster derive(Execution_Date = currentUTC()) ~> derivedColumn1
alterRow1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Question_ID as integer,
		QID as string,
		UAID as string,
		Display_Question as string,
		Question as string,
		ALID as string,
		Answers_List as string,
		Question_Type as string,
		Question_ValueTypeNew as string,
		TypeNew as string
	),
	deletable:false,
	insertable:false,
	updateable:false,
	upsertable:true,
	keys:['QID'],
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError') ~> sink1