SELECT
    date_date,
    count(orders_id) as nb_transactions,
    sum(total_revenue) as revenue_1,
    round(avg(total_revenue),2) as average_basket,
    ROUND(SUM(total_revenue)/COUNT(orders_id),1) AS average_basket_bis,
    ROUND(SUM(margin),0) AS margin,
    ROUND(SUM(operational_margin),0) AS operational_margin, 
    ROUND(SUM(purchase_cost),0) AS purchase_cost, 
    ROUND(SUM(shipping_fee),0) AS shipping_fee, 
    ROUND(SUM(logcost),0) AS logcost, 
    ROUND(SUM(CAST(ship_cost AS FLOAT64)), 0) AS ship_cost, 
    SUM(total_quantity) AS total_quantity
FROM {{ref("int_orders_operational")}}
GROUP BY  date_date
ORDER BY  date_date DESC