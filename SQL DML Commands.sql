use billing_db;

create table item_info(
item_id int,
item_name varchar(20),
price double,
serial_number bigint,
item_delavey boolean,
item_location varchar(20),
item_exp date
);

desc item_info;

insert into item_info values(1,'bag',200,9876543234,22,'Bangalore','2025-01-22');
insert into item_info values(2,'pant',300,12376543234,22,'Bangalore','2025-01-23');
insert into item_info values(3,'shoe',400,3476543234,22,'Bangalore','2025-01-24');
insert into item_info values(4,'belt',500,56476543234,22,'Bangalore','2025-01-25');
insert into item_info values(5,'book',600,8876543234,22,'Bangalore','2025-01-26');
insert into item_info values(6,'pen',700,7676543234,22,'Bangalore','2025-01-27');

insert into item_info(item_id,item_name,price,item_location)values(7,'shirt',800,'Mysore');
insert into item_info(item_id,item_name,price,item_location)values(8,'shirt',900,'Mysore'),(9,'watch',1200,'Bangalore');


update item_info set item_delavey=33 where item_id=6;
update item_info set item_delavey=44,price=150 where item_id=3;

delete from item_info where item_id=7;

select * from item_info;
