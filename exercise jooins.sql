select * from products
select * from orders

CREATE TABLE orders (
    order_id int PRIMARY KEY,
    product_id INTEGER,
    customer_name VARCHAR(100),
    order_date TIMESTAMP DEFAULT NOW(),
    quantity_ordered INTEGER NOT NULL DEFAULT 1,
    status VARCHAR(20) DEFAULT 'Pending',
	payment_method VARCHAR(20),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
	on delete cascade
);


INSERT INTO public.orders (order_id, product_id, customer_name, quantity_ordered, status, payment_method) VALUES
(101, 1, 'John Doe', 2, 'Shipped', 'Credit Card'),
(102, 1, 'Jane Smith', 1, 'Pending', 'PayPal'),
(103, 2, 'Alice Wong', 5, 'Shipped', 'Debit Card'),
(104, 3, 'Bob Miller', 1, 'Cancelled', 'Credit Card'),
(105, 5, 'Charlie Day', 3, 'Shipped', 'Cash'),
(106, 2, 'David Blake', 2, 'Pending', 'PayPal'),
(107, 8, 'Emma Wilson', 1, 'Shipped', 'Credit Card'),
(108, 10, 'Frank Wright', 4, 'Pending', 'Debit Card'),
(109, 5, 'Grace Hopper', 2, 'Shipped', 'Apple Pay'),
(110, 3, 'Henry Ford', 1, 'Shipped', 'Credit Card');


alter table orders
drop column order_date


COPY orders(order_id, product_id, customer_name, quantity_ordered, status, payment_method)
FROM 'C:\Users\Commit\Downloads\orders.csv' -- Change this to your actual file path
DELIMITER ','
CSV HEADER;


select * from products p 
join orders o on p.product_id = o.product_id
order by p.product_id

-- each order with product name and price
select 
o.order_id,
o.customer_name,
p.product_name,
p.price
from products p 
join orders o on p.product_id = o.product_id

-- all products if those are not even ordered
select p.product_name, o.status from products p
full join orders o on p.product_id = o.product_id

-- show all order only for electronics
select *
from products p 
join orders o 
on p.product_id = o.product_id
where p.category = 'Electronics'

-- list all the products sorted by products high to low
select * from products p
join orders o on p.product_id = o.product_id
order by p.price desc

-- show no of orders placed for each product
select count(o.order_id) as total, p.product_name from products p
left join orders o on p.product_id = o.product_id
group by p.product_name

-- total revenue earn per product
select sum(p.price*o.quantity_ordered) as revenue, p.product_name from products p
join orders o on p.product_id = o.product_id
group by p.product_name

-- show unique customer order Accessories products
select o.customer_name,p.category from products p
join orders o on p.product_id = o.product
where p.category = 'Accessories'

-- show total revenue where total > 2000
select p.product_name, sum(p.price*o.quantity_ordered) as revenue 
from products p
join orders o on p.product_id = o.product_id
group by p.product_name
having sum(p.price*o.quantity_ordered) > 2000