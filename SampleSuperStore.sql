SELECT * FROM sample_superstore LIMIT 5;

#total sales by region
select region,sum(sales) as total_sales from sample_superstore
group by region
order by total_sales;

#top 5 selled products
select productname,sum(sales) from sample_superstore
group by productname
order by sum(sales) desc
limit 5;

#top 5 categoies by profit
select productcategory,sum(revenue) as total_revenue from sample_superstore
group by productcategory
order by sum(revenue);

#monthly trends
select DATE_FORMAT(STR_TO_DATE(orderdate, '%d-%m-%Y'), '%Y-%m') AS month, 
       SUM(sales) AS monthly_sales from sample_superstore
group by month
order by month;

#profit margin by shipping mode
select  shipmode,avg(profitmargin) as avg_profit_margin from sample_superstore
group by shipmode
order by avg_profit_margin ;



# top 10 customers
select customername,sum(sales) as sales_by_customer from sample_superstore
group by customername
order by sales_by_customer desc
limit 10;


#product with negative profit
select productname,sum(sales) as product_Sales from sample_superstore
group by productname
having sum(sales)<0
order by product_sales;

#Effect of discount on profit
SELECT discount, SUM(profit) AS total_profit
FROM sample_superstore
GROUP BY discount
ORDER BY discount;

#sales with highest shipping cost
SELECT stateorprovince, SUM(shippingcost) AS total_shipping_cost
FROM sample_superstore
GROUP BY stateorprovince
ORDER BY total_shipping_cost DESC
LIMIT 1;

