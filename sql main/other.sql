-- Top 10 Customers

SELECT 
    Customerfullname AS Customer,
    SUM(SalesAmount) AS TotalSales
FROM
    Sales
GROUP BY 
    Customerfullname
ORDER BY 
    TotalSales DESC
LIMIT 10;

-- Yearly Profit Margin

SELECT 
    OrderDateYear AS Year,
    SUM(Profit) AS TotalProfit,
    SUM(SalesAmount) AS TotalSales,
    (SUM(Profit) / SUM(SalesAmount)) * 100 AS ProfitMargin
FROM 
    Sales
GROUP BY 
    OrderDateYear
ORDER BY 
    Year;

-- Products with Low Sales Performance(<10000)

SELECT 
    ProductName AS Product,
    SUM(SalesAmount) AS TotalSales
FROM 
    Sales
GROUP BY 
    ProductName
HAVING 
    TotalSales < 10000
ORDER BY 
    TotalSales ASC;
    
-- Sales by Financial Quarter

SELECT 
    OrderDateFinancialQuarter AS Quarter,
    OrderDateYear AS Year,
    SUM(SalesAmount) AS TotalSales
FROM 
    Sales
GROUP BY 
    OrderDateYear, OrderDateFinancialQuarter
ORDER BY 
    OrderDateFinancialQuarter;

-- Average Order Value (AOV)

SELECT 
    AVG(SalesAmount) AS AverageOrderValue
FROM 
    Sales;

-- Total no of orders
select sum(OrderQuantity) as Total_Order_Quantity from sales;

-- Total Sales by Region

SELECT 
    st.SalesTerritoryRegion AS Region,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryRegion
ORDER BY 
    TotalSales ASC;

-- Sales by Country

SELECT 
    st.SalesTerritoryCountry AS Country,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryCountry
ORDER BY 
    TotalSales DESC;
    
 -- Top Countries with Highest Average Sales   
    
SELECT 
    st.SalesTerritoryCountry AS Country,
    AVG(s.SalesAmount) AS AverageSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryCountry
ORDER BY 
    AverageSales DESC;

-- Yearly Sales by Territory Group

SELECT 
    st.SalesTerritoryGroup AS TerritoryGroup,
    s.OrderDateYear AS Year,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryGroup, s.OrderDateYear
ORDER BY 
    s.OrderDateYear;

-- all Regions by Profit Margin

SELECT 
    st.SalesTerritoryRegion AS Region,
    SUM(s.Profit) AS TotalProfit,
    SUM(s.SalesAmount) AS TotalSales,
    (SUM(s.Profit) / SUM(s.SalesAmount)) * 100 AS ProfitMargin
FROM 
    Sales s
JOIN 
    SalesTerritory st
ON 
    s.SalesTerritoryKey = st.SalesTerritoryKey
GROUP BY 
    st.SalesTerritoryRegion;

-- Total Sales by Product Name

SELECT 
    p.ProductName AS Product,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSales DESC;

-- Top 5 Products by Profit

SELECT 
    p.ProductName AS Product,
    SUM(s.Profit) AS TotalProfit
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    TotalProfit DESC
LIMIT 5;

-- Sales by Product Category

SELECT 
    p.ProductCategoryName AS Category,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductCategoryName
ORDER BY 
    TotalSales DESC;

-- Sales and Dealer Price Comparison

SELECT 
    p.ProductName AS Product,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(p.DealerPrice * s.OrderQuantity) AS TotalDealerCost
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSales DESC;

-- Profit Margin by Product Category

SELECT 
    p.ProductCategoryName AS Category,
    SUM(s.Profit) AS TotalProfit,
    SUM(s.SalesAmount) AS TotalSales,
    (SUM(s.Profit) / SUM(s.SalesAmount)) * 100 AS ProfitMargin
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductCategoryName
ORDER BY 
    ProfitMargin DESC;

-- Sales by Product Color

SELECT 
    p.Color AS ProductColor,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.Color
ORDER BY 
    TotalSales DESC;

-- Products with Low Inventory and High Sales

SELECT 
    p.ProductName AS Product,
    SUM(s.SalesAmount) AS TotalSales
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
WHERE 
    p.SafetyStockLevel = 500
GROUP BY 
    p.ProductName, p.SafetyStockLevel
ORDER BY 
    TotalSales DESC;

-- Top Products by Sales Volume

SELECT 
    p.ProductName AS Product,
    SUM(s.OrderQuantity) AS TotalQuantity
FROM 
    Sales s
JOIN 
    Product p
ON 
    s.ProductKey = p.ProductKey
GROUP BY 
    p.ProductName
ORDER BY 
    TotalQuantity DESC
LIMIT 10;

--  
select 
	st.salesterritorygroup as Territory_Group,
    sum(s.salesAmount) as sales_Amount
from
	salesterritory st
join
	sales s
on
	s.SalesTerritoryKey=st.SalesTerritoryKey
group by 
	salesterritorygroup;
    
--
select * from sales;
