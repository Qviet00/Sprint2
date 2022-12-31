drop database if exists frankincense_store;
create database frankincense_store;
use frankincense_store;

create table `role`(
id int primary key auto_increment,
`name` varchar(30),
status_lock int default 0
);
create table `user`(
id int primary key auto_increment,
username varchar(255),
`password` varchar(255),
status_lock int default 0
);
create table user_role (
id int primary key auto_increment,
user_id int,
role_id int,
foreign key (user_id) references `user`(id),
foreign key (role_id) references `role`(id)
);

create table customer_type(
id int primary key auto_increment,
`name` varchar(255)
 );
 
 create table customer(
 id int primary key auto_increment,
 `name` varchar(250),
 day_of_birth varchar(30),
 gender boolean,
 id_cad varchar(12),
 address varchar(200),
 email varchar(45),
 image varchar(200),
 phone_number varchar(10),
 user_id int,
 customer_type_id int,
 foreign key (user_id) references `user`(id),
 foreign key (customer_type_id) references customer_type(id)
 );
 
 create table `history`(
 id int primary key auto_increment,
 `name` varchar(100),
 frankincense_booking_time datetime,
 status boolean,
 quantity int,
 price int,
 customer_id int,
 foreign key (customer_id) references customer(id)
 );
 
 create table frankincense_type(
 id int primary key auto_increment,
 `name` varchar(250)
 );
 
 create table promotion(
 id int primary key auto_increment,
 `name` varchar(250),
 image text,
 start_time varchar(50),
 end_time varchar(50),
 detail text,
 discount int
 );
 
  create table employee(
 id int primary key auto_increment,
 `name` varchar(250),
 day_of_birth varchar(30),
 gender boolean,
 id_cad varchar(12),
 address varchar(200),
 email varchar(45),
 image varchar(200),
 phone_number varchar(10),
 username_id int,
 foreign key (username_id) references `user`(id)
 );
 
 create table frankincense(
 id int primary key auto_increment,
 `name` varchar(250),
 color varchar(50),
 `function` varchar(250),
 price double,
 origin varchar(250),
 `status` boolean,
 promotion_id int,
 frankincense_type_id int,
 employee_id int,
  foreign key (promotion_id) references promotion(id),
  foreign key (frankincense_type_id) references frankincense_type(id),
  foreign key (employee_id) references employee(id)
 
 );
 

 create table booking_frankincense(
 id int primary key auto_increment,
 `status` boolean,
 frankincense_booking_time datetime,
  quantity int,
 frankincense_id int,
 customer_id int,
  foreign key (frankincense_id) references frankincense(id),
  foreign key (customer_id) references customer(id)
 );
 