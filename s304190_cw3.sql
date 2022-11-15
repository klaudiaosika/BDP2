CREATE PROCEDURE s304190_cw3
	@YearsAgo AS INT = 8
AS
BEGIN
	SELECT * FROM AdventureWorksDW2019.dbo.FactCurrencyRate AS fcr INNER JOIN AdventureWorksDW2019.dbo.DimCurrency AS dc 
	ON fcr.CurrencyKey=dc.CurrencyKey 
	WHERE (dc.CurrencyAlternateKey = 'GBP' OR dc.CurrencyAlternateKey = 'EUR') 
	AND DATEPART(YEAR, fcr.Date) < DATEPART(YEAR, GETDATE()) - @YearsAgo 
	AND DATEPART(MONTH, GETDATE()) < DATEPART(MONTH, fcr.Date) AND  DATEPART(DAY, GETDATE()) < DATEPART(DAY, fcr.Date);
END
GO