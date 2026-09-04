-- show databases;
-- create database BankingDB;
 -- USE bankingdb;
 CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 FirstName VARCHAR (50),
 LastName VARCHAR(50),
 Email VARCHAR(100),
 Phone VARCHAR(15),
AccountCreationDate DATE
 );


desc customers; 


select * from customers;
CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR (20),
    Balance DECIMAL(10,2)
);

desc Accounts;

CREATE TABLE Transactions (
     TransactionID INT,
     TransactionDate DATE,
     Amount DECIMAL (10,2),
     TransactionType VARCHAR(20)
);

desc Transactions;

CREATE TABLE Branches (
    BranchID INT,
	BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

desc Branches;
CREATE TABLE AccountBranches (
           AssignmentDate DATE
);
    CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE 
);

desc Loans;

ALTER TABLE  Customers
ADD DateofBirth DATE;
desc Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
desc customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

Drop table accountbranches;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);
desc Accounts;

ALTER TABLE Accounts
ADD CONSTRAINT AccountID
PRIMARY KEY (AccountID);
desc Accounts;

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) Not Null;

desc Customers;           
	
ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);   
desc Customers;

ALTER TABLE branches
ADD CONSTRAINT 
PRIMARY KEY (BranchID);
desc branches;


ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Branch_Accounts
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

desc accounts;


