-- with customers as (
--     select
--         id as customer_id,
--         first_name,
--         last_name
--     from jaffle_shop.customers
-- ),
-- orders as (
--     select
--         id as order_id,
--         user_id as customer_id,
--         order_date,
--         status
--     from jaffle_shop.orders
-- ),
-- instead use refs!
-- dbt infers the orde rin which to run models
-- customers depends on stg_customers and stg_orders so gets built last
-- there is no need to explicitly define these dependencies
with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders')}}
),
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1
),
final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders
    from customers
    left join customer_orders using (customer_id)
)
select * from final