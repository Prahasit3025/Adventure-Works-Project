use adventure;

select * from customer;
select * from product;
select * from date;
select * from territory;


/* Total Customers */
SELECT count(CustomerKey) as Total_Customer from customer;

/* Total Cost */
SELECT sum(Unitprice) as Total_cost from product;

/* Total Yearly Income */
SELECT SUM(YearlyIncome) AS Total_Yearly_Income
FROM customer;
/* total orders */
select sum(OrderQuantity) as Total_qty from sales;

/* Sub Queries ----- */
/* Yearly average income by customer */
SELECT CustomerKey, FullName, YearlyIncome
FROM customer
WHERE YearlyIncome > (SELECT AVG(YearlyIncome) 
                      FROM customer);
/* avg stock level by products */
SELECT ProductKey, ProductName, SafetyStockLevel
FROM product
WHERE SafetyStockLevel < (
    SELECT AVG(SafetyStockLevel)
    FROM product
);


 /* total sales and cosy by months */                           
SELECT  s.OrderdateMonthName AS Month, SUM(s.SalesAmount) AS Total_SalesAmount, SUM(s.Productioncost) AS Total_ProductionCost
FROM  sales s
GROUP BY s.OrderdateMonthName
ORDER BY s.OrderdateMonthName;
    

/* monthwise sales */
SELECT OrderDateMonthName AS Month, sum(SalesAmount) AS Total_Sales
FROM Sales
GROUP BY OrderDateMonthName
ORDER BY OrderDateMonthName;

/* quarterwise sales */
SELECT OrderdateQuarter AS Month, sum(SalesAmount) AS Total_Sales
FROM Sales
GROUP BY OrderdateQuarter
ORDER BY OrderdateQuarter;






/*
SELECT CustomerKey, FullName, NumberCarsOwned
FROM customer
WHERE GeographyKey = (
                      SELECT GeographyKey
                      FROM territory
					  WHERE SalesTerritoryRegion = 'East'
                      ) AND NumberCarsOwned > 2;*/
                      
