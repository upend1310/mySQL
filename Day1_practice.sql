use sql_store;
SELECT 
    *
FROM
    customers
WHERE
    customer_id = 1;
SELECT 
    *
FROM
    customers
ORDER BY first_name;
SELECT 
    first_name,
    last_name,
    points,
    points * 10 + 100 AS discount_factor
FROM
    customers;
SELECT DISTINCT
    state
FROM
    customers;-- distinct keyword to remove duplicates
SELECT 
    name, unit_price, unit_price * 1.1 AS new_price
FROM
    products;
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'; -- date can be given as string
SELECT 
    *
FROM
    orders
WHERE
    order_date >= '2019-01-01';
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        AND points > 1000;
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        OR points > 1000;
SELECT 
    *
FROM
    customers
WHERE
    birth_date > '1990-01-01'
        OR points > 1000 AND state = 'VA';
SELECT 
    *
FROM
    customers
WHERE
    NOT (birth_date > '1990-01-01'
        OR points > 1000); -- NOT of OR = AND
SELECT 
    *
FROM
    order_items
WHERE
    order_id = 6
        AND (quantity * unit_price) > 30;