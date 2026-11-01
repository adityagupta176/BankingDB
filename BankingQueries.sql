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
from information_schema.table_constriants
where table_schema = 'bankingdb'
and table_name = 'kyc';
        





     