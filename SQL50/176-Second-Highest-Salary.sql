SELECT MAX(salary) AS SecondHighestSalary
FROM Employee E1
CROSS JOIN (SELECT MAX(salary) AS max_salary
FROM Employee) AS e_max
WHERE max_salary != salary;