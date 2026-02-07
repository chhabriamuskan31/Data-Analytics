CREATE schema IF NOT EXISTS sales;
CREATE schema IF NOT EXISTS employee;
CREATE database IF NOT EXISTS finance;
USE sales;

CREATE Table sales(Oder_ID INT NOT NULL primary key auto_increment, 
Order_Date date NOT NULL, 
Customer_ID INT, 
Product_ID varchar(5), 
Sales DECIMAL(10,2),
Foreign Key(Customer_ID) references customer(Customer_ID) ON DELETE CASCADE
);

drop table sales;

CREATE Table customer(Customer_ID INT primary key, 
Customer_Name Varchar(100), 
Segment varchar(50), 
City Varchar(30));

insert into customer (Customer_ID, Customer_Name, Segment, City, Email) 
values(123, "Muskan", "Retail", "Mumbai", "muskanabc@gmail.com");

select * from customer;

#ALTER Table customer add UNIQUE KEY(Email);
ALTER Table customer modify Email Varchar(100) UNIQUE KEY;

ALTER Table customer add No_of_complaints INT default 0;