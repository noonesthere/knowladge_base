```
SELECT
s.Name AS SchemaName,
t.Name AS TableName,
p.rows AS RowCounts,
CAST(ROUND((SUM(a.used_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Used_MB,
CAST(ROUND((SUM(a.total_pages) - SUM(a.used_pages)) / 128.00, 2) AS NUMERIC(36, 2)) AS Unused_MB,
CAST(ROUND((SUM(a.total_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Total_MB
FROM sys.tables t WITH(NOLOCK)
INNER JOIN sys.indexes  i WITH(NOLOCK) ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p WITH(NOLOCK) ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a WITH(NOLOCK) ON p.partition_id = a.container_id
INNER JOIN sys.schemas s WITH(NOLOCK) ON t.schema_id = s.schema_id
WHERE t.object_id = OBJECT_ID('skul_level_attribute')
GROUP BY t.Name, s.Name, p.Rows
ORDER BY s.Name, t.Name
GO
```

```
select name, value from sys.configurations

where name in (

  'cost threshold for parallelism'

, 'max degree of parallelism'

, 'max server memory (MB)'

, 'backup compression default'

)

 

union all

 

SELECT 'instant_file_initialization', instant_file_initialization_enabled

FROM  sys.dm_server_services

WHERE servicename LIKE 'SQL Server (%'
```