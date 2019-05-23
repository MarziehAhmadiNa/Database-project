create view Tour_Type_View as
(
	select distinct TourType
	from Tours
)

select * from Tour_Type_View