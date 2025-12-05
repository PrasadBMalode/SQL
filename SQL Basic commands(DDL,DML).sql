create database cart;
create database orders;
create database media_store;
create database notifications;
create database billing_db;
create database records_db;

use cart;
create table Product_info(
product_id int,
product_name varchar(20),
price double,
quantity int,
serial_no bigint,
mfd date,
availability boolean
);
desc Product_info;

use billing_db;
create table billing_info(
item_id int,
item_name varchar(20),
price double,
serial_number bigint,
item_delavey boolean,
item_location varchar(20),
item_exp date
);
desc billing_info; 

rename table billing_info to billings;
drop table billings;

rename table Product_info to products;
drop table products;

use Product_info;

alter table billing_info add user_name varchar(20);
alter table billing_info drop user_name;

alter table billing_info rename column price to cost;
alter table billing_info modify column cost int; 

insert into billing_info values(109,'pen',50.00,8769875647,2,'Bangalore','2025-04-17'),
(110,'pen',50.00,8769875647,2,'Bangalore','2025-04-17');
insert into billing_info(item_id,item_name,cost,item_location)
values(102,'book',200.00,'Hubballi');
insert into billing_info(item_id,item_name,cost,item_location)
values(104,'book',100.00,'Hubballi'),
      (103,'bag',500.00,'Mysore'),
      (105,'shoe',679.00,'Mysore'),
      (106,'shirt',230.00,'Mysore'),
      (107,'pant',700.00,'Mysore'),
      (108,'belt',689.00,'Mysore');
update billing_info set serial_number=555555555 where item_id=103;
update billing_info set serial_number=66666666,item_exp='2025-06-21' where item_id=107;
use cart;
      
      


select * from billing_info;










