source(output(
		Research_ID as string,
		ProjectName as string,
		CompanyName as string,
		CompanyType as string,
		IndustryType as string,
		{Sub-IndustryType} as string,
		Prefix as string,
		FirstName as string,
		LastName as string,
		Designation as string,
		Email as string,
		EmailAddress2 as string,
		PhoneNumber as string,
		MobilePhone as string,
		{P.O_Box} as string,
		Address_line_1 as string,
		Address_line_2 as string,
		City as string,
		State as string,
		ZIP_Postal_Code as string,
		Country as string,
		Region as string,
		Website as string,
		Research_Date as date,
		Execution_Date as timestamp,
		Filename as string,
		grid as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'select  *, \n   CONVERT(NVARCHAR(16),hashbytes(\'md5\',concat(upper(replace(Email,\' \',\'\')),COALESCE(soundex(replace(FirstName,\' \',\'\')),\'NA\')\n+COALESCE(soundex(replace(LastName,\' \',\'\')),\'NA\')\n+COALESCE(soundex(replace(CompanyName,\' \',\'\')),\'NA\'))),2) grid\nfrom ods.EM_DATA_RESEARCH',
	format: 'query',
	staged: true) ~> source1
source(output(
		Research_ID as integer,
		Research_Code as string,
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
		Execution_Date as timestamp,
		Event_ID as integer
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> DimProject
source1 derive(Execution_Date = currentUTC()) ~> derivedColumn1
derivedColumn1, DimProject lookup(source1@Research_ID == Research_Code,
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup1
lookup1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		ProjectName as string,
		CompanyName as string,
		CompanyType as string,
		IndustryType as string,
		{Sub-IndustryType} as string,
		Prefix as string,
		FirstName as string,
		LastName as string,
		Designation as string,
		Email as string,
		EmailAddress2 as string,
		PhoneNumber as string,
		MobilePhone as string,
		{P.O_Box} as string,
		Address_line_1 as string,
		Address_line_2 as string,
		City as string,
		State as string,
		ZIP_Postal_Code as string,
		Country as string,
		Region as string,
		Website as string,
		Research_Date as date,
		Execution_Date as timestamp,
		Research_ID as integer,
		GR_ID as string,
		Contact_GR_ID as integer,
		Event_ID as integer,
		Filename as string
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Research_ID = DimProject@Research_ID,
		ProjectName,
		CompanyName,
		CompanyType,
		IndustryType,
		{Sub-IndustryType},
		Prefix,
		FirstName,
		LastName,
		Designation,
		Email,
		EmailAddress2,
		PhoneNumber,
		MobilePhone,
		{P.O_Box},
		Address_line_1,
		Address_line_2,
		City,
		State,
		ZIP_Postal_Code,
		Country,
		Region,
		Website,
		Research_Date,
		Execution_Date,
		GR_ID = grid,
		Event_ID,
		Filename
	)) ~> sink1