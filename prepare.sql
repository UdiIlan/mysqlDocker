create schema smartTrader ;
use smartTrader;

create table userOrders (userId						varChar(128),
						 accountName				varChar(128),
						 requestId 					varchar(64),
						 orderTypeId 				integer,
						 size 						float,
                         price	   					float,
                         currencyPair 				varchar (16), 
                         exchangeIds				varChar(32), -- list of exchange id's seperated by ',' 
						 durationMinutes			integer,
						 maxOrderSize				float,
						 eventTimeStamp				timestamp,
						 actionType                 integer);


create table orderNotifications (requestId 					varChar(64),
								 exchangeOrderId			varchar(64),
								 notificationTypeId			integer, 
								 size 				    	float,
								 price	   					float,
								 exchangeIds      			varChar(32),
                                 ask						float,
                                 bid						float,
                                 currencyFrom				float,
                                 currencyTo					float,
								 errorCode					integer	,
								 errorMessage				varchar(512),
								 eventTimeStamp			    timestamp,
								 sendingModule				varchar(32),
								 actionType					varchar(16));


-- indexed tables here to save space 
create table orderTypes (orderTypeId integer, orderType varchar(64));
-- ************************** orderTypes population ************************
create temporary table orderTypesTMP (orderTypeId integer, orderType varchar(64));

insert into orderTypesTMP values 
  (0, 'get User Data'),
  (1, 'buy Immediate Or Cancel'),
  (2, 'sell Immediate Or Cancel'),
  (3, 'login'),
  (4, 'time Buy Taking'),
  (5, 'time Sell Taking'),
  (6, 'timed Buy Making'),
  (7, 'timed Sell Making')
   ;

insert into orderTypes (orderTypeId, orderType)
	select * from orderTypesTMP
where (select count(*) from  orderTypes ) = 0;   

drop table orderTypesTMP;
-- ************************** orderTypes population ************************
-- *************************************************************************


create table notificationTypes (notificationTypeId integer, notificationType varchar(64));

-- ************************** notificationTypes population ************************
create table notificationTypesTMP (notificationTypeId integer, notificationType varchar(64));

insert into notificationTypesTMP values 
  (0, 'Success'),
(1, 'About To Send To Event Queue'),
(2, 'Sent To Event Queue'),
(3, 'Received From Event Queue'),
(4, 'About To Send To Exchange'),
(5, 'Sent To Exchange'),
(6, 'Cancelled'),
(7, 'Update'),
(8, 'Finished'),
(9, 'Error'),
(10,'Received On Server')
   ;

insert into notificationTypes (notificationTypeId, notificationType)
	select * from notificationTypesTMP
where (select count(*) from  notificationTypes ) = 0;   

drop table notificationTypesTMP;
-- ************************** notificationTypes population ************************
-- *************************************************************************



create table exchanges (exchangeId integer, exchangeType varchar(64));

-- ************************** exchanges population ************************
create table exchangesTMP (exchangeId integer, exchangeType varchar(64));

insert into exchangesTMP values
  (0, 'bitstamp') ,
  (1, 'bitfinex' ),
  (2, 'kraken' ); 
  
  insert into exchanges (exchangeId, exchangeType)
	select * from exchangesTMP
where (select count(*) from  exchanges ) = 0; 

drop table exchangesTMP;


-- ************************** actionTypes population ************************

create table actionTypes (actionId integer, actionType varchar(64));
create table actionTypesTMP (actionId integer, actionType varchar(64));
insert into actionTypesTMP values
  (0, 'sell') ,
  (1, 'buy' );
  
  
insert into actionTypes (actionId, actionType)
	select * from actionTypesTMP
where (select count(*) from  actionTypes ) = 0;  

drop table actionTypesTMP;
 
