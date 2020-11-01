--Create address_book_service database--
create database address_book_service
use address_book_service

--Create address_book table--
create table address_book
(
First_Name varchar(10) not null,
Last_Name varchar(10) not null,
Address varchar(30) not null,
City varchar(10) not null,
State varchar(15) not null,
ZipCode varchar(6) not null,
PhoneNo varchar(15) not null,
email varchar(20) not null
)

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'address_book';

--Insert values in table--
insert into address_book values
('Ram','Singh','23-River Park','Mumbai','Maharashtra','400500','9999999999','ramsingh@gmail.com'),
('Ravi','Pandey','17-Orchids Colony','Bangalore','Karnataka','500300','8888888888','ravipandey@gmail.com'),
('Seeta','Yadav','02-Green Tower','Mumbai','Maharashtra','400503','6666666666','seetasingh@gmail.com'),
('Riya','Sharma','32-Street Road','Hyderabad','Telangana','300200','444444444','riyasharma@gmail.com'),
('Shyam','Patil','20-Shastri Nagar','Bangalore','Karnataka','500303','7777777777','shyampatil@gmail.com');

select * from address_book;

--Update contact in table--
Update address_book set PhoneNo = '5555555555' where First_Name = 'Riya' and Last_Name = 'Sharma'; 

--Delete contact in table--
Delete from address_book where First_Name = 'Riya' and Last_Name = 'Sharma';

--Get contact By state or city--
select * from address_book where city = 'Mumbai';
select * from address_book where state = 'Karnataka';

--Get count of contacts by city Or state--
select city,count(first_name) from address_book group by city;
select state,count(first_name) from address_book group by state;

--Sort by name for a given city --
select * from address_book where city = 'Mumbai' order by First_Name;
select * from address_book where city = 'Bangalore' order by First_Name;