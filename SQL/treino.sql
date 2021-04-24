-- !preview conn=conn




with k as (

select a, b as b_y
from d2

)

select *  from d1
inner join k using (a)

