# Usecase1:
create database payroll_service;
show databases;
use payroll_service;
#Usecase2:
create table employee_payroll		
(
id int not null auto_increment,
name varchar(150) not null,
salary double not null,
start date not null,
primary key (id)
);
describe employee_payroll;
#Usecase 3:
insert into employee_payroll (name, salary, start)
values
('Bill', 100000, '2018-01-03'),
('Terisa', 300000, '2019-12-03'),
('Charlie', 500000, '2020-02-03');
#Usecase 4:
select * from employee_payroll;	