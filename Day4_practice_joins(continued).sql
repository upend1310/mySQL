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

