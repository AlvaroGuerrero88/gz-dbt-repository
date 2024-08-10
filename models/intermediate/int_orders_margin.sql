select
    orders_id,
    max(date_date) as date_date,
    sum(revenue) as total_revenue,
    sum(quantity) as total_quantity,
    sum(CAST(purchase_price as float64) * quantity) as purchase_cost,
    (SUM(revenue) - SUM(CAST(purchase_price AS FLOAT64) * quantity)) / NULLIF(SUM(revenue), 0) AS margin
from {{ref("stg_raw__sales")}}
left join {{ref("stg_raw__product")}}
using (products_id)
group by orders_id
order by orders_id desc

