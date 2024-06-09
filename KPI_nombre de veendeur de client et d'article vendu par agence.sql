
-- vérification de du contenu de mes tables
use toys_and_models;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM Employees;
SELECT * FROM offices;

-- requete pour afficher le nombre de vendeur, de client et d'article vendu par agence
SELECT offices.city as Agence , COUNT(distinct Employees.lastName) AS nombre_vendeur, COUNT(distinct customerName) AS nombre_client, SUM( quantityOrdered) AS nombre_article_vendu, 
round((SUM( quantityOrdered)/COUNT(distinct Employees.lastName))) as Vente_moy_arcticle_client
FROM offices
LEFT JOIN employees ON offices.officeCode = employees.officeCode
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
WHERE  quantityOrdered  IS NOT null and `status` != 'cancelled'
GROUP BY  offices.officeCode

;