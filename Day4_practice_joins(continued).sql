use sql_invoicing;

select p.date, p.invoice_id, p.amount, c.name, pm.name from payments p 
	join payment_methods pm on p.payment_method = pm.payment_method_id join clients c on c.client_id = p.client_id;
-- ============================================================================
-- Does it matter if i put a filter condition in WHERE or ON
-- For Inner join - No
-- For Outer join - Yes - results may differ
-- For Both Inner and outer joins - Rule of thumb ->
-- Use ON for pairing rows and WHERE for further filtering the paired rows
-- ============================================================================
    
-- compound join conditions
-- In case we cannot use a single coulmn to uniqly identify a rows/ records in table eg. sql_store.order_items
-- Composit primary key - A table will have more than one primary key
use sql_store;

select * from order_items oi join order_item_notes oin on oi.order_id = oin.order_id and oi.product_id = oin.product_id;

-- Outer Join (Left join/ Left outer join, right/ right outer join, full outer join)
select * from customers c left join orders o on c.customer_id = o.customer_id order by c.customer_id;
select * from customers c right join orders o on c.customer_id = o.customer_id order by c.customer_id;
select p.product_id, p.name, oi.quantity from products p left join order_items oi on p.product_id = oi.product_id;

-- Outer join between multipe tables
select c.customer_id, c.first_name, o.order_id, sh.name as shipper from customers c 
	left join orders o on c.customer_id = o.customer_id 
    left join shippers sh on o.shipper_id = sh.shipper_id order by c.customer_id;
    
select o.order_date, o.order_id, c.first_name, sh.name as shipper, os.name as status from orders o 
	left join customers c on c.customer_id = o.customer_id 
    left join shippers sh on o.shipper_id = sh.shipper_id
    left join order_statuses os on os.order_status_id = o.status;
    
-- Self outer join
use sql_hr;

select e.employee_id, e.first_name, m.first_name as manager from employees e left join employees m on e.reports_to = m.employee_id;

-- Using clause
-- If column name is exactly the same across two tables we can replace on caluse by using clause
use sql_store;
	-- old
		select o.order_id, c.first_name from orders o join customers c on o.customer_id = c.customer_id;
	-- modified
		select o.order_id, c.first_name from orders o join customers c using (customer_id);
select * from order_items oi join order_item_notes oin using (order_id, product_id);

use sql_invoicing;
select p.date, c.name as client, p.amount, pm.name from payments p left join clients c using(client_id)
	left join payment_methods pm on p.payment_method = pm.payment_method_id;
    
-- Natural JOIN -- not recommended
-- With Natural join we dont explicitely specify coulmn names so the DB engine joins based on same column name
use sql_store;
select o.order_id, c.first_name from orders o natural join customers c;

-- Cross joins
-- to combine every record of first table to every record on 2nd table
-- explicit syntax
select c.first_name as customer, p.name as product from customers c cross join products p order by c.first_name;
-- implicit syntax
select c.first_name as customer, p.name as product from customers c, products p order by c.first_name;



