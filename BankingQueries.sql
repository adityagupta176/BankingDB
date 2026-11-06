 SHOW databases; 
 create database bankingDB;
 use bankingDB;
 
   create table customers (
   CustomerID INT,
   firstname varchar(50),
   lastname  varchar(50),
   email varchar(100),
   phone varchar(10)
   );
	desc customers;
	alter table customers add constraint pk_customer_id primary key ( CustomerID);
	select * from customers;
	alter table customers add AccountCreation date;
	alter table customers modify phone varchar(20);
	alter table customers add DateofBrith date;
    alter table customers modify FirstName varchar(50) not null ;
    alter table customers add constraint uk_Email unique(Email);
    alter table customers alter column lastname set default "NA" ;
 create table Accounts (
 AccountID INT ,
 AccountType varchar(20),
 Balance decimal(10,2)
 );
 desc accounts ;
 alter table accounts add constraint pk_accountI_ID primary key ( accountID);
 alter table accounts add constraint chk_MinBalance check ( Balance >= 1000);
 alter table Accounts add customerID int;
 alter table Accounts add constraint FK_Accouont_customers foreign key (CustomerID) references customers(CustomerID);
 alter table accounts add branchID int ;
  alter table Accounts add constraint FK_Branch_ID foreign key (branchID) references Branches (branchID);
 show tables ;
select * from Accounts ;
	create	table Transactions (
	TransactionsId int ,
	transactionsDate date,
	Amount decimal(10,2),
	TransactionType varchar(20)
	);
	desc transactions ;
	alter table transactions add constraint pk_Transactionid primary key ( transactionsId );
    alter table transactions add Accountid int ;
    alter table transactions add 
    constraint FK_accountid foreign key (AccountID)
    references accounts(AccountID);
	select * from Transactions ;
create table Branches (
branchID int,
BranchName varchar(100),
BranchAdress varchar(200),
BranchPhone varchar(15)
);
desc branches ;
alter table branches  add constraint pk_branchid primary key ( branchID);
	create table AccountBranches (AssignmentDate date);
	drop table accountbranches;
	desc accounts;
create table loans (
LoanID int ,
LoanAmount Decimal(10,2),
intrestrate Decimal(5,2),
StartDate date,
EndDate date 
);
        desc loans;
        alter table loans 
        add constraint pk_loanid primary key (LoanID);
        alter table loans add CustomerID int;
        alter table loans 
        add constraint FK_customerid foreign key (CustomerID) 
        references customers(CustomerID);
        alter table loans
        drop column Accountid ;
        alter table loans 
        drop	foreign key FK_customerid;
        alter table loans 
        add constraint FK_loans_customers
        foreign key(CustomerID)
        references customers(CustomerID);
        

select * from KYC ;
desc KYC;
drop table KYC;
create table KYC (
KycID int primary key,
AdhaarNo varchar(12) not null,
PanNO varchar(10) not null,
CustomerID int not null,
constraint fk_Customers
foreign key (CustomerID) references customers(CustomerID)
);
show create table kyc;

select
constraint_name,
constraint_type
from information_schema.table_constraints
where table_schema = 'bankingdb'
and table_name = 'kyc';

insert into customers
values 
('101','aditya','gupta','adtia@gamial.com','7894561230','2024-12-23','12-5-12');
insert into customers
(customerid,firstname,lastname,email,phone,AccountCreation,DateofBrith)
values 
('102','aditya','gupta','aaadtia@gamial.com','7894561230','2024-12-23','12-5-12');
insert into customers
values
('103','aryan','gupta ','aryan@gamil.com','4563217890','2026-5-15','12-02-15'),
('104','swatik ','shende','swastik@gamil.com','1236547890','2026-5-4','12-02-16');
insert into customers 
values
('105','karan','gupta','karan@gamail.com','7532149621','2026-3-5','12-05-14');

select*from customers;

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

INSERT INTO accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);
INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);
select * from loans;
update customers
set email='alock90@gmail.com'
where customerID = 102;
select * from customers;
update customers
set lastname='lokhnde'
where customerID='105';
update branches
set BranchAdress='Civil lines, Nagpur',
BranchPhone='1236478956'
where branchID= 1;
insert into kyc
values
('1','844658815712','7894ASD45','101'),
('2','456897454545','4564ASD45','102'),
('3','123975451234','3694ASD45','103');
delete from kyc where kycID=2;
select * from kyc;
select * from accounts;
select customerID from accounts;
select*from accounts
where Balance > 40000;
-- for show accountID , Blance, customerid etc .
select  AccountID , Balance ,customerID , AccountType from accounts
where AccountType = 'Current';
select*from accounts
where Balance < 20000;
-- find info customerID = 104 
select*from customers
where CustomerID = 104;
-- find all account having saving account and blance >20000
SELECT *FROM accounts
WHERE AccountType = 'Savings'AND Balance > 20000;
SELECT *FROM accounts
WHERE AccountType = 'Current' OR Balance > 20000;
-- useing NOT.
select * from accounts 
where AccountType != 'Savings';
select * from accounts 
where AccountType <> 'Savings';
select * from accounts 
where not AccountType = 'Savings';
select * from loans ;
select * from loans
where intrestrate = 8.5 or intrestrate= 9.0;
-- Useing of IN 
select * from loans 
where intrestrate in (8.5,9.0);
-- use of betweem 
select * from loans 
where intrestrate between 7.5 and 8.5 ;
select * from loans 
where LoanAmount between 200000 and 250000 ;
select * from accounts
where Balance between 20000 and 60000 ;
select * from accounts
where Balance between 20000 and 60000 AND AccountType = 'current';
select*from customers;
-- useing LIKE opretor 
-- search from ending .
select * from customers
where lastname like '%a';
-- search from starting.
select * from customers
where FirstName like '%a_____';
-- useing of order .
select * from accounts 
order by Balance desc;
select * from accounts 
order by Balance desc ,customerID desc;














