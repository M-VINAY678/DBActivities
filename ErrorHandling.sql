use db;
show tables;
select * from EmployeesForFunctions;
drop function annual_salary;
show function status;
Delimiter $$
create function annual_salary(empID int) 
Returns int
Deterministic
Begin
   Declare annualSalary Int;
   Declare continue handler for NOT FOUND
   Begin
      set annualSalary=null;
   End;
   select (monthly_salary*12) into annualSalary from EmployeesForFunctions where EmployeeId=empID;
   return annualSalary;
End;$$
Delimiter ;
select annual_salary(10001) as "Annual Salary";
