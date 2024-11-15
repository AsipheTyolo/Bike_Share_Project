
--I start off by joining table "bike_share_yr_0" and "bike_share_yr_1" using Union All function
With cte as (
select * from Bike_data.dbo.bike_share_yr_0
union all
select * from Bike_data.dbo.bike_share_yr_1)

--Now I am going to left join the cost table with the cte one
select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,           --COGS stands for Cost Of Goods
riders*price as Revenue,
(riders*price) - COGS as Profit
from cte a                  --I've aliased this table as "a"
left join Bike_data.dbo.cost_table b    --I've alliesed this table as "b"
on a.yr = b.yr


