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

#Usecase 5:
select salary from employee_payroll where name = 'Bill';
select * from employee_payroll
where start between cast('2020-01-01' as date) and date(now());

#Usecase 6:
alter table employee_payroll add gender char(1)	after name;
update employee_payroll
set gender = 'M' where name = 'Bill' or name = 'Charlie';
update employee_payroll set gender = 'F' where name = 'Terisa';

#Usecase 7:
select gender, sum(salary) from employee_payroll group by gender;
select gender, avg(salary) from employee_payroll group by gender;
select gender, min(salary) from employee_payroll group by gender;
select gender, max(salary) from employee_payroll group by gender;
select gender, count(*) from employee_payroll group by gender;

#Usecase 8:
#UC 8
alter table employee_payroll
add phone numeric(10) not null after name,
add address varchar(200) not null default 'New York' after phone,
add department varchar(200) not null after address;

#Usecase 9:
alter table employee_payroll rename column salary to basic_pay
add deductions double not null after basic_pay, 
add taxable_pay double not null after deductions, 
add tax double not null after taxable_pay, 
add net_pay double not null after tax;
