--Create database--
create database payroll_service
select * from sys.databases where name = 'payroll_service'
use payroll_service

--Create table--
create table employee_payroll
(
id int identity(1,1) not null,
name varchar(25) not null,
salary money not null,
start_date date not null
)

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'employee_payroll'

--Insert values in table--
insert into employee_payroll values
('Bill',100000.00,'2018-01-03'),
('Terissa',200000.00,'2019-11-13'),
('Charlie',300000.00,'2020-05-21');

--Retrieve all values from table--
select * from employee_payroll

--Retrieve values based on conditions--
select salary from employee_payroll where name = 'Bill'
select * from employee_payroll where start_date between '2018-01-01' and GETDATE();