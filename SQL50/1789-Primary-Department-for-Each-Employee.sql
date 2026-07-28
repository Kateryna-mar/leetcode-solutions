SELECT E2.employee_id, E1.department_id
FROM Employee E1
JOIN (SELECT employee_id, department_id, COUNT(department_id) AS count_dep
FROM Employee
GROUP BY employee_id) E2
ON E1.employee_id = E2.employee_id
WHERE (count_dep > 1 AND primary_flag = 'Y') OR (count_dep = 1 AND primary_flag = 'N');