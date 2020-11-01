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