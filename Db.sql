
use  db;
CREATE TABLE Employees(EmployeeID int primary key, FirstName varchar(50) NOT NULL, LastName varchar(50) NOT NULL, HireDate DATE , Department varchar(50));
DESCRIBE Employees;
ALTER TABLE Employees ADD Salary varchar(100);
ALTER TABLE Employees modify Department varchar(100);
Describe Employees;
Drop  TABLE Employees;
SHOW TABLES;
