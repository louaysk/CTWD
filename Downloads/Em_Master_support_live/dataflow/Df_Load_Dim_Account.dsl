source(output(
		CountryID as string,
		CountryName as string,
		SectorName as string,
		Name as string,
		IndustryName as string,
		CompanyID as string,
		SubIndustryID as string,
		POBox as string,
		address1_line1 as string,
		address2_line2 as string,
		statecode as long,
		address1_postalcode as string,
		Region as string,
		emailaddress1 as string,
		websiteurl as string,
		telephone2 as string,
		dwtc_billingtosameasaddress1 as boolean,
		dwtc_billingcityname as string,
		dwtc_billingpostcodezipcode as string,
		dwtc_billingcountryname as string,
		dwtc_companyannualrev as long,
		telephone1 as string,
		City as string,
		PrimaryContactID as string,
		BillToContactName as string,
		Company_ID as integer
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> OdsAccount
source(output(
		Company_ID as integer,
		Company_Name as string,
		Country as string,
		Accountid_crm as string,
		Industryname as string,
		SubIndustryID as string,
		sectorname as string,
		ID as string,
		Company_Type as string,
		Industry_Type as string,
		Sub_Industry_Type as string,
		Address_Line_1 as string,
		Address_Line_2 as string,
		City as string,
		State as string,
		{ZIP/Postal_Code} as string,
		Region as string,
		Email as string,
		Website as string,
		Phone_1 as string,
		Phone_2 as string,
		Billing_Address_Line_1 as string,
		Billing_Address_Line_2 as string,
		Billing_City as string,
		Billing_State as string,
		{Billing_ZIP/Postal_Code} as string,
		Billing_Country as string,
		Company_Annual_Rev as string,
		Billing_PO_Box as string,
		PO_Box as string,
		Execution_Date as timestamp
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	format: 'table',
	staged: true) ~> DimCompany
OdsAccount, DimCompany lookup(upper(CountryName) == upper(Country)
	&& upper(Name) == upper(Company_Name),
	multiple: false,
	pickup: 'any',
	broadcast: 'auto')~> lookup1
lookup1 derive(Execution_Date = currentUTC()) ~> derivedColumn1
derivedColumn1 alterRow(upsertIf(1==1)) ~> alterRow1
alterRow1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		Account_ID as integer,
		CountryID as string,
		CountryName as string,
		SectorName as string,
		Name as string,
		IndustryName as string,
		CompanyID as string,
		SubIndustryID as string,
		POBox as string,
		address1_line1 as string,
		address2_line2 as string,
		statecode as long,
		address1_postalcode as string,
		Region as string,
		emailaddress1 as string,
		websiteurl as string,
		telephone2 as string,
		dwtc_billingtosameasaddress1 as boolean,
		dwtc_billingcityname as string,
		dwtc_billingpostcodezipcode as string,
		dwtc_billingcountryname as string,
		dwtc_companyannualrev as long,
		telephone1 as string,
		City as string,
		PrimaryContactID as string,
		BillToContactName as string,
		Company_ID as integer,
		Execution_Date as timestamp
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:true,
	keys:['CompanyID'],
	format: 'table',
	staged: true,
	allowCopyCommand: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		CountryID,
		CountryName,
		SectorName = OdsAccount@SectorName,
		Name,
		IndustryName = OdsAccount@IndustryName,
		CompanyID,
		SubIndustryID = OdsAccount@SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region = OdsAccount@Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingtosameasaddress1,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City = OdsAccount@City,
		PrimaryContactID,
		BillToContactName,
		Company_ID = DimCompany@Company_ID,
		Execution_Date
	)) ~> sink1