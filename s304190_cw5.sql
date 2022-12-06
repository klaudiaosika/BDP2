-- Zadanie 8a. dni (wraz z liczb¹ zamówieñ) w których by³o mniej ni¿ 100 zamówieñ
SELECT OrderDate, COUNT(OrderDate) AS Order_cnt FROM FactInternetSales GROUP BY OrderDate HAVING COUNT (OrderDateKey) <100 ORDER BY Orders_cnt DESC; 

-- Zadanie 8b. dla ka¿dego dnia wyœwietl 3 produkty, których cena jednostkowa (UnitPrice) by³a najwiêksza
SELECT a.OrderDate, a.UnitPrice FROM 
(SELECT OrderDate, UnitPrice, ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS w
FROM FactInternetSales) a 
WHERE w<4 ORDER BY OrderDate;