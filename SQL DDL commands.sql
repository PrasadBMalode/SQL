create database billing_db;
create database media_store_db;
create database orders_db;
create database cart_db;

use cart_db;
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

rename table Product_info to products_info;

alter table products_info add product_discount int;
alter table products_info drop serial_no;
alter table products_info rename column price to cost;
alter table products_info modify column availability boolean;
alter table products_info modify column cost int;

drop table products_info;
drop database cart_db;

desc products_info;
