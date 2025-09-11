use db;
show tables;
create Table Department(DepartmentID Int, month varchar(50), totalSalaryPerDepartment int);
INSERT INTO Department (DepartmentID, Month, totalSalaryPerDepartment)
VALUES
(10, 'Jan', 9300),
(10, 'Feb', 9700),
(10, 'Mar', 9500),
(10, 'Apr', 9900),
(20, 'Jan', 12300),
(20, 'Feb', 12500),
(20, 'Mar', 12400);
select * from Department;
select DepartmentID,month, 
Avg(totalSalaryPerDepartment) over (partition by DepartmentID
   rows between 2 preceding and current row ) as MovingAvgSalary from Department;

show tables;

CREATE TABLE EmployeesForWindowFunction (
    EmployeeID INT PRIMARY KEY,
    HireDate DATE,
    DepartmentID INT
);
INSERT INTO EmployeesForWindowFunction (EmployeeID, HireDate, DepartmentID)
VALUES (1, '2020-01-15', 10),
(2, '2020-02-20', 10),
(3, '2020-03-10', 10),
(4, '2020-04-05', 10),
(5, '2020-01-25', 20),
(6, '2020-02-18', 20),
(7, '2020-03-22', 20);

select E.*, 
Rank() over (partition by DepartmentID order by HireDate) as RankByHireDate ,
row_number() over (partition by DepartmentId order by HireDate) as RowNumber
from EmployeesForWindowFunction E;

drop table EmployeesForWindowFunction;
drop table Department;