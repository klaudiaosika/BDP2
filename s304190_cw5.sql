-- Zadanie 8a. dni (wraz z liczb� zam�wie�) w kt�rych by�o mniej ni� 100 zam�wie�
SELECT OrderDate, COUNT(OrderDate) AS Order_cnt FROM FactInternetSales GROUP BY OrderDate HAVING COUNT (OrderDateKey) <100 ORDER BY Orders_cnt DESC; 

-- Zadanie 8b. dla ka�dego dnia wy�wietl 3 produkty, kt�rych cena jednostkowa (UnitPrice) by�a najwi�ksza
SELECT a.OrderDate, a.UnitPrice FROM 
(SELECT OrderDate, UnitPrice, ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS w
FROM FactInternetSales) a 
WHERE w<4 ORDER BY OrderDate;