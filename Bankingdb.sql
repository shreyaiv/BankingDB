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
 

  
 
  
  
  