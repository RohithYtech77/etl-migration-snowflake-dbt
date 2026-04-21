-- Mart model: customer-level summary for analytics

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

summary AS (
    SELECT
        customer_id,
        COUNT(order_id)             AS total_orders,
        SUM(total_amount)           AS lifetime_value,
        MIN(order_date)             AS first_order_date,
        MAX(order_date)             AS last_order_date
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY customer_id
)

SELECT * FROM summary
