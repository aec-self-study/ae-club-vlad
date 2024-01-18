-- For each customer, we want to know how many orders they have placed, and when they placed their first order.
select 
  o.customer_id
  , c.name
  , c.email
  , min(o.created_at) as first_order_at
  , count(o.id)
from `analytics-engineers-club.coffee_shop.customers` as c 
  left join `analytics-engineers-club.coffee_shop.orders` as o
  on c.id = o.customer_id
group by
  o.customer_id
  , c.name
  , c.email
order by 
  first_order_at asc
limit 5 
;
