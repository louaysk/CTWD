source(output(
		Id as string,
		SinkCreatedOn as timestamp,
		SinkModifiedOn as timestamp,
		statecode as long,
		statuscode as long,
		dwtc_category as long,
		dwtc_unitofmeasure as long,
		dwtc_status as long,
		dwtc_orgname as long,
		dwtc_exceptionalapprovalstatus as long,
		dwtc_uom as boolean,
		dwtc_documentuploaded as boolean,
		dwtc_submitpricelistproduct as boolean,
		dwtc_isdiscountapplicable as boolean,
		dwtc_isdiscountproduct as boolean,
		dwtc_event as string,
		dwtc_event_entitytype as string,
		createdonbehalfby as string,
		createdonbehalfby_entitytype as string,
		dwtc_discountproduct as string,
		dwtc_discountproduct_entitytype as string,
		dwtc_product as string,
		dwtc_product_entitytype as string,
		owninguser as string,
		owninguser_entitytype as string,
		dwtc_pricelistid as string,
		dwtc_pricelistid_entitytype as string,
		dwtc_lastyearpricelistproduct as string,
		dwtc_lastyearpricelistproduct_entitytype as string,
		transactioncurrencyid as string,
		transactioncurrencyid_entitytype as string,
		createdby as string,
		createdby_entitytype as string,
		modifiedby as string,
		modifiedby_entitytype as string,
		modifiedonbehalfby as string,
		modifiedonbehalfby_entitytype as string,
		owningteam as string,
		owningteam_entitytype as string,
		owningbusinessunit as string,
		owningbusinessunit_entitytype as string,
		ownerid as string,
		ownerid_entitytype as string,
		dwtc_lastyearrevenue as decimal(38,4),
		dwtc_advanceprice as decimal(38,2),
		dwtc_baseprice_base as decimal(38,2),
		dwtc_lastyearrevenue_base as decimal(38,4),
		dwtc_baseprice as decimal(38,2),
		dwtc_lastyearunitrate as decimal(38,4),
		dwtc_ratebudgeted as decimal(38,2),
		dwtc_totalbudgetrevenue as decimal(38,2),
		dwtc_totalbudgetrevenue_base as decimal(38,2),
		dwtc_ratebudgeted_base as decimal(38,2),
		dwtc_lateprice as decimal(38,2),
		dwtc_lastyearunitrate_base as decimal(38,4),
		dwtc_standardprice_base as decimal(38,2),
		dwtc_lateprice_base as decimal(38,2),
		dwtc_standardprice as decimal(38,2),
		dwtc_advanceprice_base as decimal(38,2),
		dwtc_eventname as string,
		dwtc_pricelistproductid as string,
		versionnumber as long,
		dwtc_productgroupname as string,
		owningbusinessunitname as string,
		dwtc_lastyearpricelistproductname as string,
		dwtc_commentsjustification as string,
		modifiedbyyominame as string,
		createdon as string,
		dwtc_newcustomerqty as decimal(38,2),
		modifiedbyname as string,
		owneridname as string,
		timezoneruleversionnumber as long,
		dwtc_orderproducttotalqty_state as long,
		createdonbehalfbyyominame as string,
		exchangerate as decimal(38,10),
		dwtc_totalbudgetedqty as decimal(38,2),
		dwtc_name as string,
		dwtc_qtynewcust as decimal(38,2),
		overriddencreatedon as timestamp,
		dwtc_qtyretained as decimal(38,2),
		dwtc_discountproductname as string,
		ccs_justification as string,
		dwtc_orderproducttotalqty as decimal(38,2),
		dwtc_internalenddate as timestamp,
		dwtc_productmastercode as string,
		dwtc_pricelistproductcode as string,
		createdonbehalfbyname as string,
		dwtc_qtyincrease as decimal(38,2),
		dwtc_startdate as timestamp,
		utcconversiontimezonecode as long,
		dwtc_perscentagecustomerrate as decimal(38,2),
		dwtc_enddate as timestamp,
		modifiedon as timestamp,
		importsequencenumber as long,
		owneridyominame as string,
		createdbyname as string,
		modifiedonbehalfbyname as string,
		dwtc_percentagerateincrease as decimal(38,2),
		createdbyyominame as string,
		transactioncurrencyidname as string,
		dwtc_productname as string,
		dwtc_lastyearqty as decimal(38,2),
		dwtc_orderproducttotalqty_date as timestamp,
		dwtc_pricelistidname as string,
		dwtc_productgroupid as string,
		dwtc_revisedenddate as timestamp,
		owneridtype as string,
		modifiedonbehalfbyyominame as string,
		dwtc_basepriceinusd as decimal(38,2)
	),
	allowSchemaDrift: true,
	validateSchema: false,
	store: 'synapse',
	databaseType: 'spark',
	format: 'table',
	database: 'dataverse_dubaiworldtr_orgf51d320e',
	tableName: 'dwtc_pricelistproduct') ~> source1
source1 select(mapColumn(
		dwtc_pricelistproductid,
		dwtc_productname,
		dwtc_pricelistidname,
		dwtc_product
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