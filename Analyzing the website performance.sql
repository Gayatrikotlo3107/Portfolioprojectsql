use mavenfuzzyfactory;

select 
year( website_sessions.created_at)as yr ,
MONTH( website_sessions.created_at)as mnth,
count(orders.order_id)as orders,
count(website_sessions.website_session_id) As sessions
from website_sessions
LEFT JOIN orders
on orders.created_at=website_sessions.created_at
where website_sessions.utm_source ="gsearch" AND website_sessions.created_at<'2012-11-27'
group by 1,2;

select 
year( website_sessions.created_at)as yr ,
MONTH( website_sessions.created_at)as mnth,
COUNT(DISTINT CASE WHEN utm_campaign="non-brand" THEN website_sessions.wessite_session_id else null end) as non brand_sessions,
COUNT(DISTINT CASE when utm_campaign="non-brand" then orders.order_id else null end) as non brand_orders,
COUNT(DISTINT CASE when utm_campaign="non-brand" then website_sessions.wessite_session_id else null end) as non brand_sessions,
COUNT(DISTINT CASE when utm_campaign="non-brand" then orders.order_id else null end) as non brand_orders
from website_sessions
LEFT JOIN orders
on orders.created_at=website_sessions.created_at
where website_sessions.utm_source ="gsearch" AND website_sessions.created_at<'2012-11-27'
group by 1,2;

select 
year( website_sessions.created_at)as yr ,
MONTH( website_sessions.created_at)as mnth,
COUNT(DISTINT CASE WHEN device_type="desktop" THEN website_sessions.wessite_session_id else null end) as non brand_sessions,
COUNT(DISTINT CASE when device_type="desktop" then orders.order_id else null end) as non brand_orders,
COUNT(DISTINT CASE when device_type="mobile" then website_sessions.wessite_session_id else null end) as non brand_sessions,
COUNT(DISTINT CASE when device_type="mobile" then orders.order_id else null end) as non brand_orders
from website_sessions
LEFT JOIN orders
on orders.created_at=website_sessions.created_at
where website_sessions.utm_source ="gsearch" AND website_sessions.created_at<'2012-11-27'
group by 1,2;






