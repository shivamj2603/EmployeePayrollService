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

#Usecase 10:
update employee_payroll set department = 'Sales' where name = 'Terisa';
insert into employee_payroll (name,phone, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) values
('Terisa', 9865326598, 'Marketing', 'F', 300000, 50000, 200000, 10000, 200000, '2019-12-03');

#Usecase 11:
alter table employee_payroll rename to employee;
alter table employee rename column id to employeeId;
create table employee_dept (
employeeId int not null,
departmentName varchar(100) not null,
foreign key (employeeId) references employee(employeeId)
);
create table payroll (
employeeId int not null,
basic_pay double not null,
deductions double not null,
taxable_pay double not null,
tax double not null,
net_pay double not null,
foreign key (employeeId) references employee(employeeId)
);
create table phone_numbers (
employeeId int not null,
phone numeric(10) not null,
foreign key (employeeId) references employee(employeeId)
);
alter table employee
drop column basic_pay,
drop column deductions,
drop column taxable_pay,
drop column tax,
drop column net_pay;

#Usecase 12:
select employee.employeeId, employee.name, phone_numbers.phone, employee.address, employee_dept.departmentName, employee.gender,
payroll.basic_pay, payroll.deductions, payroll.taxable_pay, payroll.tax, payroll.net_pay, employee.start
from employee 
inner join phone_numbers on employee.employeeId = phone_numbers.employeeId 
inner join employee_dept on employee.employeeId = employee_dept.employeeId
inner join payroll on employee.employeeId = payroll.employeeId;


