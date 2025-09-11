use db;
show tables;
create Table EmployeesForFunctions(
EmployeeID int Primary Key,
EmployeeName varchar(100),
monthly_salary int);

Insert into EmployeesForFunctions values(101,"vinay",10000),(102,"vijay",20000),(103,"vishal",30000),(104,"vikas",20000),(105,"vignesh",10000);
Delimiter $$
create procedure GetEmployeeDetails (IN empID int )
Begin
   select * from EmployeesForFunctions where EmployeeID=empID;
End;
$$
Delimiter ;
call GetEmployeeDetails(101);

Delimiter $$
create function CalculateAnnualSalary(monthlySalary int)
Returns int
deterministic
Begin
   Return monthlySalary*12;
End$$
Delimiter ;

select EmployeeID,EmployeeName,monthly_salary,CalculateAnnualSalary(monthly_salary) as Annual_salary from EmployeesForFunctions;

