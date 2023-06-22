source(output(
		Name as string,
		CountryName as string,
		CountryID as string,
		CompanyID as string,
		SectorName as string,
		IndustryName as string,
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
		dwtc_billingcityname as string,
		dwtc_billingpostcodezipcode as string,
		dwtc_billingcountryname as string,
		dwtc_companyannualrev as long,
		telephone1 as string,
		City as string,
		PrimaryContactID as string,
		BillToContactName as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'SELECT Name, CountryName, Max(CountryID) as CountryID , Max(CompanyID) as CompanyID,max(SectorName) as SectorName,\nMax(IndustryName) as IndustryName,Max(SubIndustryID) as SubIndustryID,Max(POBox) as POBox, max(address1_line1) as address1_line1,\nmax(address2_line2) as address2_line2,max(statecode) as statecode,max(address1_postalcode) as address1_postalcode,\nmax(Region) as Region, max(emailaddress1) as emailaddress1,max(websiteurl) as websiteurl,max(telephone2) as telephone2,\nmax(dwtc_billingcityname) as dwtc_billingcityname,\nmax(dwtc_billingpostcodezipcode) as dwtc_billingpostcodezipcode,max(dwtc_billingcountryname) as dwtc_billingcountryname,\nmax(dwtc_companyannualrev) as dwtc_companyannualrev, max(telephone1) as telephone1,max(city) as City,max(PrimaryContactID) as PrimaryContactID,\nmax(BillToContactName) as BillToContactName\nFROM [ods].[EM_Account_CRM]\nGROUP BY Name, CountryName',
	format: 'query',
	staged: true) ~> source1
source(output(
		CompanyName as string,
		Country as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'Select Distinct CompanyName,Country from [EM_DWH].[DEV_CONTACT_REGISTRATION] where CompanyName !=\'\' and Country!=\'\'\n',
	format: 'query',
	staged: true) ~> source2
source(output(
		C_Company as string,
		C_Country as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'Select Distinct C_Company,C_Country from [ods].[Em_Contact] where  C_Company!=\'\' and C_Country!=\'\'\n',
	format: 'query',
	staged: true) ~> source3
source(output(
		CompanyName as string,
		Country as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	isolationLevel: 'READ_UNCOMMITTED',
	query: 'Select Distinct CompanyName,Country from [EM_DWH].[DEV_DATA_RESEARCH]',
	format: 'query',
	staged: true) ~> source4
source1 select(mapColumn(
		CountryID,
		CountryName,
		SectorName,
		Name,
		IndustryName,
		CompanyID,
		SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City,
		PrimaryContactID,
		BillToContactName
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select1
source2 select(mapColumn(
		CompanyName,
		Country
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select2
filter1, filter2 join(upper(Name) == upper(CompanyName)
	&& upper(CountryName) == upper(Country),
	joinType:'outer',
	matchType:'exact',
	ignoreSpaces: false,
	broadcast: 'auto')~> join1
join1 select(mapColumn(
		CountryID,
		CountryName,
		SectorName,
		Name,
		IndustryName,
		CompanyID,
		SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City,
		PrimaryContactID,
		BillToContactName,
		CompanyName,
		Country
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select3
select1 filter(not(isNull(Name))&&not(isNull(CountryName))) ~> filter1
select2 filter(not(isNull(CompanyName)) && not(isNull(Country))) ~> filter2
select3 derive(Company_Name = iif(not(isNull(Name)), Name, CompanyName),
		Country = iif(not(isNull(CountryName)), CountryName, Country)) ~> derivedColumn2
derivedColumn2 select(mapColumn(
		CountryID,
		SectorName,
		IndustryName,
		CompanyID,
		SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City,
		PrimaryContactID,
		BillToContactName,
		Country,
		Company_Name
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select4
derivedColumn3 alterRow(upsertIf(1==1)) ~> alterRow1
select8 derive(ID = Company_Name+'_'+Country,
		Executiontime = currentUTC()) ~> derivedColumn3
source3 select(mapColumn(
		C_Company,
		C_Country
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select5
select5 filter(not(isNull(C_Company))&&not(isNull(C_Country))) ~> filter3
select4, filter3 join(upper(Company_Name) == upper(C_Company)
	&& upper(Country) == upper(C_Country),
	joinType:'outer',
	matchType:'exact',
	ignoreSpaces: false,
	broadcast: 'auto')~> join2
join2 derive(Company_Name = iif(not(isNull(Company_Name)), Company_Name, C_Company),
		Country = iif(not(isNull(Country)), Country, C_Country),
		dwtc_companyannualrev = toString(dwtc_companyannualrev),
		statecode = toString(statecode)) ~> derivedColumn4
derivedColumn4 select(mapColumn(
		CountryID,
		SectorName,
		IndustryName,
		CompanyID,
		SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City,
		PrimaryContactID,
		BillToContactName,
		Country,
		Company_Name
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select6
source4 select(mapColumn(
		CompanyName,
		CountryR = Country
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select7
select7 filter(not(isNull(CompanyName)) && not(isNull(CountryR))) ~> filter4
select6, filter4 join(upper(Company_Name) == upper(CompanyName)
	&& upper(Country) == upper(CountryR),
	joinType:'outer',
	matchType:'exact',
	ignoreSpaces: false,
	broadcast: 'auto')~> join3
join3 select(mapColumn(
		CountryID,
		SectorName,
		IndustryName,
		CompanyID,
		SubIndustryID,
		POBox,
		address1_line1,
		address2_line2,
		statecode,
		address1_postalcode,
		Region,
		emailaddress1,
		websiteurl,
		telephone2,
		dwtc_billingcityname,
		dwtc_billingpostcodezipcode,
		dwtc_billingcountryname,
		dwtc_companyannualrev,
		telephone1,
		City,
		PrimaryContactID,
		BillToContactName,
		Country,
		Company_Name
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select8
alterRow1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
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
	deletable:false,
	insertable:false,
	updateable:false,
	upsertable:true,
	keys:['ID'],
	format: 'table',
	staged: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		Company_Name,
		Country,
		Accountid_crm = CompanyID,
		Industryname = IndustryName,
		SubIndustryID,
		sectorname = SectorName,
		ID,
		Sub_Industry_Type = SubIndustryID,
		Address_Line_1 = address1_line1,
		Address_Line_2 = address2_line2,
		City,
		State = statecode,
		{ZIP/Postal_Code} = address1_postalcode,
		Region,
		Email = emailaddress1,
		Website = websiteurl,
		Phone_1 = telephone1,
		Phone_2 = telephone2,
		Billing_City = dwtc_billingcityname,
		{Billing_ZIP/Postal_Code} = dwtc_billingpostcodezipcode,
		Billing_Country = dwtc_billingcountryname,
		Company_Annual_Rev = dwtc_companyannualrev,
		PO_Box = POBox,
		Execution_Date = Executiontime
	)) ~> sink1