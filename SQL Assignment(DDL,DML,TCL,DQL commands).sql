create database orders_db;
use orders_db;

create table orders_info(
orderid char(4) primary key,
orderName varchar(20) not null unique,
orderFrom varchar(20),
availability boolean,
gender varchar(6) check (gender in ('male','female','others')),
orderApp varchar(15),
totalItems int,
orderDate date
);

desc orders_info;

insert into orders_info values('or01','bag','delhi',1,'male','amezon',22,'2025-03-12');
insert into orders_info values('or02','pant','bangalore',1,'female','flipcart',55,'2025-04-16');
insert into orders_info values('or03','shirt','mysore',1,'male','meshow',33,'2025-01-17');
insert into orders_info values('or04','cap','haveri',1,'female','mintra',77,'2025-01-12');
insert into orders_info values('or05','ring','hubballi',1,'male','amezon',66,'2025-05-18');
insert into orders_info values('or06','chain','dharwad',1,'female','amezon',99,'2025-08-13');
insert into orders_info values('or07','jug','panjab',1,'male','flipcart',34,'2025-06-12');
insert into orders_info values('or08','watch','hariyana',1,'female','amezon',21,'2025-09-19');
insert into orders_info values('or09','battary','gujrat',1,'male','amezon',54,'2025-01-20');
insert into orders_info values('or10','books','bombay',1,'female','mintra',73,'2025-03-22');

select * from orders_info;

update orders_info set totalItems=88 where orderid='or01';
update orders_info set orderFrom='mangalore' where orderid='or02';
update orders_info set availability=0 where orderid='or10';
update orders_info set gender='male' where orderid='or08';

delete from orders_info where orderid='or02';
delete from orders_info where orderid='or05';
delete from orders_info where orderid='or07';

