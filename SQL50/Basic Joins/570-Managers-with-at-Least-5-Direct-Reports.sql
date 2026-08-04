SELECT E2.name
FROM Employee E1
JOIN Employee E2
ON E1.managerID = E2.id
GROUP BY E1.managerID 
HAVING COUNT(E1.managerID) >= 5;