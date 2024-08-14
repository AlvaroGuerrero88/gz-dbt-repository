SELECT
    orders_id,
    date_date,
    (margin + shipping_fee) - (logcost + cast(ship_cost as FLOAT64)) AS operational_margin,
    total_quantity,
    total_revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost
FROM {{ref("int_orders_margin")}}
inner join {{ref("stg_raw__ship")}}
using(orders_id)