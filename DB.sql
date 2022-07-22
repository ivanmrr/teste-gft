CREATE OR ALTER PROC PROC_GET_RISK_LEVEL
AS
BEGIN

    CREATE TABLE #temp_risk_level
    (
        TradeId INT,
        Risk VARCHAR(50)
    )

    INSERT INTO #temp_risk_level
        SELECT
            t.TradeID,
            'LOWRISK'
        FROM 
            Trade t
        WHERE 
            t.value < 1000000 
            and t.ClientSector = 'Public'


    INSERT INTO #temp_risk_level
        SELECT 
            t.TradeID,
            'MEDIUMRISK'
        FROM 
            Trade t
        WHERE 
            t.value > 1000000 
            and t.ClientSector = 'Public'

    
    INSERT INTO #temp_risk_level
        SELECT 
            t.TradeID,
            'HIGHRISK'
        FROM 
            Trade t
        WHERE 
            t.value > 1000000 
            and t.ClientSector = 'Private'


    SELECT * from #temp_risk_level

    SELECT STRING_AGG(Risk, ', ') RISKs from #temp_risk_level

    DROP TABLE #temp_risk_level

END

GO

CREATE TABLE Trade (
    TradeID INT NOT NULL IDENTITY(1,1),
    ClientSector VARCHAR(255),
    Value DECIMAL(16,2)    
);


INSERT INTO Trade(ClientSector, Value) VALUES('Public', 100)
INSERT INTO Trade(ClientSector, Value) VALUES('Public', 2000000)
INSERT INTO Trade(ClientSector, Value) VALUES('Private', 2000000)


EXEC PROC_GET_RISK_LEVEL

DROP TABLE Trade