USE AdventureWorks2019
BEGIN TRANSACTION
DELETE FROM HumanResources.Department WHERE HumanResources.Department.DepartmentID % 2 = 0 AND HumanResources.Department.DepartmentID > 15
DECLARE @myInt AS INT
SET @myInt = (SELECT COUNT(*) FROM HumanResources.Department AS COUNT )

IF @myInt = 16
BEGIN
	UPDATE HumanResources.Department
	SET DepartmentID = 999
	ROLLBACK;
END
ELSE 
BEGIN
	UPDATE HumanResources.Department 
	SET DepartmentID = 999 WHERE HumanResources.Department.Name LIKE '%Execut'
	DELETE FROM HumanResources.Department WHERE Name LIKE '%1%'
	COMMIT
END
SELECT A.GroupName FROM HumanResources.Department AS a GROUP BY a.GroupName 
SELECT * FROM HumanResources.Employee AS e WHERE (SUM(e.VacationHours) > 40 AND  e.SickLeaveHours BETWEEN 20 AND 44) OR e.OrganizationLevel IN ( 1, 3)
SELECT * FROM HumanResources.Employee AS e HAVING E.BirthDate > '2000' ORDER BY e.JobTitle
SELECT * FROM Production.ProductInventory AS a LEFT JOIN Sales.SalesOrderDetail AS b ON a.ProductID = b.ProductID
SELECT * FROM Production.ProductInventory AS a INNER JOIN Sales.SalesOrderDetail AS b ON a.ProductID =b.ProductID
SELECT * FROM Production.Product AS a FULL JOIN Sales.SalesOrderDetail AS b ON a.ProductID =b.ProductID

--1
SELECT * FROM Sales.Customer
--2
SELECT * FROM Sales.Store as  c ORDER BY c.Name ASC
--3
SELECT TOP 10 * FROM HumanResources.Employee as c where c.BirthDate < '1989-09-28'
--4
SELECT e.NationalIDNumber, e.LoginID, e.JobTitle FROM HumanResources.Employee AS e WHERE e.LoginID like '%0' ORDER BY e.JobTitle DESC
--5
SELECT * FROM Person.Person  AS  p WHERE YEAR(p.ModifiedDate) = YEAR('2008') AND p.MiddleName IS NOT NULL AND p.Title IS  NULL
--6
SELECT DISTINCT d.Name FROM HumanResources.Department AS d FULL JOIN  HumanResources.EmployeeDepartmentHistory AS e ON d.DepartmentID = e.DepartmentID WHERE e.EndDate IS NOT NULL 
--7
SELECT s.CommissionPct FROM Sales.SalesPerson AS s WHERE s.CommissionPct != 0 GROUP BY s.TerritoryID , s.CommissionPct 
--8
SELECT TOP 10 * FROM HumanResources.Employee AS h ORDER BY h.VacationHours DESC
--9
SELECT * FROM HumanResources.Employee AS h WHERE  h.JobTitle = 'Sales Representative' OR h.JobTitle = 'Network Administrator' OR h.JobTitle = 'Network Manager' 
--10
SELECT * FROM HumanResources.Employee AS a FULL JOIN Purchasing.PurchaseOrderHeader AS B ON A.BusinessEntityID = B.EmployeeID