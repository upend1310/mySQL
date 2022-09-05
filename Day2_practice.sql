use sql_store;

-- in operator
select * from customers where state = 'VA' or state = 'GA' or state = 'FL';
select * from customers where state in ('VA', 'GA', 'FL');
select * from customers where state Not in ('VA', 'GA', 'FL');

-- between operator
select * from customers where points >= 1000 and points <= 3000;
select * from customers where points between 1000 and 3000;

-- like operator
select * from customers where last_name like 'b%'; -- % sign to match any number of characters without case
select * from customers where last_name like 'brush%';
select * from customers where last_name like '%b%';
select * from customers where last_name like '%y'; -- end with y
select * from customers where last_name like '_y'; -- to match last_name with 2 charcters and end with y
select * from customers where last_name like 'b____y';

select * from customers where address like '%trail%' or address like '%avenue%';
select * from customers where phone like '%9';

-- regexp operator
select * from customers where last_name like '%field%';
select * from customers where last_name regexp 'field';
select * from customers where last_name regexp '^field'; -- begining of a string. Last name must start with field.
select * from customers where last_name regexp 'field$'; -- end of a string. Last name must end with field.alter
select * from customers where last_name regexp 'field|mac'; -- last conatins field or mac.
select * from customers where last_name regexp '^field|mac$|rose';
select * from customers where last_name regexp '[gim]e'; -- any customer with last name conatains ge or ie or me
select * from customers where last_name regexp '[a-h]e'; -- any customer with last name conatains a to h followed by e

select * from customers where first_name regexp 'elka|ambur';
select * from customers where last_name regexp 'ey$|on$';
select * from customers where last_name regexp '^my|se';
select * from customers where last_name regexp 'b[ru]';

-- null operator
select * from customers where phone is null;
select * from customers where phone is not null;

select * from orders where shipped_date is null or shipper_id is null;

-- order by clause
select * from customers order by first_name;
select * from customers order by first_name desc;
select * from customers order by state, first_name;
select * from customers order by state desc, first_name desc;
select first_name, last_name, 10 as points from customers order by points, birth_date; -- this is possible in sql but others might give error

select *, quantity * unit_price as total_price from order_items where order_id = 2 order by total_price desc;

-- limit clause
select * from customers limit 3;
select * from customers limit 6, 3; -- skip first 6 records and print next 3 records. this is for pagination, here page is 3 where we will see 7, 8 and 9th record.

select * from customers order by points desc limit 3;







