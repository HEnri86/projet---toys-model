-- nombre de vendeur par office*
USE toys_and_models;
SELECT  offices.city AS Agence,  COUNT(distinct Employees.lastName) AS nb_vendeur
FROM offices
LEFT JOIN employees ON offices.officeCode = employees.officeCode
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE  quantityOrdered  IS NOT null and `status` != 'cancelled' and  jobTitle = 'Sales Rep'
GROUP BY  offices.officeCode
;

