SELECT Department, Employee, Salary
FROM (SELECT Department.name AS Department, Employee.name AS Employee, DENSE_RANK() OVER (PARTITION BY Department.name ORDER BY salary DESC) AS Number, salary
FROM Employee
JOIN Department
ON Employee.departmentId = Department.id) AS number_top
WHERE Number <=3;