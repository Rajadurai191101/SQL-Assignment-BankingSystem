-- Tasks 2: Select, Where, Between, AND, LIKE:

/* 
1. Insert at least 10 sample records into each of the following tables.
		• Customers
		• Accounts
		• Transactions 
*/
INSERT INTO customers (Customer_id, First_Name, Last_Name, DOB, Email_id, Phone_number,Address) 
VALUES 
	(111,'ADAM','ZAMPA','1990-05-23','adamzam@gmail.com','9283746590','Dindigul'),
	(112,'BEN','TENISON','1995-01-21','benten@gmail.com','8523741227','Chennai'),
	(113,'DARK','DEVIL','2001-11-19','darkdev@gmail.com','8123564395','Trichy'),
	(114,'SLIM','SHADY','2001-12-05','slimsha@gmail.com','6752138733','Palani'),
	(115,'JOKER','ALAN','1999-07-15','alabjok@gmail.com','8145236880','Chennai'),
	(116,'LEO','DAS','1994-06-21','leodas@gmail.com','6573428916','Chennai'),
	(117,'VIKRAM','RATHORE','1965-10-11','vikram@gmail.com','7531538566','Dindigul'),
	(118,'SCARLET','JOHN','1977-03-31','scarj@gmail.com','9154332675','Theni'),
	(119,'AMY','JACKSON','2000-07-25','amyjack@gmail.com','6543287851','Coimbatore'),
	(120,'MIKE','JON','1998-05-04','mikejon@gmail.com','9099675220','Madurai');


INSERT INTO Accounts (Account_id, Customer_id, Account_type, balance)
VALUES 
	(1001,111,'Savings',5000.75),
	(1002,112,'Savings',7000.50),
	(1003,113,'Current',4500.30),
	(1004,114,'Zero Balance',0.00),
	(1005,115,'Savings',3200.10),
	(1006,116,'Zero Balance',0.00),
	(1007,117,'Current',8200.20),
	(1008,118,'Zero Balance',0.00),
	(1009,119,'Savings',3500.90),
	(1010,120,'Current',4700.60);


INSERT INTO Transactions (Transaction_id, Account_id, Transaction_type, Amount, Transaction_date)
VALUES 
	(2501,1001,'Deposit',1000.00,'2023-12-01'),
	(2502,1002,'Withdraw',2000.00,'2024-01-05'),
	(2503,1003,'Deposit',500.00,'2023-07-11'),
	(2504,1004,'Withdraw',2500.00,'2023-04-12'),
	(2505,1005,'Transfer',1200.00,'2023-11-19'),
	(2506,1006,'Transfer',3000.00,'2024-01-01'),
	(2507,1007,'Deposit',3100.90,'2023-12-15'),
	(2508,1008,'Withdraw',450.00,'2023-11-29'),
	(2509,1009,'Transfer',1350.00,'2023-10-19'),
	(2510,1010,'Withdraw',900.00,'2024-01-01');
    
    
-- TASK 2
-- 2. Write SQL queries for the following tasks:

-- 1.Write a SQL query to retrieve the name, account type and email of all customers.
SELECT First_name, Last_name,(SELECT Account_type from Accounts where Customer_id=customers.Customer_id)as Account_type, Email_id from customers;

-- 2.Write a SQL query to list all transaction corresponding customer.
SELECT First_name, Last_name,(SELECT transaction_type from transactions where Transactions.Account_id=(select accounts.Account_id from accounts where Customer_id=customers.customer_id)) as AccountType ,
(SELECT amount from transactions where Transactions.Account_id=(select accounts.Account_id from accounts where Customer_id=customers.customer_id)) as Amount from customers;

-- 3.Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE accounts set balance=balance+1200 where Account_id=1001;

-- 4.Write a SQL query to Combine first and last names of customers as a full_name.
SELECT concat(first_name,' ',Last_name) as "FULL NAME" from Customers;

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts where Account_type='savings' and Balance = 0;

-- 6. Write a SQL query to Find customers living in a specific city.
SELECT Customer_id, First_name, Last_name, Address from customers where Address='Dindigul';

-- 7. Write a SQL query to Get the account balance for a specific account.
SELECT Account_id, Balance from Accounts where Account_id = '1003';

-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
SELECT account_type, balance from Accounts where account_type = 'Current' and balance>1000;

-- 9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT Transaction_id, Transaction_type, Amount, Transaction_date from Transactions where Transaction_id = 2502;
SELECT * FROM transactions where Transaction_id = 2503;

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
SELECT account_type, balance*2 from Accounts where account_type = 'Savings';

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
SELECT * from Accounts where balance < 1000;

-- 12. Write a SQL query to Find customers not living in a specific city.
SELECT Customer_id, First_name, Last_name, Address from customers where Address != 'Dindigul';




