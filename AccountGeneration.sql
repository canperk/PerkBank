DECLARE @actorId INT
DECLARE accountCursor CURSOR FOR   
SELECT Id FROM Enterprise.Actors 

OPEN accountCursor  
FETCH NEXT FROM accountCursor INTO @actorId

WHILE @@FETCH_STATUS = 0  
BEGIN  
	DECLARE @count TINYINT
	DECLARE @i TINYINT
	SET @i = 0
	SET @count = (SELECT ABS(CHECKSUM(NEWID()) % 3) + 1)
	WHILE @i < @count
	BEGIN
		DECLARE @accountType INT
		DECLARE @currencyType INT
		DECLARE @amount MONEY
		DECLARE @accountNumber CHAR(14)
		SET @currencyType = (SELECT * FROM (SELECT TOP 1 Id FROM Enterprise.Lookups WHERE LookupTypeId = 4 ORDER BY NEWID()) AS CTE)
		SET @accountType = (SELECT * FROM (SELECT TOP 1 Id FROM Enterprise.Lookups WHERE LookupTypeId = 5 ORDER BY NEWID()) AS CTE)
		SET @amount = (SELECT CAST(RAND() * 100000 AS INT))
		SET @accountNumber = (SELECT CAST(SUBSTRING(REPLACE(NEWID(), '-', ''), 0 , 14) AS CHAR(14)))
		INSERT INTO Account.Accounts (AccountNumber, ActorId, CurrencyTypeId, AccountTypeId, Amount)
					VALUES (@accountNumber, @actorId, @currencyType, @accountType, @amount)
		SET @i = @i + 1
	END
    FETCH NEXT FROM accountCursor   
    INTO @actorId
END   
CLOSE accountCursor;  
DEALLOCATE accountCursor;
