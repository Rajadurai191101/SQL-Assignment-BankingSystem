-- Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:

-- 1. Write a SQL query to Find the average account balance for all customers.
SELECT avg(balance) as 'Average Balance' from Accounts;


-- 2. Write a SQL query to Retrieve the top 10 highest account balances.
SELECT * FROM Accounts
ORDER BY balance DESC
LIMIT 10;

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT c.customer_id, c.First_name, c.Last_name, sum(t.Amount) as "Total Deposit" FROM customers c
JOIN accounts a ON c.Customer_id = a.Customer_id
JOIN transactions t ON a.Account_id = t.Account_id
WHERE t.Transaction_type = "Deposit" AND t.Transaction_date = "2023-12-15"
GROUP BY c.customer_id, c.First_name, c.Last_name;

-- 4. Write a SQL query to Find the Oldest and Newest Customers.
SELECT First_name,Last_name,DOB from customers order by dob asc limit 1;
SELECT First_name,Last_name,DOB from customers order by dob desc limit 1;


-- 5. Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.Transaction_id, t.Account_id, t.Transaction_type, t.Amount, t.Transaction_date, a.Account_type FROM Transactions t
JOIN accounts a ON t.account_id = a.account_id;

-- 6. Write a SQL query to Get a list of customers along with their account details.
SELECT c.Customer_id, c.First_Name, c.Last_Name, a.Account_id, a.Account_type, a.balance FROM customers c
JOIN accounts a ON c.Customer_id = a.customer_id;

-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
SELECT t.Transaction_id, t.Account_id, c.First_Name, c.Last_Name, c.Email_id, t.Transaction_type, t.Amount, t.Transaction_date FROM Transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.Customer_id = c.Customer_id
WHERE a.account_id = 1003;


-- 8. Write a SQL query to Identify customers who have more than one account.
SELECT customer_id,First_Name,Last_Name,DOB FROM customers 
WHERE Customer_id IN (SELECT Customer_id FROM accounts GROUP BY customer_id HAVING count(account_id)>1);


-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.
SELECT t.Account_id, sum(CASE WHEN Transaction_type = "Deposit" then a.balance + t.amount ELSE a.balance - t.Amount END) FROM transactions t
JOIN Accounts a ON t.account_id = a.account_id
GROUP BY Account_id;


-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period.
SELECT a.Account_id, avg(a.balance) as Balance FROM accounts a
JOIN Transactions t ON a.Account_id = t.Account_id
WHERE t.transaction_date BETWEEN "2023-04-12" AND "2023-10-19"
GROUP BY Account_id;


-- 11. Calculate the total balance for each account type.
SELECT Account_type, sum(Balance) as "Total Balance" FROM Accounts
GROUP BY Account_type;


-- 12. Identify accounts with the highest number of transactions order by descending order.
SELECT Account_id,count(Transaction_id) as Transactions FROM Transactions 
GROUP BY Account_id ORDER BY Transactions DESC;


-- 13. List customers with high aggregate account balances, along with their account types.
SELECT c.First_name, c.Last_name, c.customer_id, sum(a.balance), a.account_type from customers c JOIN accounts a on c.customer_id = a.Customer_id
group by c.First_name, c.Last_name, c.customer_id,a.account_type having sum(a.balance)>5000;

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account.
SELECT transaction_id,(SELECT Account_id from accounts where accounts.Account_id = Transactions.Account_id) as "AccountId", Amount, Transaction_date from Transactions where transaction_id = Transaction_id;
