SELECT unique_id, name
FROM Employees as E1
LEFT JOIN EmployeeUNI as E2
ON  E1.id = E2.id;