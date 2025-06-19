#PROJECT-PIZZA_SALES

CREATE DATABASE PIZZA_SALES;
USE  PIZZA_SALES;

CREATE TABLE pizza(pizza_id varchar(100) not null,
			pizza_type varchar(100) not null,
            size varchar(20) not null,
            price float not null);
select * from pizza;
#data has been imported through "table data import wizard"

CREATE TABLE pizza_type(pizza_types varchar(100) not null,
			name varchar(50) not null,
            category varchar(50) not null,
            ingredients varchar(100) not null);
select * from pizza_type;
#data has been imported through "table data import wizard"

CREATE TABLE orders(order_id int not null primary key,
			order_date date not null,
            order_time time not null);
select * from orders;
#data has been imported through "table data import wizard"
            
CREATE TABLE order_details(order_details int not null primary key,
			order_id int not null,
            pizza_id varchar(100) not null,
            quantity int not null);
 select * from order_details;           
#data has been imported through "table data import wizard"

#QUERIES

#1.Retrieve the total number of orders placed.
SELECT count(order_id) as total_orders FROM orders;

#2.Calculate the total revenue generated from pizza sales.
select sum(order_details.quantity * pizza.price) as total_sales
from order_details join pizza
on pizza.pizza_id=order_details.pizza_id;

#3.Identify the highest-priced pizza.
select pizza_type.name,pizza.price
from pizza_type join pizza
on pizza_type.pizza_types=pizza.pizza_type
order by pizza.price desc limit 1;

#4.Identify the most common pizza size ordered.
select pizza.size,count(order_details.order_details) as order_count
from pizza join order_details
on pizza.pizza_id=order_details.pizza_id
group by pizza.size order by order_count desc;

#5.List the top 5 most ordered pizza types along with their quantities.
select pizza_type.name,
sum(order_details.quantity) as quantity
from pizza_type join pizza 
on pizza_type.pizza_types=pizza.pizza_type
join order_details
on order_details.pizza_id=pizza.pizza_id
group by pizza_type.name 
order by quantity desc limit 5;

#6.Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_type.category,
sum(order_details.quantity) as quantity
from pizza_type join pizza 
on pizza_type.pizza_types=pizza.pizza_type
join order_details
on order_details.pizza_id=pizza.pizza_id
group by pizza_type.category
order by quantity desc; 

#7.Determine the distribution of orders by hour of the day.
select hour(order_time) as hour ,count(order_id) as order_count from orders
group by hour(order_time);

#8.Join relevant tables to find the category-wise distribution of pizzas.
select category,count(name) from pizza_type
group by category;





















