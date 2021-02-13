-- CUSTOMERS WHO DIDNT BUY A PRODUCT

-- From the following table, write a query to display the ID and name of customers who bought products A and B, 
-- but didn’t buy product C, ordered by ascending customer ID

create database if not exists practicedb;
use practicedb;

create table if not exists customers (
id integer not null,
 name varchar(40));

create table if not exists orders (
order_id integer not null, 
customer_id integer, 
product_name varchar(40));

/*
insert into customers (id, name)
VALUES
(1, 'Daniel'),
(2, 'Diana'),
(3, 'Elizabeth'),
(4, 'John');
insert into orders (order_id, customer_id, product_name)
VALUES
(1, 1, 'A'),
(2, 1, 'B'),
(3, 2, 'A'),
(4, 2, 'B'),
(5, 2, 'C'),
(6, 3, 'A'), 
(7, 3, 'A'),
(8, 3, 'B'),
(9, 3, 'D');
*/
 
select * from customers;
select * from orders;

with ta as(
select customer_id, product_name from orders where product_name = 'A'
),
tb as(
select customer_id, product_name  from orders where product_name = 'B'
),
tc as(
select customer_id, product_name from orders where product_name = 'C'
)
select distinct customers.id,customers.name from customers 
left join ta on ta.customer_id = customers.id
left join tb on tb.customer_id = customers.id
left join tc on tc.customer_id = customers.id
where ta.product_name is not null and tb.product_name is not null and tc.product_name is null
order by customers.id;
