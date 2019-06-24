--1
--"���� �볺���" ����쳺���� �� � �� ������� ����������
select distinct(Customers.CustCity) from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID;
--�� �볺��� 
select distinct(Customers.CustCity) from Customers;

--2--
select EmpFirstName, EmpLastName, EmpPhoneNumber from Employees;

--3
--"���������" ����쳺���� �� � �� ����������� � ������� ������
select distinct(Products.CategoryID), Categories.CategoryDescription from Products inner join Categories on Products.CategoryID=Categories.CategoryID;
--�� �������
select distinct(Categories.CategoryDescription) from Categories;

--4
--"����������" ����쳺���� ������ �� ����� ���� �������� 
select distinct(Products.ProductName), Products.RetailPrice, Products.CategoryID from Orders 
inner join Order_Details on Orders.OrderNumber=Order_Details.OrderNumber 
left join Products on Products.ProductNumber=Order_Details.ProductNumber where Orders.ShipDate is not null;
--�� ��������
select ProductName, RetailPrice, CategoryID from Products;

--5--
select VendName from Vendors order by VendZipCode;

--6--
select EmpFirstName, EmpLastName, EmpPhoneNumber, EmployeeID  from Employees order by EmpFirstName, EmpLastName;

--7--
select VendName from Vendors;

--8
--"���� �볺���" ����쳺���� �� � �� ������� ����������
select distinct(Customers.CustState) from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID;
--�� �볺���
select distinct(CustState) from Customers;

--9--
--"�������" ����쳺���� �� ������� ���������� �� �� ������
select Products.ProductName, Products.RetailPrice from Products inner join Order_Details on Products.ProductNumber=Order_Details.ProductNumber group by Products.ProductName, Products.RetailPrice; 
--�� ��������
select ProductName, RetailPrice from Products; 

--10--
select * from Employees;

--11--
--1� ������� �������: "���� ����������" - ����쳺���� �� � �� ����� �� ����� ������ (��� ���� ����� �� ����� ������, ������� ����� ���� ����������)
--2� ������� �������: "����� ��� ����������, � ����� �� �������� � ������� ���" - ����쳺���� �� � � ����� ��� ����������� ���� �볺���
select VendCity, VendName from Vendors inner join Product_Vendors on Vendors.VendorID=Product_Vendors.VendorID 
inner join Order_Details on Order_Details.ProductNumber=Product_Vendors.ProductNumber
inner join Orders on Order_Details.OrderNumber=Orders.OrderNumber
inner join Customers on Customers.CustomerID=Orders.CustomerID
group by VendCity, VendName;

--12--
select Order_Details.OrderNumber,  Max(Product_Vendors.DaysToDeliver) Max_days_to_deliver from Product_Vendors inner join Order_Details on Product_Vendors.ProductNumber=Order_Details.ProductNumber
group by Order_Details.OrderNumber;

--13--
select ProductNumber, RetailPrice * QuantityOnHand as Stock_price from Products;

--14--
SELECT OrderNumber, ABS(DATEDIFF(day, ShipDate, OrderDate)) as NumberOfDays FROM Orders;

--1 till 10000--
WITH CTE1 as (SELECT 1 as Item  union all SELECT Item +1 FROM CTE1 where Item<10000)
SELECT * FROM CTE1 option (maxrecursion 0);

--Suturday, Sunday in 2019--
WITH CTE2 (D, name) as (SELECT CAST('20190101' AS DATE) D, DATENAME(WEEKDAY, '20190101') UNION ALL SELECT DATEADD(DAY, 1, D), DATENAME(WEEKDAY, DATEADD(DAY, 1, D)) FROM CTE2 WHERE D<'20191231'),
CTE3 AS (SELECT D, name FROM CTE2 WHERE name IN ('Saturday','Sunday'))
SELECT COUNT(*) FROM CTE3 OPTION (maxrecursion 367);
