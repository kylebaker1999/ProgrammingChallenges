create table marketing_data (
 date datetime,
 campaign_id varchar(50),
 geo varchar(50),
 cost float,
 impressions float,
 clicks float,
 conversions float
);

create table website_revenue (
 date datetime,
 campaign_id varchar(50),
 state varchar(2),
 revenue float
);

create table campaign_info (
 id int not null primary key auto_increment,
 name varchar(50),
 status varchar(50),
 last_updated_date datetime
);

SELECT DATE(date) AS Day, SUM(impressions) AS "Total Imprssions"
FROM marketing_data
GROUP BY day
ORDER BY day;

select state, sum(revenue) as Total
FROM website_revenue
GROUP BY state
ORDER BY Total DESC
LIMIT 3;
-- The 3rd best generated 37577

select c.name, sum(m.impressions), sum(m.clicks), sum(w.revenue)
from marketing_data m
	join website_revenue w on m.campaign_id = w.campaign_id
    join campaign_info c on m.campaign_id = c.id
group by c.name;

select w.state,  sum(m.conversions) as "Total Conversions"
from marketing_data m
	join website_revenue w on m.campaign_id = w.campaign_id
    join campaign_info c on m.campaign_id = c.id
where c.name = "Campaign5"
group by state;

-- GA generated the most conversions

select c.name,  sum(m.conversions) as "Total Conversions", sum(m.impressions), sum(m.clicks), sum(w.revenue)
from marketing_data m
	join website_revenue w on m.campaign_id = w.campaign_id
    join campaign_info c on m.campaign_id = c.id
group by c.name;

-- I would think that the most efficient is Campaign 3.  They generated the most in everything.  Although an argument could
-- be made that they put the most in so they should get the most out, I believe that they
-- still had the most success by a wide margin.



