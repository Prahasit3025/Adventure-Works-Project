-- total sales
SELECT sum(SalesAmount) as Total_Sales from sales;

-- total profit
select sum(profit) as Total_Profit from sales;

-- table for month and sales
SELECT 
    OrderdateMonthName AS Month,
    sum(SalesAmount) as sales
FROM 
    Sales
GROUP BY 
    OrderdateMonthName
ORDER BY 
    MIN(OrderdateMonthNo);

-- yearwise sales
SELECT 
    OrderDateYear AS Year,
    sum(SalesAmount) AS Total_Sales
FROM 
    Sales
GROUP BY 
    OrderDateYear
ORDER BY 
    OrderDateYear;
    
-- 

SELECT 
    OrderdateQuarter AS Quarter,
    SUM(SalesAmount) AS Sales
FROM 
	Sales
GROUP BY 
	OrderdateQuarter;
