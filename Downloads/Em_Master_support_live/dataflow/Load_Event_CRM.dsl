source(output(
		Id as string,
		SinkCreatedOn as timestamp,
		SinkModifiedOn as timestamp,
		statecode as long,
		statuscode as long,
		dwtc_orgname as long,
		ccs_eventtype as long,
		ccs_eventstatus as long,
		ccs_projectadmins as long,
		ccs_projectmanager as long,
		dwtc_seletectappropriateeventbudget as long,
		ccs_approvalstatus as long,
		ccs_marketingteam as long,
		dwtc_class as long,
		dwtc_category as long,
		ccs_director as long,
		ccs_status as long,
		dwtc_bulkrteonfinalinvoice as boolean,
		dwtc_type as boolean,
		dwtc_bulkrte as boolean,
		dwtc_bbudgetfulfill as boolean,
		dwtc_enabledforonlinepayment as boolean,
		dwtc_ordertoproposalflag as boolean,
		dwtc_bulkfulfillorderflag as boolean,
		ccs_enableauditfunctionality as boolean,
		ccs_exportedevent as boolean,
		dwtc_pricelistid as string,
		dwtc_pricelistid_entitytype as string,
		ccs_productskit as string,
		ccs_productskit_entitytype as string,
		dwtc_requestorid as string,
		dwtc_requestorid_entitytype as string,
		ccs_paymentplan as string,
		ccs_paymentplan_entitytype as string,
		ccs_conferenceproducer as string,
		ccs_conferenceproducer_entitytype as string,
		createdby as string,
		createdby_entitytype as string,
		dwtc_budgetedeventdetails as string,
		dwtc_budgetedeventdetails_entitytype as string,
		owningbusinessunit as string,
		owningbusinessunit_entitytype as string,
		ccs_salesteam as string,
		ccs_salesteam_entitytype as string,
		ccs_projectadministrators as string,
		ccs_projectadministrators_entitytype as string,
		dwtc_eventid as string,
		dwtc_eventid_entitytype as string,
		ccs_sponsorshipteam as string,
		ccs_sponsorshipteam_entitytype as string,
		dwtc_nextyearevent as string,
		dwtc_nextyearevent_entitytype as string,
		dwtc_eventsector as string,
		dwtc_eventsector_entitytype as string,
		ccs_show as string,
		ccs_show_entitytype as string,
		owninguser as string,
		owninguser_entitytype as string,
		owningteam as string,
		owningteam_entitytype as string,
		modifiedonbehalfby as string,
		modifiedonbehalfby_entitytype as string,
		modifiedby as string,
		modifiedby_entitytype as string,
		ccs_showdirector as string,
		ccs_showdirector_entitytype as string,
		dwtc_event as string,
		dwtc_event_entitytype as string,
		dwtc_billtoid as string,
		dwtc_billtoid_entitytype as string,
		dwtc_eventgridid as string,
		dwtc_eventgridid_entitytype as string,
		dwtc_showexhid as string,
		dwtc_showexhid_entitytype as string,
		createdonbehalfby as string,
		createdonbehalfby_entitytype as string,
		transactioncurrencyid as string,
		transactioncurrencyid_entitytype as string,
		ccs_marketingteam1 as string,
		ccs_marketingteam1_entitytype as string,
		dwtc_pricelist as string,
		dwtc_pricelist_entitytype as string,
		ccs_account_eventid as string,
		ccs_account_eventid_entitytype as string,
		dwtc_nextyeareventid as string,
		dwtc_nextyeareventid_entitytype as string,
		ccs_closedby as string,
		ccs_closedby_entitytype as string,
		dwtc_lastyearevent as string,
		dwtc_lastyearevent_entitytype as string,
		ccs_salesmanager as string,
		ccs_salesmanager_entitytype as string,
		ownerid as string,
		ownerid_entitytype as string,
		dwtc_totallastyearrevenue as decimal(38,2),
		dwtc_banneradvertising as decimal(38,2),
		dwtc_barterdiscount_base as decimal(38,0),
		dwtc_spaceonlyaed as decimal(38,2),
		dwtc_allinonepackage as decimal(38,2),
		dwtc_discounts_base as decimal(38,0),
		ccs_expecteddelegates as decimal(38,4),
		dwtc_marketingpowerpackrev as decimal(38,2),
		dwtc_allinonepackage_base as decimal(38,2),
		dwtc_boatservicecharges as decimal(38,2),
		dwtc_discounts as decimal(38,0),
		dwtc_shellschemeaed_base as decimal(38,2),
		dwtc_conferencerevexh_base as decimal(38,2),
		dwtc_websiteadvertising_base as decimal(38,2),
		dwtc_registrationrevenue as decimal(38,0),
		dwtc_websiteadvertising as decimal(38,2),
		dwtc_spaceonlyaed_base as decimal(38,2),
		dwtc_variancerevenue as decimal(38,2),
		dwtc_banneradvertising_base as decimal(38,2),
		dwtc_conferencerevexh as decimal(38,2),
		dwtc_internaltransferrevenue_base as decimal(38,4),
		dwtc_totallastyearrevenue_base as decimal(38,2),
		ccs_totalrevenue as decimal(38,4),
		dwtc_sponsorshipaed_base as decimal(38,2),
		dwtc_outdoorspaceonlyaed as decimal(38,2),
		dwtc_corporatedeck_base as decimal(38,2),
		ccs_eventbudget as decimal(38,4),
		dwtc_specialstands as decimal(38,2),
		ccs_totalrevenue_base as decimal(38,4),
		dwtc_corporatedeck as decimal(38,2),
		dwtc_internaltransferrevenue as decimal(38,4),
		dwtc_exhibitorinsurancerev as decimal(38,0),
		dwtc_boatservicecharges_base as decimal(38,2),
		dwtc_shellschemeaed as decimal(38,2),
		dwtc_doubledecker_base as decimal(38,2),
		dwtc_variancerevenue_base as decimal(38,2),
		dwtc_totalrevenue_base as decimal(38,2),
		ccs_targetedrevenue as decimal(38,0),
		dwtc_doubledecker as decimal(38,2),
		ccs_expecteddelegates_base as decimal(38,4),
		dwtc_admissionfee_base as decimal(38,0),
		dwtc_sponsorshipaed as decimal(38,2),
		dwtc_exhibitorinsurancerev_base as decimal(38,0),
		ccs_eventbudget_base as decimal(38,4),
		dwtc_specialstands_base as decimal(38,2),
		ccs_targetedrevenue_base as decimal(38,0),
		dwtc_outdoorspaceonlyaed_base as decimal(38,2),
		dwtc_registrationrevenue_base as decimal(38,0),
		dwtc_marketingpowerpackrev_base as decimal(38,2),
		dwtc_barterdiscount as decimal(38,0),
		dwtc_admissionfee as decimal(38,0),
		dwtc_totalrevenue as decimal(38,2),
		dwtc_budgetedeventdetailsname as string,
		dwtc_upliftunitrate as decimal(38,2),
		traversedpath as string,
		dwtc_attribute3 as string,
		dwtc_earlybirdcutoff as timestamp,
		ccs_eventenddate as timestamp,
		modifiedon as timestamp,
		dwtc_lastyearquantity as decimal(38,2),
		ccs_eventid as string,
		ccs_showdirectoryominame as string,
		dwtc_requestoridyominame as string,
		modifiedbyyominame as string,
		dwtc_lastyearqtysql_state as long,
		dwtc_pricelistidname as string,
		dwtc_advancepricecutoffdays as long,
		dwtc_budgetedquantity_state as long,
		ccs_salesmanagername as string,
		dwtc_startbuilddate as timestamp,
		ccs_conference as string,
		dwtc_totalbudgetspentaed as decimal(38,2),
		dwtc_indate as timestamp,
		dwtc_eventgrididyominame as string,
		dwtc_directexhibitorspacesqm as decimal(38,2),
		ccs_outdoorshell as string,
		ccs_salesmanageryominame as string,
		dwtc_budgetallocated as decimal(38,2),
		dwtc_budgetspent_state as long,
		ccs_productskitname as string,
		ccs_outdoorspace as string,
		dwtc_totallastyearrevenue_date as timestamp,
		ccs_area as string,
		dwtc_nextyeareventidname as string,
		owneridyominame as string,
		dwtc_budgetedquantity as decimal(38,2),
		ccs_account_eventidname as string,
		dwtc_cluster as string,
		dwtc_lastyearquantity_state as long,
		dwtc_loyaltyproductcutoffdays as long,
		ccs_projectadministratorsyominame as string,
		dwtc_eventyear as long,
		exchangerate as decimal(38,10),
		ccs_actualdelegates as long,
		ccs_discount as string,
		ccs_projectadministratorsname as string,
		dwtc_grossspacesqm as decimal(38,2),
		dwtc_budgetspent as decimal(38,2),
		ccs_web as string,
		createdon as string,
		dwtc_groupemailaddress as string,
		dwtc_totallastyearrevenue_state as long,
		modifiedbyname as string,
		ccs_shell as string,
		dwtc_eventgrididname as string,
		ccs_description as string,
		dwtc_conffeaturespacenonmonetizedsqm as decimal(38,2),
		dwtc_attribute2 as string,
		ccs_paymentplanname as string,
		ccs_eventurl as string,
		dwtc_lastyearqtysql as decimal(38,2),
		dwtc_budgetspent_date as timestamp,
		timezoneruleversionnumber as long,
		dwtc_eventidname as string,
		createdbyname as string,
		dwtc_standardpricecutoffdays as long,
		owningbusinessunitname as string,
		dwtc_agentspacesqm as decimal(38,2),
		dwtc_lastyearqtysql_date as timestamp,
		dwtc_eventvippasses as long,
		dwtc_releasedate as timestamp,
		dwtc_sundryincome as long,
		ccs_objective as string,
		dwtc_actualconffeaturesspace as decimal(38,2),
		ccs_targetdelegates as long,
		dwtc_days as long,
		ccs_showname as string,
		createdonbehalfbyname as string,
		ccs_closedbyyominame as string,
		dwtc_actualenddate as timestamp,
		ccs_ebseventid as string,
		owneridtype as string,
		ccs_conferenceproduceryominame as string,
		dwtc_nextyeareventname as string,
		dwtc_pricelistname as string,
		dwtc_outdoorspaceonlysqmtr as decimal(38,2),
		owneridname as string,
		ccs_barterdiscount as string,
		overriddencreatedon as timestamp,
		ccs_eventcode as string,
		dwtc_budgetedquantity_date as timestamp,
		ccs_closedbyname as string,
		transactioncurrencyidname as string,
		dwtc_totalrevenue_date as timestamp,
		dwtc_openordersnotification as long,
		ccs_conferenceproducername as string,
		ccs_banner as string,
		ccs_salesteamyominame as string,
		ccs_showdirectorname as string,
		ccs_name as string,
		processid as string,
		ccs_indoorshell as string,
		dwtc_eventsectorname as string,
		ccs_marketingpowerpack as string,
		dwtc_totalqtysqm as decimal(38,2),
		dwtc_eventpromocodes as long,
		dwtc_stdcutoff as timestamp,
		modifiedonbehalfbyname as string,
		dwtc_varianceqtysqm as decimal(38,2),
		dwtc_totalqtysqm_state as long,
		dwtc_billtoidname as string,
		ccs_sponsorshipteamyominame as string,
		dwtc_shellschemeoutdoor as long,
		dwtc_targetconffeaturesspace as decimal(38,2),
		ccs_eventmoveindate as timestamp,
		dwtc_conffeaturespacemonetizedsqm as decimal(38,2),
		ccs_insurance as string,
		dwtc_eventdays as long,
		ccs_abbreviation as string,
		dwtc_lastyeareventname as string,
		dwtc_varianceqtynonspace as decimal(38,2),
		dwtc_spaceonly as decimal(38,2),
		ccs_space as string,
		modifiedonbehalfbyyominame as string,
		ccs_marketingteam1name as string,
		ccs_marketingteam1yominame as string,
		dwtc_eventname as string,
		ccs_eventstartdate as timestamp,
		dwtc_showexhidname as string,
		dwtc_totalrevenue_state as long,
		importsequencenumber as long,
		stageid as string,
		utcconversiontimezonecode as long,
		ccs_sponsorship as string,
		ccs_sponsorshipteamname as string,
		dwtc_eventbudgetarea as long,
		ccs_eventoutdate as timestamp,
		dwtc_featurearea as decimal(38,2),
		ccs_submitcount as long,
		createdonbehalfbyyominame as string,
		dwtc_eventmajlis as long,
		dwtc_totalqtysqm_date as timestamp,
		ccs_doubledecker as string,
		versionnumber as long,
		ccs_salesteamname as string,
		dwtc_billtoidyominame as string,
		dwtc_upliftqty as decimal(38,2),
		dwtc_lastyearquantity_date as timestamp,
		dwtc_actualstartdate as timestamp,
		dwtc_forfeitedcancellationfees as long,
		createdbyyominame as string,
		dwtc_attribute1 as string,
		dwtc_endbuilddate as timestamp,
		dwtc_shellschemesqmtr as decimal(38,2),
		dwtc_requestoridname as string,
		ccs_account_eventidyominame as string,
		dwtc_mobileappid as long,
		ccs_indoorspaceonly as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	store: 'synapse',
	databaseType: 'spark',
	format: 'table',
	database: 'dataverse_dubaiworldtr_orgf51d320e',
	tableName: 'ccs_event') ~> source1
source1 select(mapColumn(
		DoubleDecker = dwtc_doubledecker,
		EventID = ccs_eventid,
		SpaceOnly = dwtc_spaceonly,
		AiOPackage = dwtc_allinonepackage,
		dwtc_marketingpowerpackrev,
		BoatServiceCharges = dwtc_boatservicecharges,
		EventType = ccs_eventtype,
		WebsiteAdv = dwtc_websiteadvertising,
		Discounts = dwtc_discounts,
		BannerAdv = dwtc_banneradvertising,
		RegistrationRev = dwtc_registrationrevenue,
		ConfRev = dwtc_conferencerevexh,
		AdmissionFee = dwtc_admissionfee,
		EventStatus = ccs_status,
		EventStartDate = dwtc_actualstartdate,
		ShellScheme = dwtc_shellschemeaed,
		SpecialStands = dwtc_specialstands,
		OutdoorSpaceOnly = dwtc_outdoorspaceonlyaed,
		SpaceOnlyAED = dwtc_spaceonlyaed,
		PriceList = dwtc_pricelistname,
		ShellSchemeSqm = dwtc_shellschemesqmtr,
		SponsorshipAED = dwtc_sponsorshipaed,
		CorporateDeck = dwtc_corporatedeck,
		EventIDValue = dwtc_eventid,
		EventEndDate = dwtc_actualenddate,
		OutdoorShellScheme = dwtc_shellschemeoutdoor,
		{BarterDisc.} = dwtc_barterdiscount,
		ExhInsuranceRev = dwtc_exhibitorinsurancerev,
		EventName = ccs_name,
		ShowName = dwtc_showexhidname,
		PaymentPlan = ccs_paymentplanname,
		Category = dwtc_category,
		Class = dwtc_class,
		OrgName = dwtc_orgname,
		EventTeam = ccs_salesteamname,
		EventAdmin = ccs_salesmanagername,
		ShowDirector = ccs_showdirectorname,
		GroupEmailAddress = dwtc_groupemailaddress,
		EBSEventID = ccs_ebseventid,
		{AdvancePriceCut-offDays} = dwtc_advancepricecutoffdays,
		{StandardPriceCut-offDays} = dwtc_standardpricecutoffdays,
		{LoyaltProductCut-offDays} = dwtc_loyaltyproductcutoffdays,
		EnableAuditFunctionality = ccs_enableauditfunctionality,
		BulkfulfillOrderFlag = dwtc_bulkfulfillorderflag,
		EventName = dwtc_eventname,
		Cluster = dwtc_cluster
	),
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> select1
select1 derive(EventStartDate = toDate(left(toString(EventStartDate),10)),
		dwtc_actualenddate = toDate(left(toString(EventEndDate),10))) ~> derivedColumn1
derivedColumn1 sink(allowSchemaDrift: true,
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