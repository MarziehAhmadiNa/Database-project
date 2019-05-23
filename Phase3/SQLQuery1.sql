select FirstName, LastName
,ROW_NUMBER() over (order by Salary) as "Row Number"
,RANK() over (order by Salary) as "Salary Rank"
,DENSE_RANK() over (order by Salary) as "Salary Dense Rank"
,NTILE(4) over (order by Salary) as Quartile
,Salary
from Staff