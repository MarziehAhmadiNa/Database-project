select OfficeID , avg(Salary) as avg_sal
from Staff
group by OfficeID

select *
from Available_Tours
where Cost<1000000

select *
from Tours
where TourType='Flight'
union
select *
from Tours
where TourType='Bus'