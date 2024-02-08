-- Tasks 4: Subquery and its type:

-- 1. Retrieve the customer(s) with the highest account balance.

SELECT c.Customer_id,c.First_Name, c.Last_Name, a.Balance FROM customers c
JOIN accounts a ON c.Customer_id = a.Customer_id
ORDER BY a.Balance DESC
limit 1;

-- 2. Calculate the average account balance for customers who have more than one account.

SELECT avg(balance) as "Average Balance" from Accounts 
WHERE customer_id IN (SELECT Customer_id from accounts)
GROUP BY customer_id HAVING count(customer_id) > 1;


-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT t.amount,a.Account_id, a.Customer_id, a.Account_type, a.balance from accounts a
JOIN transactions t ON a.account_id = t.account_id
WHERE t.amount > (SELECT avg(amount) from transactions);


-- 4. Identify customers who have no recorded transactions.

SELECT c.Customer_id, c.First_Name, c.Last_Name FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.Transaction_id is NULL;


-- 5. Calculate the total balance of accounts with no recorded transactions.

SELECT SUM(balance) AS TOTAL_BALANCE FROM accounts a
LEFT JOIN Transactions t ON a.account_id = t.Account_id
WHERE t.transaction_id IS NULL;


-- 6. Retrieve transactions for accounts with the lowest balance.

SELECT t.Transaction_id, t.Account_id, t.Transaction_type, t.Amount, t.Transaction_date FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.Balance = (SELECT Balance from accounts ORDER BY Balance LIMIT 1);


-- 7. Identify customers who have accounts of multiple types.

SELECT c.customer_id, c.First_Name, c.Last_Name from customers c
JOIN accounts a ON c.Customer_id = a.Customer_id
GROUP BY Customer_id HAVING count(account_type)=1;


-- 8. Calculate the percentage of each account type out of the total number of accounts.

SELECT Account_type, count(*), (count(*)/(SELECT count(*) FROM accounts))*100 FROM Accounts
GROUP BY ACCOUNT_TYPE;

-- 9. Retrieve all transactions for a customer with a given customer_id.

SELECT t.Transaction_id, t.Account_id, t.Transaction_type, t.Amount, t.Transaction_date FROM Transactions t
JOIN Accounts a ON t.Account_id = a.Account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE c.customer_id = 112;


-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause

SELECT Account_type, sum(balance) as "Total Balance" FROM Accounts
GROUP BY Account_type;
