create database INSURANCE;
create table INSURANCE.person(
driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id)
);
create table INSURANCE.car(
reg_num varchar(10),
model varchar(10),
year int,
primary key(reg_num)
);
create table INSURANCE.accident(
report_num int,
accident_date date,
location varchar(20),
primary key(report_num)
);
create table INSURANCE.owns(
driver_id varchar(10),
reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num)
);
create table INSURANCE.participated(
driver_id varchar(10),
reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);
use INSURANCE;
insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajajinagar');
insert into person values('A03','Smith','Ashoknagar');
insert into person values('A04','Venu','N.R.Colony');
insert into person values('A05','John','Hanumanth Nagar');
select * from person;

insert into car values('KA052250','Indica', 1990);
insert into car values('KA031181','Lancer', 1957);
insert into car values('KA095477','Toyota', 1998);
insert into car values('KA053408','Honda', 2008);
insert into car values('KA041702','Audi', 2005);
select * from car;

insert into accident values(11,'2001-01-03','Mysore Road');
insert into accident values(12,'2002-01-04','Southend Circle');
insert into accident values(13,'2021-01-03','Bulltemple Road');
insert into accident values(14,'2017-02-08','Mysore Road');
insert into accident values(15,'2008-03-05 ','Kanakpura Road');
select * from accident;

insert into owns values('A01','KA052250');
insert into owns values('A02','KA053408');
insert into owns values('A03','KA031181');
insert into owns values('A04','KA095477');
insert into owns values('A05','KA041702');
select * from owns;

insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA053408',12,50000);
insert into participated values('A03','KA095477',13,25000);
insert into participated values('A04','KA031181',14,3000);
insert into participated values('A05','KA041702',15,5000);
select * from participated;
use INSURANCE;
UPDATE participated
SET damage_amount=25000
WHERE report_num=12;

insert into accident values('16','2009-04-05','Mysore Road');
select * from accident;
use INSURANCE;
SELECT COUNT(DISTINCT driver_id) FROM accident, participated
WHERE accident.report_num = participated.report_num
AND accident_date LIKE '2008%'

use INSURANCE;
SELECT COUNT(report_num) FROM car, participated 
WHERE car.reg_num = participated.reg_num
AND model='Lancer';
