source(output(
		Research_ID as string,
		Cluster as string,
		Show as string,
		Edition as short,
		Event as string,
		{Project Name} as string,
		{Target Audience} as string,
		{Research Type} as string,
		{Data Source} as string,
		{Requested By} as string,
		{Project Type} as string,
		{Requested Date} as date,
		Status as string,
		{Completion Date} as date,
		{Estimated Records} as string,
		{Total Records Received} as integer,
		{Research Conducted By} as string,
		{PR Number} as string,
		{PO Number} as string,
		{Invoice Number} as string,
		{Quoted Amount} as double,
		{Invoiced Amount} as double,
		VAT as double,
		{Total Invoiced Amount} as double,
		Currency as string,
		{Payment Status} as string,
		Comments as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: true,
	wildcardPaths:['Landing Zone/Data Research/Project/*.xlsx']) ~> source1
source1 derive(Date_Execution = currentUTC()) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Research_ID as string,
		Cluster as string,
		Show as string,
		Edition as string,
		Project_Name as string,
		Target_Audience as string,
		Research_Type as string,
		Data_Source as string,
		Requested_By as string,
		Project_Type as string,
		Requested_Date as date,
		Status as string,
		Completion_Date as date,
		Estimated_Records as string,
		Total_Records_Received as decimal(38,2),
		Research_Conducted_By as string,
		PR_Number as string,
		PO_Number as string,
		Invoice_Number as string,
		Quoted_Amount as decimal(38,2),
		Invoiced_Amount as decimal(38,2),
		VAT as decimal(38,2),
		Total_Invoiced_Amount as decimal(38,2),
		Currency as string,
		Payment_Status as string,
		Comments as string,
		Execution_Date as timestamp
	),
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
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Research_ID,
		Cluster,
		Show,
		Edition,
		Project_Name = {Project Name},
		Target_Audience = {Target Audience},
		Research_Type = {Research Type},
		Data_Source = {Data Source},
		Requested_By = {Requested By},
		Project_Type = {Project Type},
		Requested_Date = {Requested Date},
		Status,
		Completion_Date = {Completion Date},
		Estimated_Records = {Estimated Records},
		Total_Records_Received = {Total Records Received},
		Research_Conducted_By = {Research Conducted By},
		PR_Number = {PR Number},
		PO_Number = {PO Number},
		Invoice_Number = {Invoice Number},
		Quoted_Amount = {Quoted Amount},
		Invoiced_Amount = {Invoiced Amount},
		VAT,
		Total_Invoiced_Amount = {Total Invoiced Amount},
		Currency,
		Payment_Status = {Payment Status},
		Comments,
		Execution_Date = Date_Execution
	)) ~> sink1