-----------------------------------------------------------------------------------------
create table customer_info (
    customerId char(4) primary key,
    customerName varchar(20) not null unique,
    customerCity varchar(20),
    isActive boolean,
    gender varchar(6) check (gender in ('male','female','others')),
    preferredApp varchar(15),
    totalPurchases int,
    joinDate date,
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc customer_info;


insert into customer_info values ('cu01','Rohan','Delhi',1,'male','Amazon',12,'2025-03-12','or01');
insert into customer_info values ('cu02','Sneha','Bangalore',1,'female','Flipkart',5,'2025-04-16','or03');
insert into customer_info values ('cu03','Amit','Mysore',1,'male','Meesho',8,'2025-01-17','or04');
insert into customer_info values ('cu04','Priya','Haveri',1,'female','Myntra',3,'2025-01-12','or06');
insert into customer_info values ('cu05','Karan','Hubballi',1,'male','Amazon',6,'2025-05-18','or08');
insert into customer_info values ('cu06','Divya','Dharwad',1,'female','Amazon',9,'2025-08-13','or09');
insert into customer_info values ('cu07','Harish','Punjab',1,'male','Flipkart',7,'2025-06-12','or10');
insert into customer_info values ('cu08','Anita','Haryana',1,'female','Amazon',11,'2025-09-19','or01');
insert into customer_info values ('cu09','Sanjay','Gujarat',1,'male','Amazon',4,'2025-01-20','or03');
insert into customer_info values ('cu10','Meera','Mumbai',1,'female','Myntra',10,'2025-03-22','or04');

select * from customer_info;

update customer_info set totalPurchases = 20 where customerId = 'cu01';
update customer_info set customerCity = 'Mangalore' where customerId = 'cu02';
update customer_info set isActive = 0 where customerId = 'cu10';
update customer_info set gender = 'male' where customerId = 'cu08';


delete from customer_info where customerId = 'cu02';
delete from customer_info where customerId = 'cu05';
delete from customer_info where customerId = 'cu07';

select * from customer_info;

-----------------------------------------------------------------------------------------
create table item_info (
    itemid char(4) primary key,
    itemname varchar(30) not null unique,
    itemcategory varchar(20),
    instock boolean,
    supplier varchar(20),
    price int,
    addeddate date,
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc item_info;

insert into item_info values ('it01','Laptop','Electronics',1,'Dell',55000,'2025-03-12','or01');
insert into item_info values ('it02','Smartphone','Electronics',1,'Samsung',25000,'2025-04-16','or03');
insert into item_info values ('it03','WashingMachine','HomeAppliance',1,'LG',18000,'2025-01-17','or04');
insert into item_info values ('it04','Shoes','Fashion',1,'Nike',3000,'2025-01-12','or06');
insert into item_info values ('it05','Backpack','Accessories',1,'Wildcraft',1500,'2025-05-18','or08');
insert into item_info values ('it06','Television','Electronics',1,'Sony',42000,'2025-08-13','or09');
insert into item_info values ('it07','Headphones','Electronics',1,'Boat',1200,'2025-06-12','or10');
insert into item_info values ('it08','Mixer','Kitchen',1,'Philips',2500,'2025-09-19','or01');
insert into item_info values ('it09','Tablet','Electronics',1,'Apple',60000,'2025-01-20','or03');
insert into item_info values ('it10','Watch','Fashion',1,'Fossil',8000,'2025-03-22','or04');


select * from item_info;

update item_info set price = 60000 where itemid = 'it01';
update item_info set itemcategory = 'Smartwatch' where itemid = 'it10';
update item_info set instock = 0 where itemid = 'it05';
update item_info set supplier = 'Boat' where itemid = 'it08';

delete from item_info where itemid = 'it02';
delete from item_info where itemid = 'it07';
delete from item_info where itemid = 'it09';


-----------------------------------------------------------------------------------------
create table product_info (
    productid char(4) primary key,
    productname varchar(30) not null unique,
    productcategory varchar(20),
    instock boolean,
    brand varchar(20),
    price int,
    releasedate date,
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);
desc product_info;

insert into product_info values ('pr01','Refrigerator','HomeAppliance',1,'LG',32000,'2025-02-10','or01');
insert into product_info values ('pr02','BluetoothSpeaker','Electronics',1,'JBL',4500,'2025-03-14','or03');
insert into product_info values ('pr03','ElectricKettle','Kitchen',1,'Prestige',1200,'2025-01-18','or04');
insert into product_info values ('pr04','AirFryer','Kitchen',1,'Philips',8000,'2025-01-20','or06');
insert into product_info values ('pr05','GamingConsole','Electronics',1,'Sony',42000,'2025-05-22','or08');
insert into product_info values ('pr06','SmartWatch','Fashion',1,'Samsung',15000,'2025-08-10','or09');
insert into product_info values ('pr07','Camera','Electronics',1,'Canon',52000,'2025-06-11','or10');
insert into product_info values ('pr08','VacuumCleaner','HomeAppliance',1,'Eureka',7000,'2025-09-15','or01');
insert into product_info values ('pr09','InductionStove','Kitchen',1,'Butterfly',3000,'2025-02-05','or03');
insert into product_info values ('pr10','Printer','Electronics',1,'HP',9000,'2025-03-25','or04');

select * from product_info;

update product_info set price = 35000 where productid = 'pr01';
update product_info set productcategory = 'SmartDevice' where productid = 'pr06';
update product_info set instock = 0 where productid = 'pr05';
update product_info set brand = 'EurekaForbes' where productid = 'pr08';

delete from product_info where productid = 'pr02';
delete from product_info where productid = 'pr07';
delete from product_info where productid = 'pr09';

-----------------------------------------------------------------------------------------
create table user_info (
    userid char(4) primary key,
    username varchar(25) not null unique,
    userCity varchar(20),
    isActive boolean,
    email varchar(40),
    signupDate date,
    lastLogin date,
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc user_info;

insert into user_info values ('us01','Rahul123','Bangalore',1,'rahul123@gmail.com','2025-02-01','2025-11-30','or01');
insert into user_info values ('us02','AishaK','Mumbai',1,'aishak@gmail.com','2025-03-15','2025-12-05','or03');
insert into user_info values ('us03','Varun_P','Pune',1,'varunp@gmail.com','2025-01-20','2025-12-02','or04');
insert into user_info values ('us04','SnehaM','Delhi',1,'sneham@gmail.com','2025-04-10','2025-12-06','or01');
insert into user_info values ('us05','NehaR','Chennai',1,'nehar@gmail.com','2025-05-22','2025-12-01','or06');
insert into user_info values ('us06','Deepak90','Hyderabad',1,'deepak90@gmail.com','2025-06-18','2025-12-04','or04');
insert into user_info values ('us07','Mitali','Kolkata',1,'mitali@gmail.com','2025-07-12','2025-11-29','or08');
insert into user_info values ('us08','Ravi_S','Jaipur',1,'ravi_s@gmail.com','2025-08-25','2025-12-03','or09');
insert into user_info values ('us09','PoojaD','Ahmedabad',1,'poojad@gmail.com','2025-09-05','2025-11-28','or10');
insert into user_info values ('us10','KiranV','Bengaluru',1,'kiranv@gmail.com','2025-10-01','2025-12-07','or01');

select * from user_info;

update user_info set email = 'rahul.new@gmail.com' where userid = 'us01';
update user_info set userCity = 'Mysore' where userid = 'us02';
update user_info set isActive = 0 where userid = 'us10';
update user_info set lastLogin = '2025-12-08' where userid = 'us05';

delete from user_info where userid = 'us03';
delete from user_info where userid = 'us07';
delete from user_info where userid = 'us09';

select * from user_info;

set autocommit=0;
insert into user_info values ('us11','Ranveer','Bengaluru',3,'Ranveer@gmail.com','2025-10-01','2025-12-07','or01');
update user_info set userCity = 'Bangalore' where userid = 'us02';
delete from user_info where userid = 'us06';
rollback;
commit;

-----------------------------------------------------------------------------------------------
create table delivery_info (
    deliveryid char(4) primary key,
    customername varchar(30),
    deliverycity varchar(25),
    courier varchar(20),
    deliverydate date,
    status varchar(15),
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc delivery_info;

insert into delivery_info values ('de01','Rohan','Delhi','BlueDart','2025-03-15','Delivered','or01');
insert into delivery_info values ('de02','Sneha','Mangalore','DTDC','2025-04-20','In-Transit','or03');
insert into delivery_info values ('de03','Amit','Mysore','EcomExpress','2025-01-19','Delivered','or04');
insert into delivery_info values ('de04','Priya','Haveri','Delhivery','2025-01-14','Shipped','or06');
insert into delivery_info values ('de05','Karan','Hubballi','BlueDart','2025-05-21','Delivered','or08');
insert into delivery_info values ('de06','Divya','Dharwad','FedEx','2025-08-15','Pending','or09');
insert into delivery_info values ('de07','Harish','Punjab','DTDC','2025-06-14','Delivered','or10');
insert into delivery_info values ('de08','Anita','Haryana','Delhivery','2025-09-22','In-Transit','or01');
insert into delivery_info values ('de09','Sanjay','Gujarat','EcomExpress','2025-01-23','Delivered','or03');
insert into delivery_info values ('de10','Meera','Mumbai','BlueDart','2025-03-25','Shipped','or04');

select * from delivery_info;

update delivery_info set status = 'Returned' where deliveryid = 'de01';
update delivery_info set deliverycity = 'Udupi' where deliveryid = 'de02';
update delivery_info set courier = 'BlueDart' where deliveryid = 'de08';
update delivery_info set status = 'Delivered' where deliveryid = 'de06';

delete from delivery_info where deliveryid = 'de02';
delete from delivery_info where deliveryid = 'de05';
delete from delivery_info where deliveryid = 'de07';

set autocommit=0;
insert into delivery_info values ('de11','Ravi','Haveri','BlueDart','2025-03-25','Shipped','or04');
update delivery_info set status = 'Seliverd' where deliveryid = 'de01';
delete from delivery_info where deliveryid = 'de01';
rollback;
commit;

select * from delivery_info;

-----------------------------------------------------------------------------------------
create table payment_info (
    paymentid char(4) primary key,
    customername varchar(30),
    paymentmethod varchar(20),
    amount int,
    paymentdate date,
    status varchar(15),
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc payment_info;

insert into payment_info values ('pa01','Rohan','CreditCard',2500,'2025-03-12','Success','or01');
insert into payment_info values ('pa02','Sneha','UPI',1500,'2025-04-16','Success','or03');
insert into payment_info values ('pa03','Amit','NetBanking',1800,'2025-01-17','Failed','or04');
insert into payment_info values ('pa04','Priya','DebitCard',900,'2025-01-12','Success','or06');
insert into payment_info values ('pa05','Karan','CreditCard',3200,'2025-05-18','Success','or08');
insert into payment_info values ('pa06','Divya','UPI',2200,'2025-08-13','Success','or09');
insert into payment_info values ('pa07','Harish','Wallet',1400,'2025-06-12','Refunded','or10');
insert into payment_info values ('pa08','Anita','UPI',2700,'2025-09-19','Success','or01');
insert into payment_info values ('pa09','Sanjay','NetBanking',1100,'2025-01-20','Failed','or03');
insert into payment_info values ('pa10','Meera','DebitCard',2600,'2025-03-22','Success','or04');

select * from payment_info;

update payment_info set status = 'Refunded' where paymentid = 'pa03';
update payment_info set paymentmethod = 'CreditCard' where paymentid = 'pa10';
update payment_info set amount = 3000 where paymentid = 'pa05';
update payment_info set status = 'Success' where paymentid = 'pa09';

delete from payment_info where paymentid = 'pa02';
delete from payment_info where paymentid = 'pa07';
delete from payment_info where paymentid = 'pa09';

set autocommit=0;
insert into payment_info values ('pa11','Abhi','DebitCard',2600,'2025-03-22','Success','or04');
update payment_info set status = 'Success' where paymentid = 'pa03';
rollback;
commit;

select * from payment_info;

-----------------------------------------------------------------------------------------
create table review_info (
    reviewid char(4) primary key,
    customername varchar(30),
    productname varchar(30),
    rating int,
    reviewdate date,
    comments varchar(100),
    orderid char(4),
    foreign key(orderid) references orders_info(orderid)
);

desc review_info;

insert into review_info values ('re01','Rohan','Refrigerator',5,'2025-03-16','Excellent product','or01');
insert into review_info values ('re02','Sneha','Smartphone',4,'2025-04-18','Good quality but expensive','or03');
insert into review_info values ('re03','Amit','ElectricKettle',3,'2025-01-19','Works fine','or04');
insert into review_info values ('re04','Priya','AirFryer',5,'2025-01-15','Very useful product','or06');
insert into review_info values ('re05','Karan','GamingConsole',4,'2025-05-20','Enjoying it','or08');
insert into review_info values ('re06','Divya','SmartWatch',5,'2025-08-14','Loved the features','or09');
insert into review_info values ('re07','Harish','Camera',2,'2025-06-13','Not worth the price','or10');
insert into review_info values ('re08','Anita','VacuumCleaner',4,'2025-09-20','Good suction power','or01');
insert into review_info values ('re09','Sanjay','InductionStove',3,'2025-01-22','Average performance','or03');
insert into review_info values ('re10','Meera','Printer',5,'2025-03-24','Print quality is excellent','or04');

select * from review_info;

update review_info set rating = 1 where reviewid = 're07';
update review_info set comments = 'Value for money' where reviewid = 're03';
update review_info set productname = 'SmartSpeaker' where reviewid = 're02';
update review_info set rating = 5 where reviewid = 're09';

delete from review_info where reviewid = 're02';
delete from review_info where reviewid = 're07';
delete from review_info where reviewid = 're09';

set autocommit=0;
insert into review_info values ('re11','janu','cctv',5,'2025-03-24','cctv quality is excellent','or04');
update review_info set  customername= 'priya' where reviewid = 're08';
delete from review_info where reviewid='re03';
rollback;
commit;
select * from review_info;


















