CREATE TABLE ICICI_Customer_Registration (
	c_id INT auto_increment unique not null,
	Full_Name VARCHAR ( 50 ),
	Acc_Num VARCHAR ( 20 ),
	Pan_Card VARCHAR ( 15 ),
	Email_id VARCHAR ( 25 ) unique,
	Mobile_Num VARCHAR ( 10 ),
	Balance float,
	Address VARCHAR ( 150 ),
	Password_ VARCHAR ( 15 ),
CONSTRAINT pk_icr PRIMARY KEY ( Acc_Num ))engine=INNODB;

create table ICICI_Transactions(s_id int auto_increment, FromAcc varchar(20), ToAcc varchar(20), Transcation_Date timestamp default current_timestamp, Remarks varchar(30), Amount_Withdraw varchar(10), Deposite_Amount varchar(10), constraint pk_stm primary key (s_id), constraint fk_stm foreign key(FromAcc) references ICICI_Customer_Registration(Acc_Num))engine=INNODB;

create table ICICI_Debit_Card(debit_card_id int auto_increment unique not null, Account_Number varchar(20),Full_Name varchar(50), Debit_Card_Number varchar(20), Valid_From varchar(5),Valid_Thru varchar(5), CVV varchar(3), Pin varchar(8), constraint fk_dbtcrd foreign key(Account_Number) references ICICI_Customer_Registration(Acc_Num))engine=INNODB;

insert into ICICI_Customer_Registration(Full_Name, Acc_Num, Pan_Card, Email_id, Mobile_Num, Address,Password_) values("Ishwar Dadasaheb Mohan", "60410110000651", "EHCPM9169R","ishwar@gmail.com","8888679062", "Pune, MH", "Ishwar@123");

insert into ICICI_Debit_Card(Account_Number, Full_Name, Debit_Card_Number, Valid_From, Valid_Thru, CVV, Pin) values("60410110000651", "Ishwar Dadasaheb Mohan", "7312 2384 9164", "12/22", "04/27","036", "2356");

insert into ICICI_Debit_Card(Account_Number, Full_Name, Debit_Card_Number, Valid_From, Valid_Thru, CVV, Pin) values("1151034856", "Deepak Tiwari", "9156 5285 3614", "05/22", "27/30","25","6945");

drop table ICICI_Customer_Registration;
drop table ICICI_Transactions;
drop table ICICI_Debit_Card;

create table ICICI_Admin(admin_id int auto_increment unique not null, admin_userId varchar(20), admin_password varchar(15)) engine=INNODB;

insert into ICICI_Admin(admin_userId, admin_password) values ("Ishwar", "Ishwar@25");

update ICICI_Customer_Registration set Balance = 10000.00 where Mobile_Num = "8451258963";

select * from ICICI_Customer_Registration;
select * from ICICI_Transactions;
select * from ICICI_Debit_Card;

select * from ICICI_Customer_Registration inner join ICICI_Debit_Card on Acc_Num = Account_Number;

ALTER TABLE ICICI_Admin 
ADD COLUMN is_Active VARCHAR ( 5 ) DEFAULT 'Y',
ADD COLUMN created_by VARCHAR ( 30 ),
ADD COLUMN created_date date,
ADD COLUMN modified_by VARCHAR ( 30 ),
ADD COLUMN modified_date date;