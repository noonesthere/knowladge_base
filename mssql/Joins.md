```
select top(1) p.name , sum(i.quantity)
FROM Production.Product p
JOIN Production.ProductInventory i
ON i.ProductID = p.ProductID
GROUP BY p.Name
```

Порядок выполнения запроса:
join table 
filter 
group by
projection (show result of query)

- logic left to right 
- if data transfer right to left

##### Оптиимзации которые использует оптимизатор
```
select * from sys.dm_exec_query_transformation_stats
```
>План выполнения может отличатся как логическое выполнение запроса 

#### Types of JONS logical jons 
- INNER JOIN 
- LEFT JOIN 
- FULL JOIN
- SAMI JOIN (использует таблицу в качестве фильтра правую таблицу (не добавляет строк и не добавляет nulls) ) ist EXISTS
```

-- left semi join 
select s.* 
from Production.ProductCategory s
WHERE EXISTS (select * FROM Production.Product p WHERE  p.ProductSubcategoryID = s.ProductCategoryID)

select s.* 
from Production.ProductCategory s
WHERE s.ProductCategoryID IN (
select p.ProductSubcategoryID FROM Production.Product p WHERE  p.ProductSubcategoryID = s.ProductCategoryID
);
```
- ANTI SEMI
```
select ProductId 
FROM Production.Product
EXCEPT 
SELECT ProductId FROM Sales.SalesOrderDetail
```

- CROSS JOIN 
- CROSS APPLY
- OUTER APPLY
###### Pfysycal joins
- nested loop
- hash
- merge


####  Left join vs Inner Join
```
select p.*
FROM Person.Person p
LEFT JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.Gender = 'M'
```

MSSQL use inner join.
Оптимизатор меняет логический порядок запроса и JOIN 
Join это операция с двумя SETами
Что такое join что он делает:
1. add columns (которых нет в основной таблице)
2. Eliminates rows (which not exists in 2nd table) (INNER JOIN, RIGHT, SEMI)
3. Duplicate rows (INNER , LEFT, RIGHT, FULL)
4. ADD Mulls (RIGHT, FULL)



Нам нужен Join:
- нужны дополнительные данные (из второй таблицы)
- фильтруем
- дублируем
- не выбрасываем Nulls



FOr LEFT AND FULL it compare not filter






```
SET STATISTICS TIME, IO ON
GO

select 
p.BusinessEntityID , 
(
	SELECT top 1 JobTitle 
	from HumanResources.Employee e 
	WHERE p.BusinessEntityID = e.BusinessEntityID 
	order by BirthDate DESC
)	 
FROM Person.Person p
where p.BusinessEntityID <= 1000

-- cross apply instead of subselect


-- data loss
select 
p.BusinessEntityID , e.JobTitle , e.vacationHours 
FROM Person.Person p
CROSS APPLY  (
SELECT top 1 *
	from HumanResources.Employee e 
	WHERE p.BusinessEntityID = e.BusinessEntityID 
	order by BirthDate DESC
) e
where p.BusinessEntityID <= 1000


select 
p.BusinessEntityID -- , e.JobTitle , e.vacationHours 
FROM Person.Person p
OUTER APPLY  (
SELECT top 1 *
	from HumanResources.Employee e 
	WHERE p.BusinessEntityID = e.BusinessEntityID 
	order by BirthDate DESC
) e
where p.BusinessEntityID <= 1000
SET STATISTICS TIME, IO OFF
GO

```


```
SELECT p.BusinessEntityID,MAX(s.SalesQuota) AS SalesQuota
FROM Person.Person p
LEFT JOIN Sales.SalesPersonQuotaHistory s ON s.BusinessEntityID = p.BusinessEntityID
GROUP BY p.BusinessEntityID
```

