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

--Add a gender column to table--
Alter table employee_payroll add Gender char;

Update employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
Update employee_payroll set gender = 'F' where name = 'Terissa';

Select * from employee_payroll;

--Use SUM,AVG,MAX,MIN,COUNT operations--
select gender,SUM(salary) as sum from employee_payroll  group by gender;
select gender,AVG(salary) as avg from employee_payroll group by gender;
select gender,MIN(salary) as min from employee_payroll group by gender;
select gender,MAX(salary) as max from employee_payroll group by gender;
select gender,COUNT(gender) as count from employee_payroll group by gender;

--Add phone_no,address and department columns--
Alter table employee_payroll add phone varchar(15)
Alter table employee_payroll add department varchar(20)
Alter table employee_payroll add address varchar(100)
Alter table employee_payroll add constraint df_address default 'India' for address

Update employee_payroll set phone = '888888888', department = 'Sales',address = 'Mumbai' where name = 'Bill'
Update employee_payroll set phone = '999999999', department = 'Marketing',address = 'Delhi' where name = 'Terissa'
Update employee_payroll set phone = '777777777', department = 'Finance',address = 'Bangalore' where name = 'Charlie'

Alter table employee_payroll  alter column department varchar(20) not null

--Add BasicPay,Decductions,TaxablePay,IncomeTax and NetPay columns--
sp_rename 'employee_payroll.salary', 'basic_pay';
alter table employee_payroll add deduction money,taxable_pay money,income_tax money,net_pay money;

--Make Terissa part of sales and marketing department--
insert into employee_payroll (name,basic_pay,start_date,gender,phone,department,address) values
('Terissa','200000.00','2019-11-13','F','999999999','Sales','Delhi');

select * from employee_payroll;
