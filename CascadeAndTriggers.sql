show databases;
use db;

create Table Departments(
DepartmentID Int primary key,
DepartmentName varchar(100)
);


drop table Employees;
create Table Employees(
EmployeeID int Primary Key,
EmployeeName varchar(100),
DepartmentID int,
foreign key(DepartmentID) references Departments(DepartmentID) on delete cascade 
);


Insert into Departments values (1,"IT"),(2,"Hr"),(3,"sales");
select * from Departments;
Insert into Employees values(101,"vinay",1),(102,"vijay",2),(103,"vishal",3),(104,"vikas",2),(105,"vignesh",1);
select * from Employees;
delete from Departments where DepartmentID=2;
select * from Employees;


drop table AuditLog;
create table AuditLog(
AuditID int auto_increment primary key, 
EmployeeID int,
OldDepartmentID int,
NewDepartmentId int,
ChangeDate timestamp
);


drop trigger Trigger_AuditLog;
Delimiter $$
create   trigger Trigger_AuditLog after update on Employees 
for each row
Begin
 Insert into AuditLog (EmployeeID, OldDepartmentID,NewDepartmentID,ChangeDate) values (old.EmployeeID, old.DepartmentID,new.DepartmentID,now());
End  $$

Delimiter ;
select * from Employees;
Update Employees  set DepartmentID=2  where EmployeeID=101;
ALTER TABLE Employees
DROP FOREIGN KEY Employees_ibfk_1;
ALTER TABLE Employees
ADD CONSTRAINT Employees_ibfk_1
FOREIGN KEY (DepartmentID) 
REFERENCES Departments(DepartmentID)
ON DELETE CASCADE
ON UPDATE CASCADE;
show create Table Employees;
select * from Departments;
insert into Departments values(2,"HR");

select * from AuditLog;
