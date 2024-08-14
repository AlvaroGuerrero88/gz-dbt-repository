SELECT
  products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64) AS purchase_price, 
    ROUND(quantity*CAST(purchase_price AS FLOAT64),2) AS purchase_cost,
    revenue - ROUND(quantity*CAST(purchase_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw__sales")}} 
 JOIN {{ref("stg_raw__product")}} 
    USING (products_id)
