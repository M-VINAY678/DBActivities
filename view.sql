show databases;
use db;
create table Categories(CategoryID int primary key,CategoryName varchar(100));

create Table Products(
ProductID int primary key,
ProductName varchar(100),
CategoryID int,
Price decimal,
StockQuantity int,
foreign key(CategoryID) references Categories(CategoryID)
);
create view ProductDetails as (select ProductID,ProductName,CategoryName,Price from Products join Categories using(CategoryID)) ;
create or replace view ProductDetails as (select ProductID,ProductName,CategoryName, StockQuantity,Price from Products join Categories using(CategoryID));
Describe ProductDetails;