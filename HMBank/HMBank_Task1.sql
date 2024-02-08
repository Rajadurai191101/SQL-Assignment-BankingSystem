-- TASK 1: DATABASE DESIGN:

-- 1. Create the database named "HMBank"
CREATE DATABASE HMBank;
USE HMBank;

/* 2. Define the schema for the Customers, Accounts, and Transactions tables based on the
provided schema.
3. Create an ERD (Entity Relationship Diagram) for the database.
4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
5. Write SQL scripts to create the mentioned tables with appropriate data types, constraints,
and relationships.
• Customers
• Accounts
• Transactions */

create table customers(
	Customer_id int primary key, 
	First_Name varchar(30) not null, 
    Last_Name varchar(30), 
    DOB date,
    Email_id varchar(50), 
    Phone_number varchar(20) not null,
    Address varchar(50)
);

drop table customers;
select * from customers;
desc customers;



create table Accounts(
	Account_id bigint primary key,
	Customer_id int, 
    foreign key(Customer_id) references customers(Customer_id),
    Account_type varchar(30),
    balance decimal(10,2) not null
);

drop table Accounts;
select * from Accounts;
desc Accounts;



create table Transactions(
	Transaction_id bigint primary key, 
    Account_id bigint,
    foreign key(Account_id) references Accounts(Account_id), 
    Transaction_type varchar(30),
    Amount int,
    Transaction_date date
);

drop table transactions;
select * from transactions;
desc Transactions;