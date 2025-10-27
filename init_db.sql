-- Initialization script for bank database

-- Suppose this script in store in init_db.sql file
-- To exicute this script in Windows:- "@C:\PATH\init_db.sql"
-- To exicute this script in Linax/MacOS:- "@/PATH/init_db.sql"

DROP TABLE borrower;
DROP TABLE depositor;
DROP TABLE loan;
DROP TABLE account;
DROP TABLE customer;
DROP TABLE branch;

CREATE TABLE branch(
	branch_name VARCHAR2(30) not null,
	branch_city VARCHAR2(30) not null,
	assets NUMBER(30,2) not null,
	CONSTRAINT branch_pk PRIMARY KEY (branch_name)
);

CREATE TABLE customer(
	customer_name VARCHAR2(30) not null,
	customer_street VARCHAR2(30),
	customer_city VARCHAR2(30) not null,
	CONSTRAINT customer_pk PRIMARY KEY (customer_name)
);

CREATE TABLE account(
	account_number VARCHAR2(10) NOT NULL,
	branch_name VARCHAR2(30) NOT NULL,
	balance NUMBER(30,2) NOT NULL,
	CONSTRAINT account_pk PRIMARY KEY (account_number),
	CONSTRAINT fk_branch_name_account FOREIGN KEY (branch_name) REFERENCES branch (branch_name)
);

CREATE TABLE loan(
	loan_number VARCHAR(10) NOT NULL,
	branch_name VARCHAR(30) NOT NULL,
	amount NUMBER(30,2),
	CONSTRAINT loan_pk PRIMARY KEY (loan_number),
	CONSTRAINT fk_branch_name_loan FOREIGN KEY (branch_name) REFERENCES branch (branch_name)
);

CREATE TABLE depositor(
	customer_name VARCHAR(30) not null,
	account_number VARCHAR(10) NOT NULL,
	CONSTRAINT customer_name_fk_depositor FOREIGN KEY (customer_name) REFERENCES customer (customer_name),
	CONSTRAINT acoount_number_fk_depositor FOREIGN KEY (account_number) REFERENCES account (account_number)
);

CREATE TABLE borrower(
	customer_name VARCHAR(30) not null,
	loan_number VARCHAR(10) NOT NULL,
	CONSTRAINT customer_name_fk_borrower FOREIGN KEY (customer_name) REFERENCES customer (customer_name),
	CONSTRAINT loan_number_fk_borrower FOREIGN KEY (loan_number) REFERENCES loan (loan_number)
);

INSERT INTO branch VALUES('Brighton','Brooklyn',7100000);
INSERT INTO branch VALUES('Downtown','Brooklyn',9000000);
INSERT INTO branch VALUES('Mianus','Horseneck',400000);
INSERT INTO branch VALUES('North Town','Rye',3700000);
INSERT INTO branch VALUES('Perryridge','Horseneck',1700000);
INSERT INTO branch VALUES('Pownal','Bennington',300000);
INSERT INTO branch VALUES('Redwood','Palo Alto',2100000);
INSERT INTO branch VALUES('Round Hill','Horseneck',9000000);

INSERT INTO customer VALUES('Adam','Spring','Pittsfield');
INSERT INTO customer VALUES('Brooks','Senator','Brooklyn');
INSERT INTO customer VALUES('Curry','North','Rye');
INSERT INTO customer VALUES('Glenn','Sand Hill','Woodside');
INSERT INTO customer VALUES('Green','Walnut','Stamford');
INSERT INTO customer VALUES('Hayes','Main','Harrison');
INSERT INTO customer VALUES('Jhonson','Alma','Palo Alto');
INSERT INTO customer VALUES('Jones','Main','Harrison');
INSERT INTO customer VALUES('Lindsay','Park','Pittsfield');
INSERT INTO customer VALUES('Smith','North','Rye');
INSERT INTO customer VALUES('Turner','Putnam','Stamford');
INSERT INTO customer VALUES('Williams','Nassau','Princeton');
INSERT INTO customer VALUES ('Jackson', 'Main', 'Brooklyn');
INSERT INTO customer VALUES ('Johnson', 'Nassau', 'Woodside');

INSERT INTO account VALUES('A-101','Downtown',500);
INSERT INTO account VALUES('A-102','Perryridge',400);
INSERT INTO account VALUES('A-201','Brighton',900);
INSERT INTO account VALUES('A-215','Mianus',700);
INSERT INTO account VALUES('A-217','Brighton',750);
INSERT INTO account VALUES('A-222','Redwood',700);
INSERT INTO account VALUES('A-305','Round Hill',350);

INSERT INTO loan VALUES('L-11','Round Hill',900);
INSERT INTO loan VALUES('L-14','Downtown',1500);
INSERT INTO loan VALUES('L-15','Perryridge',1500);
INSERT INTO loan VALUES('L-16','Perryridge',1300);
INSERT INTO loan VALUES('L-17','Downtown',1000);
INSERT INTO loan VALUES('L-23','Redwood',2000);
INSERT INTO loan VALUES('L-93','Mianus',500);

INSERT INTO depositor VALUES('Hayes','A-102');
INSERT INTO depositor VALUES('Johnson','A-101');
INSERT INTO depositor VALUES('Johnson','A-201');
INSERT INTO depositor VALUES('Jones','A-217');
INSERT INTO depositor VALUES('Lindsay','A-222');
INSERT INTO depositor VALUES('Smith','A-215');
INSERT INTO depositor VALUES('Turner','A-305');

INSERT INTO borrower VALUES('Adam','L-16');
INSERT INTO borrower VALUES('Curry','L-93');
INSERT INTO borrower VALUES('Hayes','L-15');
INSERT INTO borrower VALUES('Jackson','L-14');
INSERT INTO borrower VALUES('Jones','L-17');
INSERT INTO borrower VALUES('Smith','L-11');
INSERT INTO borrower VALUES('Smith','L-23');
INSERT INTO borrower VALUES('Williams','L-17');
