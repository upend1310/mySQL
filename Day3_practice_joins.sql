-- ============================================================================
-- Types of Joins
-- a. LEFT JOIN b. INNER JOIN / JOIN c. RIGHT JOIN d. FULL OUTER JOIN
-- LEFT JOIN - All Data from LEFT Table + matching data from right table
-- JOIN - Intersection of LEFT and RIGHT table data
-- RIGHT JOIN - All Data from RIGHT Table + matching data from left table
-- FULL OUTER JOIN - All Data from both tables
-- ============================================================================


-- inner joins/ join
select order_id, orders.customer_id, first_name, last_name from orders join customers on orders.customer_id = customers.customer_id;
	-- since we have customer_id in both tables sql will give error for using it directly as column name. 
    -- so need to specify which table from where we want to pick
    -- also in place of join we can use inner join keyword
select order_id, o.customer_id, first_name, last_name from orders o join customers c on o.customer_id = c.customer_id; -- simplified

select order_id, oi.product_id, quantity, oi.unit_price from order_items oi join products p on oi.product_id = p.product_id;

-- Implicit join syntax
	select * from orders o join customers c on o.customer_id = c.customer_id; -- it is better to write this syntax
	-- this can be also written as below
	select * from orders o, customers c where o.customer_id = c.customer_id; -- Beware of this syntax 
	-- as if you forget where caluse it will create a cross join

-- join across databases
select * from order_items oi join sql_inventory.products p on oi.product_id = p.product_id; -- sql_inventory is another sql DB 
	-- and we are currently using sql_store DB
    
-- join table with itself / self join
select e.employee_id, e.first_name, m.first_name as manager from sql_hr.employees e join sql_hr.employees m on e.reports_to = m.employee_id;

-- join more than two tables
select o.order_id, o.order_date, c.first_name, c.last_name, os.name as status from orders o join 
	customers c on o.customer_id = c.customer_id join order_statuses os on o.status = os.order_status_id;
