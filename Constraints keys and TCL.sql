create database app_store_db;
use app_store_db;
create table app_info(
app_id char(4) primary key,
app_name varchar(20) unique,
downloads bigint check(downloads>100),
size double check(size>15),
reviews varchar(50) not null,
ratings float check(ratings>0),
company varchar(20) not null
);

desc app_info;

insert into app_info values( 'a111','Swiggy',9876543212,30.5,'its good app for food',8.9,'p_tap');
insert into app_info values( 'a222','zomato',8896543212,20.5,'its best app for food',9.9,'p_tap');
insert into app_info values('a333','watsapp',88895,15.5,'good',8.5,'p_tack');
insert into app_info values( 'a444','facbook',543212,48.5,'its good app ',8.9,'p_tap');
insert into app_info values( 'a555','instagram',33543212,78.5,'its bad app ',8.9,'C_tap');
insert into app_info values( 'a666','word',67543212,100.5,'its good app ',8.9,'microsoft');
insert into app_info values( 'a777','googal',54864973212,438.5,'its good app ',8.9,'googal');
insert into app_info values( 'a999','chatgpt',543212,48.5,'its good app ',7.9,'c_tap');
insert into app_info values( 'ap10','pubg',543212,48.5,'its good app ',7.9,'p_tap');
insert into app_info values ( 'ap11','freefire',543212,48.5,'its good app ',7.9,'p_tap');
 insert into app_info values( 'ap12','car',543212,48.5,'its good app ',7.9,'p_tap');
insert into app_info values  ( 'ap13','bike',543212,48.5,'its good app ',7.9,'p_tap');
 insert into app_info values ( 'ap14','bus',543212,48.5,'its good app ',7.9,'p_tap');
 insert into app_info values ( 'ap15','doctoreDrive',543212,48.5,'its good app ',7.9,'p_tap');
 insert into app_info values ( 'ap16','archer',543212,48.5,'its good app ',7.9,'p_tap');
  insert into app_info values( 'ap17','hiclimb',543212,48.5,'its good app ',7.9,'p_tap');
  insert into app_info values( 'ap18','candycrush',543212,48.5,'its good app ',7.9,'p_tap');
  insert into app_info values( 'ap19','racing',543212,48.5,'its good app ',7.9,'p_tap');
   insert into app_info values( 'ap20','fruitsCut',543212,48.5,'its good app ',7.9,'p_tap');

select * from app_info;

create table user_info(
user_id char(4) primary key,
user_name varchar(25) not null unique,
gender varchar(6) check (gender in ('male','female','others')),
app_id char(4), foreign key(app_id) references app_info(app_id)
);

desc user_info;

insert into user_info values('u101','Prasad','male','a111');
insert into user_info values('u102','Daya','male','a222');
insert into user_info values('u103','Ashish','male','a333');
insert into user_info values('u104','Mandara','female','a444');

select * from user_info;

set autocommit=0;
insert into user_info values('u105','Ravi','male','a111');
update user_info set gender='female' where user_id='u105';

delete from user_info where user_id='u101';

rollback;

commit;




