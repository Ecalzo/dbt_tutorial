-- BEFORE RUNNING THIS SCRIPT
-- CREATE DATABASE dbt_tutorial;
-- CREATE SCHEMA dbt_tutorial.jaffle_shop;

DROP TABLE jaffle_shop.customers;
DROP TABLE jaffle_shop.orders;
DROP TABLE jaffle_shop.payments;

CREATE TABLE jaffle_shop.customers (
    id int,
    first_name varchar,
    last_name varchar,
    email varchar
);

CREATE TABLE jaffle_shop.orders (
    id int,
    user_id int,
    order_date date,
    status varchar
);

CREATE TABLE jaffle_shop.payments (
    id int,
    order_id int,
    payment_method varchar,
    amount int
);

COPY jaffle_shop.customers(
    id, first_name, last_name, email
)
FROM 'datasets/raw_customers.csv' DELIMITER ',' CSV HEADER;

COPY jaffle_shop.orders(
    id, user_id, order_date, status
)
FROM 'datasets/raw_orders.csv' DELIMITER ',' CSV HEADER;

COPY jaffle_shop.payments(
    id, order_id, payment_method, amount
)
FROM 'datasets/raw_payments.csv' DELIMITER ',' CSV HEADER;