/*SELECT 
  CONSTRAINT_NAME,
  CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
 and TABLE_NAME = 'Accounts' ;
 
  -- SHOW CREATE TABLE Accounts; */
  
  -- Transactions Connect with Accounts
  ALTER TABLE Transactions
  ADD CONSTRAINT PK_Transactions 
  PRIMARY KEY (TransactionsID);
  
  ALTER TABLE Transactions
  ADD AccountID INT;
  
  ALTER TABLE Transactions
  ADD CONSTRAINT FK_Transactions_Accounts
  FOREIGN KEY (AccountID)
  REFERENCES Accounts(AccountID);
  
  -- Loans Connect with Customer
  ALTER TABLE Loans 
  ADD CONSTRAINT PK_Loans
  PRIMARY KEY (LoanID);
  
  -- Add CustomerID column
  ALTER TABLE Loans
  ADD CustomerID INT;
  
  -- Add FOREIGN KEY CONSTRAINT
  ALTER TABLE Loans
  ADD CONSTRAINT FK_Loans_Customers
  FOREIGN KEY (CustomerID)
  REFERENCES Customers(CustomerID);
  desc loans;
  
  INSERT INTO Customers
  (CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
  VALUES
  (101,'Rahul','Sharma','rahul@gmail.com','9529887688','1998-04-15');
  
  INSERT INTO Customers
  VALUES
  ('102', 'Ketan', 'Tiwari', 'Ketan@gmail.com','7620834880','2026-08-05','2000-06-22');
  
  INSERT INTO Customers
  (CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
  VALUES
  (103,'Neha','Singh','neha@gmail.com','9529887600','2026-08-03','1992-07-03'),
  (104,'Mukul','Jha','mukul@gmail.com','9270455252','2025-02-01','1995-11-06');
 
 INSERT INTO Accounts
 (AccountID, CustomerID, AccountType, Balance)
 VALUES
 (201,101,'Savings',25000);
  
 
 UPDATE Customers 
SET 
    AccountCreationDate = '2025-06-29'
WHERE
    CustomerID = 101;
 
 select * from customers;
 select * from accounts;
 select * from branches;
 select * from loans;
 select * from transactions;
 -- ________________________________________________________________________________________________
insert into customers 
values (105,'karan','Mehta','karan@gmail.com','9529887660','2026-09-03','1993-07-03');


INSERT INTO Branches 
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(111, 'Nagpur Central Branch', 'Nagpur', '9876543210'),
(112, 'Pune City Branch', 'Pune', '9876543211'),
(113, 'Mumbai Main Branch', 'Mumbai', '9876543212'),
(114, 'Nashik Branch', 'Nashik', '9876543213'),
(115, 'Aurangabad Branch', 'Aurangabad', '9876543214');


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance,BranchID)
VALUES
(1001,101,'Savings',95000,111),
(1002,102,'Savings',79000,112),
(1003,103,'Savings',15000,113),
(1004,104,'Savings',85000,114),
(1005,105,'Savings',50000,115);
 
insert into loans 
(loanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
values
(501,50000.0,8.5,'2024-01-01','2029-01-01',101),
-- (502,25000.0,9.0,'2024-03-15','2028-03-15',102),
(503,15000.0,7.8,'2024-06-20','2031-06-20',103),
-- (504,12000.0,7.8,'2024-07-19','2033-07-19',104),
(505,13000.0,7.8,'2024-07-17','2034-07-17',105);
 
 select * from loans;
 /*DELETE FROM Loans
 WHERE LoanID IN (501,502,503,504,505);*/

INSERT INTO transactions
(transactionID, TransactionDate,Amount, TransactionType, AccountID)
VALUES
(301,'2026-08-02', 25000.00, 'Withdrawal','1001'),
(302,'2026-08-03', 35000.00, 'Deposit','1002'),
(303,'2026-08-04', 45000.00, 'Transfer','1003'),
(304,'2026-08-05', 65000.00, 'Transfer','1004'),
(305,'2026-08-10', 15000.00, 'Deposit','1004');
/*INSERT INTO transactions
(transactionID, TransactionDate,Amount, TransactionType, AccountID)
VALUES
(306,'2026-08-02', 225000.00, 'Deposit','1006');*/

DELETE FROM Accounts
WHERE AccountID = 201;

/*DELETE FROM transactions 
WHERE AccountID IN (1001, 1002, 1003, 1004, 1005);*/
select * FROM transactions;

/*INSERT INTO Transactions 
VALUES 
(*/

/*DELETE FROM Branches 
WHERE BranchID IN (101,102,103,104,105);*/

   -- _______________________________________________________
  
UPDATE Accounts 
SET 
    balance = 30000
WHERE
    customerid = 101;
 select * from accounts;
 
 UPDATE Accounts 
SET 
    balance = balance+2000
WHERE
    customerID = 102;
 select * from accounts;
 -- 3 baar run kiya hai so 85000
 -- ______
UPDATE customers 
SET 
    email = 'rahulsharma@gmail.com',
    phone = '2404135788'
WHERE 
     customerid= 101;
     
     
 select * from customers;
 select * from accounts;
 select * from branches;
 select * from loans;
 select * from transactions;
 

SELECT 
    customerid, firstname, lastname, phone
FROM
    customers;

SELECT 
    *
FROM
    accounts
WHERE
    AccountType = 'Savings';
  -- __  
   SELECT 
    *
FROM
    accounts
WHERE
    Balance < 30000;
  -- __
   SELECT 
    *
FROM
    accounts
WHERE
    -- AccountType != 'savings' ;
       AccountType <> 'savings' ;
       
-- _________+
 -- ___________________________________________
 SELECT 
    *
FROM
    accounts
WHERE
    balance >= 50000
        && AccountType = 'Savings';
        -- use AND or && BOTH SAME
        -- COMPARISON OPERATOR, agar OR or || (double bars) use kareign to vo ek bhi condtiion true then wirtter / ko fulfill kareigi so sare written karega

-- ________
-- NOW USING NOT CONDTITION LOGICAL OPERATOR
 SELECT 
    *
FROM
    accounts
WHERE
    NOT AccountType = 'Savings ';
    -- ---________

--  ______________________________________________________________________________________________________

-- Find all customers registered after 12July2026
select firstname, lastname, accountcreationdate
from customers
 where AccountCreationDate > '2026-07-01';
 

 select firstname, lastname, phone 
 from customers
 WHERE Phone IN ('9529887688' , '9529887600' );

 
 select firstname, lastname, phone 
 from customers
 WHERE phone = '9529887688' OR phone = '9529887600';

-- BETWEEN operator
-- Find customers having balance between 10000-20000 FROM ACCOUNTS

SELECT customerid, accounttype, balance
FROM accounts
WHERE balance BETWEEN 10000 AND 50000;
-- the values specified in range are included in the result is only 1 i.e 15000.

SELECT customerid, accounttype, balance
FROM accounts
WHERE balance >= 10000 AND balance <= 70000;
-- SAME OUTPUT BY USING AND OPERATOR


-- LIKE OPERATOR
-- Find all customers whose first name starts with letter "K"

SELECT * FROM customers
WHERE firstname LIKE 'K%';

-- Find all customers whose first name starts with letter "K"

SELECT * FROM customers
WHERE lastname LIKE '%A';

-- "_" MATCHES EXACTLY ONE CHARACTER.
-- Find all the customers whose last name has exactly 3 characters;
select * from customers
where lastname LIKE '______';


-- SORTING
-- ORDER BY CLAUSE
-- sort the accounts table according to customer balance.

SELECT Customerid, balance
FROM  accounts
ORDER BY balance;

-- sort the branches table according to customer branchname.
SELECT branchID, branchname
FROM  branches
ORDER by BranchName ;

select * from branches;
/*sort the accounts table according to customer balance.
FROM highest to lowest
 ORDER VALUE ME "DESC" describe nahi but descending h. */
select customerid, balance
from accounts
order by balance DESC;

/* SORT ACCORDING TO MULTIPLE COLUMNS
SORT ACCOUNTS TABLE ACCORDING TO ACCOUNT TYPE AND BALANCE */
select accountid, accounttype, balance, customerid
from accounts
order by AccountType DESC, Balance DESC;

-- DISTINCT clause
-- Find distinct (unique) account types from accounts table
select distinct accounttype from accounts;
select * from transactions;
-- LIMIT 2; WILL ONLY SHOW 2 RECORDS, just restricts the no. of records in the output
-- Find distinct (unique) transaction types and accountID
-- From trsactions table
select distinct TransactionType, AccountID from transactions;
/*-- 😁date 07-08-2026 niche►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►►▶▶▶▶▶▶▶►►►►►►►►►►►►►►►►►

-- Specialized operator IN BETWEEN LIKE hogaya hai upar
-- distinct order by
-- LIMIT AND OFFSET
-- not : distinct checks combination of column
-- limit clause is used to restrict the nomber of records returned in SQL query result

-- offset is the misallignment of something , used to skip specific no. of rows before strting to return rows*/

select * from customers;
select * from accounts;
select * from accounts
limit 1;
select * from customers
limit 3 offset 2;
-- ooffset is skipping 2 rows and LIMIT it to 3 rows

select * from accounts
order by balance desc -- describe nahi descinding h
limit 2 ;
select * from accounts
order by balance desc -- describe nahi descinding h
limit 1,2; -- row 1 skip and limit other 2 after 1


-- Additional Customers

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(106, 'Priya', 'Patil', 'priya@gmail.com', NULL, '2027-03-15', '1999-04-18'),
(107, 'Amit', 'Verma', 'amit@gmail.com', '9876500001','2027-07-10', '1994-02-20'),
(108, 'Sneha', 'Kulkarni', 'sneha@gmail.com', NULL, '2028-01-12', '2001-09-05'),
(109, 'Rohan', 'Deshmukh', 'rohan @gmail.com', '9876500002', '2029-09-08', '1997-01-10'),
(110, 'Pooja', 'Shah','pooja@gmail.com', '9876500003','2026-12-01', '1998-12-15');

select * from customers
where phone is NOT null; --  NOTnull lagaya toh NULL vaale phone no. s gayab hai


INSERT INTO Accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
VALUES
(1006, 'Savings', 12000,106,111),
(1007,'Current', 85000,107,112),
(1008, 'Savings', 50000,108,113),
(1009, 'Salary', 27000,109,112),
(1010, 'Savings',9500,110,111);
select * from accounts;

INSERT INTO Transactions
VALUES
(306,'2025-02-10',2500,'Deposit', 1006),
(307,'2025-02-12',500, 'Withdrawal', 1006),
(308,'2025-02-15',15000, 'Deposit', 1007),
(309,'2025-02-20',3500, 'Withdrawal', 1008),
(310,'2025-03-01',5000, 'Deposit', 1009),
(311,'2025-03-05',4500, 'Withdrawal', 1010);
select * from transactions;
/*DELETE FROM transactions
WHERE transactionid = 312
limit 1;*/

INSERT INTO Loans
VALUES
(504,300000,8.9,'2025-01-01','2030-01-01',106),
(505,900000,7.2,'2024-09-01', '2034-09-01',108);
select * from loans;

/*select 
Case 
when condition then result
else result
end ad 
from 
case also creates a new column depends on how to put it
kitne when coming depends on how many conditions hme put krni h */

SELECT 
    *
FROM
    accounts;
SELECT 
    accountid,
    accounttype,
    balance,
    CASE
        WHEN balance >= 50000 THEN 'High Value Customer'
        ELSE 'Low Value Customer'
    END AS Customercategory
FROM
    accounts;

/* ASSIGNMENT
Display all Savings accounts having balance greater than ₹20,000.
this is a part of assignment of Gclassroom 
select * from accounts
where accounttype = 'Savings'
AND Balance > 20000;*/
/*Display the CustomerID, FirstName and Email of 
customers whose AccountCreationDate is after 1-Jan-2025.*/
/*select * from customers
where*/ 

-- Categorize the deposits from the transactions table as per the given condition
-- If the above 10000(included) High Amount
-- If 5000 ( included) to 10000 Medium amount
-- If upto 5000 Low Amount
-- For Transaction type withdrawal "Not Applicable"
/*SELECT 
    *
FROM
    Transactions;
SELECT 
    transactionid,
    transactiontype,
    amount,
    CASE
    WHEN amount >= 30000 THEN 'High Amount'
    WHEN amount >= 5000 THEN 'Medium Amount'
    WHEN TransactionType >= 'withdrawal' THEN 'Not Applicable'
    ELSE 'AmountCategory'
 END AS Transactionswithdrawn
FROM
    transactions;
    ALTER TABLE transactions
DROP COLUMN Transactionswithdrawn;*/
    SELECT * ,
    case
	when transactiontype = "Deposit" AND amount >= 10000 then "High Amount"
    WHEN transactiontype = "Deposit" AND amount >= 30000 THEN "Medium Amount"
    WHEN transactiontype = "Deposit" AND amount >= 5000 THEN "Low Amount"
    ELSE "Not applicable"
 END AS "TransactionsCategory"
FROM
    transactions;
    
    select * from transactions;
   -- SELECT UPPER ("INDIA")
   SELECT customerid, UPPER (Firstname), UPPER (Lastname) from customers;
   SELECT customerid, LOWER (Firstname), LOWER (Lastname) from customers;
   
   select * from branches;
   
   select lastname , length(lastname) from customers;
   
   -- select length("ागपूर")  length  count the no. of bites
   select lenth("NAGPUR") AS "NoOfCharacters";
   select char_length("ागपूर");-- gives output O/P the no of charasters
   
   select concat("Hero" , " " , "Honda") as vehiclename;
    select customerid, concat(firstname , " " , lastname) as Fullname , Phone
    FROM customers;
    
    
    SELECT substring("Hello World" , 1,4 );
   -- SELECT substring("Firstname",1, . , "Lastname");
   -- SELECT CONCAT(SUBSTRING(Firstname, 1, 1), '. ', Lastname) AS Fullname
-- FROM customers;
SELECT customerid, CONCAT(SUBSTRING(Firstname, 1, 1), '. ', Lastname) AS Fullname
 FROM customers;
 
 -- Trim () function
 select length("  Hello World  ");
 select length(trim("  Hello World  "));
 select length(trim(substring("Hello World",6))); -- THIS EXAMPLE IS FOR UNDERSTANDING

-- REPLACE FUNCTION // THE FUNCTION IS CASE SENSITIVE
select replace ("Mat Mat","M","C");


-- ROUNDA() Round
select * from accounts;
SELECT 
    AVG(Balance)
FROM
    accounts
WHERE
    AccountType = 'Savings';
SELECT 
    ROUND(AVG(Balance), 2)
FROM
    accounts
WHERE
    accounttype = 'Savings';
     -- Ceil () or Ceiling() function
SELECT 
    CEILING(AVG(Balance))
FROM
    accounts
WHERE
    accounttype = 'Savings';
    -- floor () function
SELECT 
    FLOOR(AVG(Balance))
FROM
    accounts
WHERE
    accounttype = 'current'; 
    
    SELECT 
    *
FROM
    transactions;
SELECT 
    AVG(amount)
FROM
    transactions
WHERE
    transactiontype = 'Deposit';
    select * from transactions;
    -- Absolute() function .......It removes the signal 
    select abs(-3656);
    select abs(-1.34);
    select abs(6.464);
    
    SELECT * FROM CUSTOMERS;
    -- MOD values
    select (7/3);
    select mod(7,3);
    
    
    -- Power() number is 2 and power is 3
    select power(2,3);
    select power(1.5,3);
    select power (16,2);
    
    -- SQRT()
    select sqrt(256);
    select sqrt(16);
    select sqrt(1000);
    
    -- DATE N TIME FUNCTIONS
    -- NOW() FUNCTIONS
    SELECT NOW(); 
    SELECT curdate(); -- IT TELLS CURRENT DATE
    SELECT CURTIME(); -- IT TELLS CUREENT TIME
    
    -- YEAR() MONTH() DAY()
    SELECT DateOfBirth, YEAR (DateOfBirth) AS YEAR, MONTH(DateOfBirth) AS MONTH, DAY (DateOfBirth) AS DATE
    FROM CUSTOMERS;
    SELECT * FROM CUSTOMERS;
    
    -- RETURNS NO. OF DAYS BETWWEEN TWO DATES---aaj k hisab se customer ki age BY USING DATEDIFF
    SELECT CONCAT ("FirstName"," ","LastName") as fullname, DateofBirth,
	FLOOR(DATEDIFF(CURDATE(), DateOfBirth)/365) AS Age
    FROM CUSTOMERS;
    -- _____________________________--
    
    -- Count() function
    select * from customers;
    select count(*) as TotalCustomers from customers;
    select count(phone) as TotalCustomers from customers;
    
    -- Sum() function
    select * from accounts;
    select sum(balance) as totalBalance from accounts;
    select sum(balance) as SavingsBalance from accounts
    where accounttype = "savings";
    
    -- avg() function
    select * from transactions;
    select avg(amount) as totalTransactions from transactions;
    select avg(amount) as TotalDepositTransaction from transactions
    where transactiontype = "Deposit";
    select avg(amount) as AverageAmountWithdrawn from transactions
    where transactiontype = "Withdrawal";
    
    -- max() and min() function
    -- find customer having maximum balance in savings account
    select max(balance) from accounts
    where AccountType = "savings";
    select min(balance) from accounts
    where AccountType = "savings";
    
    -- To find minimum balance available in savings account
    select min(balance) from accounts;
    
    select * from accounts;
    
    EXPLAIN SELECT COUNT(*) FROM CUSTOMERS;
    
    /* GROUP BY  CLAUSE 
    used to put rows having the same value into groups, so you can perform calculations on each group separately. 
    GROUP BY = make separate groups, then calculate something for each group.  */
    select * from transactions;
    select transactiontype, sum(amount) from transactions
    GROUP BY (TransactionType);
    
    -- select * from ACCOUNTS by using AVERAGE, TOTAL , & GROUP BY
    SELECT 
    *
FROM
    ACCOUNTS;
SELECT 
    AccountType,
    COUNT(*) AS TotalAccounts,
    SUM(Balance) AS totalBalance,
    AVG(balance) AS avgBalance
FROM
    accounts
GROUP BY (Accounttype);
    
    -- WE HAVE TO CHECK HOW MANY ACCOUNTS OF SAVINGS AND CURRENT IN EVERY BRANCH , BRANCH ID K HISAB SE
    
 SELECT 
    *
FROM
    accounts;
SELECT 
    branchid, accounttype, COUNT(*) AS NoOfAccounts
FROM
    accounts
GROUP BY branchid , accounttype
ORDER BY branchid;
    
    
-- HAVING no of accounts >>>> 2
    sELECT 
    *
FROM
    accounts;
SELECT 
    branchid, accounttype, COUNT(*) AS NoOfAccounts
FROM
    accounts
GROUP BY branchid , accounttype -- GROUP BY K RESULTS KO FILTYER KRNE KA KAAM
HAVING   noofaccounts >= 2  and accounttype = "savings" ;-- and bhi use krrdiya savings,salary, filter krne k liye 
-- ______________________--14-08-2026

 -- WE HVE 2 FIND KITNE ACCOUNTS OPEN HUA HAR EL YEAR ME
SELECT 
    *
FROM
    CUSTOMERS;
SELECT 
    EXTRACT(YEAR FROM AccountCreationDate) AS Year,
    COUNT(*) AS NoOfAccounts
FROM
    customers
GROUP BY EXTRACT(YEAR FROM AccountCreationDate)
ORDER BY Year;

-- WE HVE 2 FIND KITNE ACCOUNTS OPEN HUA 2025,2026,2027 ME
SELECT
    YEAR(AccountCreationDate) AS AccountYear,
    COUNT(*) AS NoOfAccounts
FROM customers
GROUP BY YEAR(AccountCreationDate)
HAVING AccountYear IN (2025, 2026, 2027)
ORDER BY AccountYear;

-- *CORRECT SYNTAX*         ISME B HAR EK YEAR HI AA RAHA H
SELECT 
YEAR(AccountCreationDate) AS year, COUNT(*) AS noofaccounts
FROM 
customers
GROUP BY YEAR;
-- ______________________________ --

/* dt 17 august ie 2nd missed lec 
Understand why databases use multiple tables,
Identify and use INNER, LEFT, RIGHT,  and FULL OUTER JOINs,
Use table aliases for cleaner queries, and 
Choose the right JOIN base on analysis needs
*/

-- JOINS 
select * from customers;
select * from accounts;
select * from loans;

-- we use JOINS for , connecting a customer to their specific order
-- A JOIN COMBINES RELATED ROWS FROM DIFFERENT TABLES BASED ON A COMMON COLUMS (combination of primary and foreign key)
-- INNER JOIN , Keep a row only when both sides match No match on either side, no row in the result. 

-- Find all customers having loans with their names, interest rate and loan amount.

SELECT 
c.customerid,c.firstname, c.lastname, l.InterestRate,l.LoanAmount
 FROM customers c 
 INNER JOIN loans l 
 ON c.CustomerID = l.CustomerID ;
 
-- Find the branch names for all the accountid'savepoint.
-- Include account id, accounttype and branches, branchaddress.
/*000000000000000000*/ SELECT 
    a.accountid, a.accounttype, b, branchname, b.branchaddress
FROM
    accounts
        JOIN
    branches b ON a.BranchID
WHERE
    accounttype = 'Savings';
 -- --------------------
 select * from transactions;
    
    -- find all the customers (name, phone, accounttype, balance)
    -- where account type is savings
    
     SELECT 
    c.firstname, c.lastname, c.phone, a.accounttype,a.balance
FROM
    customers c
        INNER JOIN
    accounts a ON c.customerID = a.customerID
    where accounttype = "Savings";


INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(111, 'Shreya', 'Wankar', 'Shreya@gmail.com','9876500002', '2027-03-15', '2000-04-24'),
(112, 'rajesh', 'Roy', 'Rajesh@gmail.com', '2833901829','2027-07-10', '2002-08-10'),
(113, 'Snehal', 'Pandey', 'Snehal@gmail.com', NULL, '2028-01-12', '2003-11-15');

select c.firstname, c.lastname, c.phone, a.accounttype, a.balance
from customers c
left join accounts a
on c.CustomerID = a.CustomerID;

select * from customers;

select c.firstname, c.lastname, c.phone, a. accounttype, a.balance
from accounts a
left join customers c
on c.CustomerID = a.CustomerID ;

select * from branches;

INSERT INTO branches
VALUES
(116, 'Nashik Branch' ,'College Road,Nashik', '1882973829') ;

select * from accounts;

INSERT INTO accounts
(BranchID, AccountType, Balance, CustomerID, AccountID)
VALUES
(111, 'Current',52000,111,1011),
(114, 'Savings',29000,112,1012);

INSERT INTO Transactions
(TransactionID,TransactionDate,Amount,TransactionType,AccountID)
VALUES
(314, '2025-03-20', 12000, 'Deposit', 1001), 
(315, '2025-04-05', 4000, 'Withdrawal', 1002),
(316, '2025-04-10', 7000, 'Deposit', 1004),
(317, '2025-04-15', 2500, 'Withdrawal', 1007), 
(318, '2025-05-01', 6000, 'Deposit', 1010),
(319, '2025-05-10', 2000, 'Withdrawal', 1009);

select * from transactions;

INSERT INTO Accounts
(AccountID, AccountType, Balance, CustomerID, BranchID)
VALUES
(1013, 'Current', 30000, 101, 111),
(1014, 'Salary', 50000, 106, 111);

select * from accounts;
-- Q2'= Display the customer's full name along with their AccountID, AccountType, ans Balance.
-- Use CONCAT() to combine first name and last name

SELECT 
    c.customerID, AccountID, concat_ws(' ', c.firstname, c.lastname) AS fullName,
    a.accounttype,
    a.Balance
FROM
    customers c
        INNER JOIN
    accounts a
    on c.CustomerID = a.CustomerID
    order by customerID;
    
    -- Find the number of accounts held by each customer. a4
    
    select * from transactions;
	select * from accounts;
    

-- 19/08/2026
-- find the number of accounts held by each customer.
/*
select * from customers;
select c.firstname, c.lastname, count(a.accountID)
from customer c
left join account a
on c.CustomerID = a.CustomerID
group by c.CustomerID;

-- find the number of customers for each account type.
select a.accounttype, count(a.customerID) as Totalcustomers
from accounts a
left join customer c 
on a.CustomerID = c.customerID
group by coustomerID;

-- find the customers who have more than one account.
select c.customerID, concat(c.firstname," ",c.lastname) as fullname,count(a.accountID) as TotalAccount
from customer c 
inner join accounts a 
on a.customerID = c.customerID
group by c.customerID having TotalAccounts >1;

-- find customers who have never performed a transaction
select c.customerID,
concat(c.firstname," ",c.lastname) as fullname, count(t.AccountID) as NoOfTransactions
from customer c
join account a 
on c.customerID = a.customerID
left join transactions t 
on t.accountID = a.accountID
group by c.customerID
having NoOfTransactions = 0; */

 /* Display all branches and their account count, including
branches that have zero accounts.*/
/*SELECT 
    *
FROM
    branches;
SELECT 
    b.branchID,
    b.branchName,
    count (a.accountid) AS account_count
FROM
    branches b
        LEFT JOIN
    accounts a ON b.branchid = a.branchid
GROUP BY b.branchID , b.branchname;*/

--  Display all branches and their account count, including branches that have more than 2 accounts.
/*select b.branchID, b.branchname, count(a.accountID) as TotalAccounts
from branches b 
left join accounts a 
on b.branchID = a.branchID
group  by b.branchID 
having TotalAccounts >2;*/
 
 -- after heaadaache
-- FULL OUTER JOIN

select * from customers c 
right join accounts a
on c.CustomerID = a.CustomerID;

/*CONCEPTS HERE->

/*1. Display customers who do not have a Current account.
2. Display Customername,Accountcreation date,Accounttype,Balancefor customers whose account was created in 2025.
3. Display:Customername,Accountcreation date,Accounttype and calculate the number of days since account creation.
4. Find the number of accounts held by each customer.
5. Find the total balance held by each customer.
6. Find the number of customers for each account type.
7. Find the total balance for each account type.
8. Find the highest balance held by each account type.
9. Find the number of customers for each branch.
10. Find customers whose total account balance is greater
than ₹40,000.
11. Find customers who have more than one account.
12. Find customers who do not have an account.
13. Find customers who do not have any loan.
14. Find customers who have never performed a transaction.
15. Display all branches and their account count, including
branches that have zero accounts.*/

-- 1. Display customers who do not have a Current account.
/*SELECT c.CustomerID, c.CustomerName
FROM Customers c
LEFT JOIN Accounts a ON c.CustomerID = a.CustomerID AND a.AccountType = 'Current'
WHERE a.AccountID IS NULL;*/
select * from customers;
select * from accounts;
SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Accounts
    WHERE AccountType = 'Current'
);
-- 11. find the customers who have more than one account.
select c.customerID, concat(c.firstname," ",c.lastname) as fullname,count(a.accountID) as TotalAccount
from customer c 
inner join accounts a 
on a.customerID = c.customerID
group by c.customerID having TotalAccounts > 1 ;
--  2. Display Customer name, Account creation date, Account type, Balance for customers whose account was created in 2025.
select * from customers;
SELECT CustomerID, FirstName, LastName, AccountCreationDate 
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Accounts
    WHERE AccountType = 'Current'
);

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50) NOT NULL,
ManagerID INT,
Department VARCHAR(50),
Salary DECIMAL(10,2),
JoiningDate DATE,
BranchID INT,

