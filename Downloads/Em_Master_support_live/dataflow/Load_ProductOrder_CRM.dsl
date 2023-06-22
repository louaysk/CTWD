source(output(
		Id as string,
		SinkCreatedOn as timestamp,
		SinkModifiedOn as timestamp,
		statecode as long,
		statuscode as long,
		dwtc_orgname as long,
		dwtc_vatrefundapplicable as boolean,
		dwtc_isbarterorderproduct as boolean,
		dwtc_isgenericorderproduct as boolean,
		createdonbehalfby as string,
		createdonbehalfby_entitytype as string,
		dwtc_orderpricelistproduct as string,
		dwtc_orderpricelistproduct_entitytype as string,
		dwtc_orderoffer as string,
		dwtc_orderoffer_entitytype as string,
		modifiedonbehalfby as string,
		modifiedonbehalfby_entitytype as string,
		owningteam as string,
		owningteam_entitytype as string,
		dwtc_product as string,
		dwtc_product_entitytype as string,
		dwtc_orderid as string,
		dwtc_orderid_entitytype as string,
		transactioncurrencyid as string,
		transactioncurrencyid_entitytype as string,
		createdby as string,
		createdby_entitytype as string,
		modifiedby as string,
		modifiedby_entitytype as string,
		owninguser as string,
		owninguser_entitytype as string,
		owningbusinessunit as string,
		owningbusinessunit_entitytype as string,
		ownerid as string,
		ownerid_entitytype as string,
		dwtc_baseprice_base as decimal(38,2),
		dwtc_orderproducttotalamount_base as decimal(38,2),
		dwtc_baseprice as decimal(38,2),
		dwtc_extendedamount as decimal(38,2),
		dwtc_discountamount_base as decimal(38,2),
		dwtc_discountamount as decimal(38,2),
		dwtc_orderproducttotalamount as decimal(38,2),
		dwtc_extendedamount_base as decimal(38,2),
		dwtc_orderpricelistproductname as string,
		versionnumber as long,
		modifiedonbehalfbyyominame as string,
		owningbusinessunitname as string,
		dwtc_orderdiscountpercent as decimal(38,2),
		modifiedbyyominame as string,
		createdon as string,
		owneridtype as string,
		dwtc_orderoffername as string,
		modifiedbyname as string,
		owneridname as string,
		dwtc_orderidname as string,
		overriddencreatedon as timestamp,
		dwtc_deferralglcode as string,
		dwtc_orderum as string,
		createdonbehalfbyyominame as string,
		exchangerate as decimal(38,10),
		dwtc_name as string,
		dwtc_orderquantity as decimal(38,2),
		timezoneruleversionnumber as long,
		dwtc_orderproductid as string,
		createdonbehalfbyname as string,
		utcconversiontimezonecode as long,
		dwtc_quantitycopy as decimal(38,2),
		modifiedon as timestamp,
		importsequencenumber as long,
		owneridyominame as string,
		createdbyname as string,
		modifiedonbehalfbyname as string,
		createdbyyominame as string,
		transactioncurrencyidname as string,
		dwtc_productname as string,
		dwtc_glcode as string,
		dwtc_orderlineno as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	store: 'synapse',
	databaseType: 'spark',
	format: 'table',
	database: 'dataverse_dubaiworldtr_orgf51d320e',
	tableName: 'dwtc_orderproduct') ~> source1
source1 select(mapColumn(
		dwtc_orderquantity,
		dwtc_orderlineno,
		statuscode,
		dwtc_orderproducttotalamount,
		statecode,
		dwtc_discountamount,
		dwtc_baseprice,
		dwtc_orderid,
		dwtc_orderpricelistproduct,
		GL_Code_Desc = dwtc_deferralglcode,
		dwtc_glcode
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