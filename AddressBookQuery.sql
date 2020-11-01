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