FOREIGN KEY(ManagerID)
REFERENCES Employees(EmployeeID),

FOREIGN KEY(BranchID)
REFERENCES Branches(BranchID)
);
select * from employees;
-- select * from branches;
desc employees;

INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 111),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 112),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 113),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 114),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 115),
    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 111),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 112),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 113),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 114),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 115),
    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 111),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 112),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 113),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 114),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 115),
    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 111),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 112),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 113),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 114),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 115);
    
    
 -- output EmplpoyeeID , EmployeeName,   instead of managerid they should report to rajesh sharma 
 -- SELF JOIN
 select * from employees;
 SELECT 
    e.Employeeid, e.EmployeeName, m.EmployeeName             -- AS employee, m.EmployeeName AS manager
FROM
    employees e
        LEFT JOIN 
    employees m 
    ON e.ManagerID = m.EmployeeID; 
    
    -- include branchname also
    select * from employees;
 SELECT 
    e.EmployeeID AS EmployeeName , E.EmployeeName, m.EmployeeName  AS Managers,
    b.BranchID,
    b.BranchName             
FROM
    employees e
        LEFT JOIN 
    employees m 
    ON e.ManagerID = m.EmployeeID
    inner join branches b
    on b.BranchID = e.BranchID
    order by employeeid asc;
    -- Find all the employuees who reports to Sneha Verma
    SELECT 
    e.EmployeeID, 
    e.EmployeeName, e.department, m.EmployeeName as ManagerName
