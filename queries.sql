-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productName as Product
, c.categoryName as Category
FROM [Products] as p
join Categories as c on p.categoryId = c.categoryId


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id
, o.orderDate
, s.companyName
from [order] as o
join shipper as s on o.shipvia = s.id
where o.orderDate < ‘2012-08-09’;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o.orderId
,p.productName
, o.quantity
FROM [OrderDetails] as o
join products as p on o.productId = p.productId
where o.orderId = 10251
order by p.productName


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.orderId
, c.customerName as Customer
, e.lastname as EmployeeLastName
from orders as o
join customers as c on o.customerId = c.customerId
join employees as e on o.employeeId = e.employeeId