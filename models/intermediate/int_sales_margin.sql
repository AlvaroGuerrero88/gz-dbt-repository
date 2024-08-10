select
    products_id,
    SUM(CAST(purchase_price as float64) * quantity) as purchase_cost,
    (SUM(revenue) - SUM(CAST(purchase_price AS FLOAT64) * quantity)) / NULLIF(SUM(revenue), 0) AS margin
from {{ref("stg_raw__sales")}}
left join {{ref("stg_raw__product")}}
using (products_id)
group by products_id