FROM 
    employees e
    JOIN employees m 
    ON e.ManagerID = m.EmployeeID
WHERE 
    m.EmployeeName = "Sneha Verma";

-- Find all customers havging balance more than the average balance in the savings account.
select * from accounts;
select * from customers;
select avg(balance) from accounts
where accounttype = 'savings';

-- Find all customers havging balance more than the 20000 balance in the savings account.
select c.firstname,a.balance
from customers c 
join  accounts a
on c.customerid = a.customersid
where accounttype = 'savings';
    
    -- combining both qieries
    SELECT 
    c.customerid, c.firstname, AVG(a.balance) AS avgBalance
FROM
    customers c
        JOIN
    accounts a ON c.customerid = a.customerid
WHERE
    a.accounttype = 'savings'
GROUP BY c.firstname , c.customerid
HAVING avgbalance > 32000;
    -- where accounttype = 'savings'; 
    
    -- SUBQUERIES
    /* subquery is a function used in different sql staement written inside another sql statment
    such as SELECT INSERT UPDATE DELETE
    basically a query inside another query
    scalar/ single row subquery/single value
    multiple
    table
    correlated */
    select * from CUSTOMERs;
    -- SCALAR SUBQUERY ( ONLY RETURNS A SINGLE VALUE)
  --  find accountsids jitne avgbalance more than savings balance 
    select a.accountid, c.customerid, c.firstname
  from accounts a
  join customers c  ON c.customerid = a.customerid
  where balance > ( 
    select avg(balance) from accounts 
    where accounttype = "savings")
    and accounttype = "savings";
    
  -- ----------- --
  select accountid, customerid
  from accounts
  where balance > ( 
    select avg(balance) from accounts );
    -- --------- --
    
    -- Find the acount(s) having highest balance.
    select accountid, customerid, balance
    from accounts 
    where balance = (
    select max(balance) from accounts
    ); -- only returns single values
    
    -- Find customers whose year of birth is earlier than the average year of birth of all customers.
    -- myway
    select * from customers;
    select firstname, lastname, DateofBirth
    from customers
    where Year(DateofBirth) < ( 
    select avg(year(DateofBirth)) from customers);
    -- -------------------------- -- sir
    select * from customers;
    select firstname, lastname, DateofBirth,year(DateofBirth) as yearofbirth
    from customers
    where Year(DateofBirth) < ( 
    select floor (avg(year(DateofBirth))) from customers);
    
    
    -- 25 august 2026
    -- Multi row subquery
    -- 6. Find all customers who have taken at least one loan.
    select * from customers;
    select * from loans;
    select CustomerID, FirstName, Phone
    from Customers
    WHERE CustomerID IN (
    SELECT CustomerID FROM Loans);
    
    select * from accounts;
    -- 8. Find all customers who have at least one Savings account.
    select customerid,firstname, phone
    from customers
    where customerID in (
    select customerid from accounts where
    accounttype = 'Savings');

    select * from accounts; 
    
