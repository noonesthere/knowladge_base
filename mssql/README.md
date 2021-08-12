####Don't use:
> VARCHAR as DATE

> INT as BIT

> USE concrete  instead of *

##### Example for measure two queries:
```
USE dbName
GO
SET STATISTICS TIME, IO ON
SELECT * FROM tableName

SELECT column1, column2 FROM tableName

SET STATISTICS TIME, IO OFF
GO
```
benefits: logic physycal reads , netowrk elapsed time , cpu time etc


>Alway set aliases for tables in queries (if column renamed it can corrupt query without any errors)

> Set column order when use INSERT INTO SELECT ...

> Use column names in ORDER BY e.g ORDER BY  column1, column2 instead 1,2

> NOT IN use without null or use IS NOT NULL  or NOT EXISTS ()
```
SELECT *
FROM @t1
WHERE NOT EXISTS(
        SELECT 1
        FROM @t2
        WHERE t1 = t2
    )
```

> USE DATETIME as '20160112' instead '2016-01-12' or '2016/01/12'

> DATE AND DATETIME interpret differentrly:
>
```
DECLARE @d1 DATE = '2016-01-12',
        @d2 DATETIME = '2016-01-12',
        @d3 DATE = '20160112',
        @d4 DATETIME = '20160112'

SELECT @d1, @d2, @d2, @d4
```
###### Example of creating table 
```
DECLARE @t1 TABLE (t1 INT, UNIQUE CLUSTERED(t1))
INSERT INTO @t1 VALUES (1), (2)
```

###### Correct where for date:

```
SELECT COUNT_BIG(*)
FROM dbo.DatabaseLog
WHERE PostTime BETWEEN '20140716' AND '20140716 23:59:59.997'

SELECT COUNT_BIG(*)
FROM dbo.DatabaseLog
WHERE PostTime >= '20140716' AND PostTime < '20140717'
```

###### Correct where for check one month:
```
SELECT COUNT_BIG(*)
FROM dbo.DatabaseLog
WHERE PostTime >= '20140701' AND PostTime < '20140801'
```

###### Use colculated column:
```
IF COL_LENGTH('dbo.DatabaseLog', 'MonthLastDay') IS NOT NULL
    ALTER TABLE dbo.DatabaseLog DROP COLUMN MonthLastDay
GO

ALTER TABLE dbo.DatabaseLog
    ADD MonthLastDay AS EOMONTH(PostTime) --PERSISTED
GO

CREATE INDEX IX_MonthLastDay ON dbo.DatabaseLog (MonthLastDay)
```

> Как я уже говорил, любые вычисления на индексных полях снижают производительность и приводят к увеличению логических чтений:

```
SET STATISTICS IO ON

SELECT BusinessEntityID
FROM Person.Person
WHERE BusinessEntityID * 2 = 10000

SELECT BusinessEntityID
FROM Person.Person
WHERE BusinessEntityID = 2500 * 2

SELECT BusinessEntityID
FROM Person.Person
WHERE BusinessEntityID = 5000

```

> Решение проблемы достаточно простое — нужно контролировать, чтобы типы данных при сравнении совпадали.

>Preffer UNION instead UNION ALL (UNION work parallel

>При реорганизации индексов же — статистика не 

>USE CLUSTERED INDEX for keys which works in WHERE 

> USE NONCLUSTERED TO IMPROVE GROUP BY WHERE JOIN