  
create database Lab1;
use Lab1;

create table Lab1.person (driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id));
desc person;

create table car(reg_num varchar(10),model
varchar(10),year int,primary key(reg_num));
desc car;

create table accident(report_num int,accident_date
date,location varchar(20),primary key(report_num));
desc accident;

create table owns(driver_id varchar(10),reg_num
varchar(10),primary key(driver_id,reg_num),foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
desc owns;

create table participated(driver_id
varchar(10), reg_num varchar(10),report_num int, damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;


insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajajinagar');
insert into person values('A03','Smith','Ashoknagar');
insert into person values('A04','Venu','N.R.Colony');
insert into person values('A05','John','Hanumanth Nagar');
select * from person;


insert into car values('KA052250','Audi', 2019);
insert into car values('KA031181','Lamborghini', 2014);
insert into car values('KA035417','Mercedes',2020);
insert into car values('KA041702','Lexus',2021);
insert into car values('KA043408','Tesla',2020);
select * from car;

insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','Southend Circle');
insert into accident values(13,'2003-01-21','Bulltemple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2005-03-04','Kanakpura Road');
select * from accident;

insert into owns values('A01','KA052250');
insert into owns values('A02','KA031181');
insert into owns values('A03','KA035417');
insert into owns values('A04','KA041702');
insert into owns values('A05','KA043408');
select * from owns;

insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA031181',12,50000);
insert into participated values('A03','KA035417',13,25000);
insert into participated values('A04','KA041702',14,3000);
insert into participated values('A05','KA043408',15,5000);
select * from participated;

update participated set damage_amount=25000 where report_num=12;
select * from participated;

insert into person values('A06','Jospeh','Shanti Nagar');
insert into car values('KA012370','Ferrari', 2014);
insert into accident values(16,'2008-01-01','MG Road');
insert into owns values('A06','KA012370');
insert into participated values('A06','KA012370',16,15000);

select count(*) from accident where year(accident_date)=2008;

select count(*) as no_of_acc from participated where reg_num in(select reg_num from car where model='Honda');
