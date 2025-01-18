select * from `1.maven_toy_data`;
-- top 5 best selling 

select Product_Name , sum(Units) as Total_sales
from `1.maven_toy_data`
group by Product_Name
order by Total_sales desc
LIMIT 5;
-- top 5 worst selling  

select Product_Name , sum(Units) as Total_sales
from `1.maven_toy_data`
group by Product_Name
order by Total_sales asc
LIMIT 5;
-- Sales based on store type 

select Store_Location , sum(Product_Price*Units) as Total_sales
from `1.maven_toy_data`
group by Store_Location
order by Total_sales desc;

-- which product category is most slow moving 

select Product_Category , sum(Stock_On_Hand) as total_stock
from `1.maven_toy_data`
group by Product_Category
order by total_stock desc
limit 5 ; 

-- which product  in each category category is most slow moving 

select Product_Name,Product_Category , sum(Stock_On_Hand) as total_stock
from `1.maven_toy_data`
group by Product_Name,Product_Category
order by total_stock desc
limit 5 ; 

-- Basket analysis ( prodeuct frequently bought together)

select a.Product_Name as product_a , b.Product_Name as product_b,count(*) as frequency
from `1.maven_toy_data` a 
join `1.maven_toy_data` b 
on a.Sale_ID = b.Sale_ID and a.Product_ID <> b.Product_ID
group by product_a , product_b
order by frequency desc
limit 5;

-- Product frequently out of stock

select Product_Name , count(*) as stock_instance
from `1.maven_toy_data`
where Stock_On_Hand = 0
group by Product_Name
order by stock_instance desc
limit 5 ;
