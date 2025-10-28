### This file will container Orale all command

#### Show all tables;
```sql
select * from tab;
```

#### Select everything from a table:
```sql
SELECT * FROM branch;
SELECT * FROM customer;
SELECT * FROM account;
SELECT * FROM loan;
SELECT * FROM depositor;
SELECT * FROM borrower;
```

#### Select specific columns:
```sql
SELECT branch_name, assets FROM branch;
SELECT customer_name, customer_city FROM customer;
SELECT account_number, balance FROM account;
```

#### WHERE clause (filtering):
```sql
SELECT * FROM branch WHERE branch_city = 'Brooklyn';
SELECT * FROM customer WHERE customer_city = 'Rye';
SELECT * FROM account WHERE balance > 700;
```

#### ORDER BY (sorting):
```sql
SELECT * FROM customer ORDER BY customer_name ASC;
SELECT * FROM account ORDER BY balance DESC;

```

#### DISTINCT (remove duplicates):
```sql
SELECT DISTINCT branch_city FROM branch;
SELECT DISTINCT customer_city FROM customer;
```
#### Aggregate Functions & GROUP BY
```sql
-- Total assets in all branches
SELECT SUM(assets) AS total_assets FROM branch;

-- Average balance per branch
SELECT branch_name, AVG(balance) AS avg_balance
FROM account
GROUP BY branch_name;

-- Number of customers in each city
SELECT customer_city, COUNT(*) AS customer_count
FROM customer
GROUP BY customer_city;

```
#### HAVING (filtering aggregates):
```sql
SELECT branch_name, COUNT(account_number) AS num_accounts
FROM account
GROUP BY branch_name
HAVING COUNT(account_number) > 1;

```
#### INNER JOIN (matching rows in two tables):
```sql
-- Customers and their accounts
SELECT c.customer_name, a.account_number, a.balance
FROM customer c
JOIN depositor d ON c.customer_name = d.customer_name
JOIN account a ON d.account_number = a.account_number;

-- Loans and borrowers
SELECT b.customer_name, l.loan_number, l.amount
FROM borrower b
JOIN loan l ON b.loan_number = l.loan_number;

```
#### LEFT JOIN / RIGHT JOIN:
```sql
-- All customers and their accounts (even if no account)
SELECT c.customer_name, a.account_number
FROM customer c
LEFT JOIN depositor d ON c.customer_name = d.customer_name
LEFT JOIN account a ON d.account_number = a.account_number;

-- All accounts and borrowers (even if no borrower)
SELECT a.account_number, b.customer_name
FROM account a
LEFT JOIN depositor d ON a.account_number = d.account_number
LEFT JOIN customer c ON d.customer_name = c.customer_name;

```
#### Subqueries (Nested Queries)
```sql
-- Customers who have more than 1 account
SELECT customer_name
FROM depositor
GROUP BY customer_name
HAVING COUNT(account_number) > 1;

-- Branches with assets greater than average
SELECT branch_name, assets
FROM branch
WHERE assets > (SELECT AVG(assets) FROM branch);

```
#### UNION (combine results, remove duplicates):
```sql
-- All customer names from borrower and depositor
SELECT customer_name FROM borrower
UNION
SELECT customer_name FROM depositor;

```
#### UNION ALL (include duplicates):
```sql
SELECT customer_name FROM borrower
UNION ALL
SELECT customer_name FROM depositor;

```
#### INTERSECT (common rows):
```sql
-- Customers who are both borrowers and depositors
SELECT customer_name FROM borrower
INTERSECT
SELECT customer_name FROM depositor;

```
#### MINUS (difference):
```sql
-- Customers who are borrowers but not depositors
SELECT customer_name FROM borrower
MINUS
SELECT customer_name FROM depositor;

```
#### Customers with total loan amount > 1000:
```sql
SELECT b.customer_name, SUM(l.amount) AS total_loan
FROM borrower b
JOIN loan l ON b.loan_number = l.loan_number
GROUP BY b.customer_name
HAVING SUM(l.amount) > 1000;

```
#### Branches with more than 2 accounts:
```sql
SELECT branch_name, COUNT(account_number) AS num_accounts
FROM account
GROUP BY branch_name
HAVING COUNT(account_number) > 2;

```
#### Customers and their branch city (via accounts):
```sql
SELECT c.customer_name, a.account_number, b.branch_city
FROM customer c
JOIN depositor d ON c.customer_name = d.customer_name
JOIN account a ON d.account_number = a.account_number
JOIN branch b ON a.branch_name = b.branch_name;

```
#### Top 3 branches by assets:
```sql
SELECT branch_name, assets
FROM branch
ORDER BY assets DESC
FETCH FIRST 3 ROWS ONLY;

```
#### Customers with multiple loans from different branches:
```sql
SELECT customer_name, COUNT(DISTINCT branch_name) AS branch_count
FROM borrower b
JOIN loan l ON b.loan_number = l.loan_number
GROUP BY customer_name
HAVING COUNT(DISTINCT branch_name) > 1;

```
 