-- Find all customers who have an account in BranchID = 1.
select * from customers;
select * from accounts;
select customerid, FirstName, Phone
from customers
where customerid in (
select Customerid from accounts where BranchID = 111);

-- 11. Find all accounts whose balance is greater than any account in BranchID = 1.
-- ANY works like OR and ALL works like AND
select * from accounts;
-- select * from 
select accountid, balance
FROM accounts
WHERE balance > ANY 
(select accountid
 from accounts
where branchid = 111);

select accountid, balance
FROM accounts
WHERE balance > ALL
(select BALANCE
 from accounts
where branchid = 111);

/* 30000.00
9500.00
52000.00
50000.00*/

-- 61. Find the branch with the highest average account balance. in notmsl formula and using and alll as well
SELECT branchid, AVG(balance) AS avgbalance
FROM account
GROUP BY branchname
HAVING AVG(balance) = (
    SELECT MAX(avgbalance)
    FROM (
        SELECT AVG(balance) AS avgbalance
        FROM account
        GROUP BY branchname
    ) AS branches);
    
     -- 26-08-2026
    -- CORRELATED SUBQUERY
    /* One or more columns from the outer query 
    (it cannot execute independently and run once for each row of the outer query)*/
    
    
     -- 26-08-2026
    /*Find accounts whose balance is gretaer 
    than the avg balance of their respective branch*/
    
    select * from accounts;
    SELECT a.AccountID, a.Balance, a.BranchID
