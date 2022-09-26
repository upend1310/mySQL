-- Unions
use sql_store;

-- same table
select order_id, order_date, 'Active' as status from orders where order_date >= '2019-01-01' 
UNION
select order_id, order_date, 'Archived' as status from orders where order_date <= '2019-01-01';

-- different tables
select first_name from customers union select name from shippers;
select name from shippers union select first_name from customers;

select customer_id, first_name, points, 'Bronze' as type from customers where points < 2000
UNION
select customer_id, first_name, points, 'Silver' as type from customers where points > 2000 and points < 3000 -- between 2000 and 3000
UNION
select customer_id, first_name, points, 'Gold' as type from customers where points > 3000
order by first_name;
