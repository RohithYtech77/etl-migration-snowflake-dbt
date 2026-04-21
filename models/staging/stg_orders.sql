-- Staging model: clean raw orders data

WITH source AS (
    SELECT * FROM {{ source('raw', 'orders') }}
),

cleaned AS (
    SELECT
        order_id,
        customer_id,
        CAST(order_date AS DATE)        AS order_date,
        UPPER(TRIM(status))             AS status,
        ROUND(total_amount, 2)          AS total_amount,
        CURRENT_TIMESTAMP()             AS loaded_at
    FROM source
    WHERE order_id IS NOT NULL
      AND total_amount > 0
)

SELECT * FROM cleaned
