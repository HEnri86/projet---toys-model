-- combien de client par office ,par employees
-- vérification de du contenu de mes tables
use toys_and_models;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM Employees;
SELECT * FROM offices;

-- requete pour afficher le nombre total  de client par agence et par année
SELECT year(orderDate), offices.city as Agence
, COUNT(distinct customerName) AS nb_client
FROM offices
LEFT JOIN employees ON offices.officeCode = employees.officeCode
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE  quantityOrdered  IS NOT null and `status` != 'cancelled'
GROUP BY year(orderDate), offices.officeCode

;