FROM accounts a
WHERE a.Balance > (
    SELECT AVG(a1.Balance)
    FROM Accounts a1
    WHERE a1.BranchID = a.BranchID
);
/* 85000.00	112
85000.00	114
85000.00	112
50000.00	113
52000.00	111
50000.00	111*/ 

   /* Find employee whose salary is greater than
   the average salary of their respective department.*/
    select * from employees;
    
    SELECT e.EmployeeName, e.Department, e.Salary
    FROM employees e
    WHERE e.salary > (
    SELECT AVG(e1.Salary)
    FROM Employees e1
    WHERE e1.Department = e.Department );   
   
   -- Find customers who have more than one accounts
    select * from customers;
    select * from accounts;
    SELECT c.CustomerID, c.FirstName, c.LastName
    FROM customers c
    WHERE( select count(*)
    from accounts a 
    where a.CustomerID = c.CustomerID ) > 1 ;
    
    -- 27-08-2026
 -- A Table subquery returns multiple rows and multiple columns
 -- It is used inside the FROM clause and behaves like a temporary table.
 -- THE SUBQUERY MUST HAVE AN ALIAS.
 
   -- Q. Find the avg account balance for each account type using the derived table-
   select * from accounts;
   SELECT AccountData.AccountType, AccountData.avg_Balance FROM 
   ( SELECT AccountType, AVG(Balance) as avg_Balance
   FROM accounts
   GROUP BY AccountType
   ) AccountData;
   
   -- Q 14: Display only those accounts whose avg balance is greater than ₹30000
    SELECT AccountData.AccountType, AccountData.avg_Balance FROM 
   ( SELECT AccountType, AVG(Balance) as avg_Balance
   FROM accounts
   GROUP BY AccountType
   ) AccountData
   WHERE AccountData.avg_Balance > 30000; 
   
   -- Find the top 3 customers based on their total account balance

select * from accounts;
SELECT AccountData.FirstName,AccountData.CustomerID,AccountData.TotalBalance FROM
(SELECT c.FirstName, c.CustomerID, sum(a.Balance) as TotalBalance
FROM accounts a
 JOIN customers c 
 ON a.CustomerID = c.CustomerID
GROUP BY CustomerID) as AccountData  
ORDER BY AccountData.TotalBalance DESC LIMIT 3;   

-- SUBQUERY INSIDE SELECT CLAUSE
   -- dISPLAY each customer along with the no. of accounts they have
  select * from accounts;
  SELECT c.CustomerID,
(SELECT COUNT(*) -- (*) used for single value because scalar value
FROM accounts a
WHERE  c.CustomerID = a.CustomerID 
)AS TotalAccounts from Customers c
ORDER BY TotalAccounts desc ;
 
 -- SUBQUERIES INSIDE UPDATE CLAUSE
 
 /* update
 Increase the balance of accounts belonging to customers
 who have taken a loan by 5% */
 
   select * from accounts;
   select * from loans;
   
   UPDATE accounts SET balance = balance + balance*0.05 -- 31,000
   WHERE customerid IN (
     select customerid FROM Loans -- this is multiple subquery 
     );
   select * from accounts;
   