
# KPI-Driven Sales Analytics for Maven Toy Company

This project focuses on analyzing Key Performance Indicators (KPIs) to evaluate sales trends, product performance, customer purchasing behavior, and inventory efficiency for Maven Toy Company. By leveraging SQL-based analysis, data visualization, and business intelligence techniques, the project provides actionable insights to help decision-makers optimize sales strategies, improve operational efficiency, and drive data-driven decision-making.


## Table of Contents

1. [Summary](#summary)
2. [Ask Phase](#ask-phase)
   - [Business Task](#business-task)
3. [Prepare Phase](#prepare-phase)
   - [Dataset Used](#dataset-used)
   - [Accessibility and privacy of data](#accessibility-and-privacy-of-data)
   - [Information about our dataset](#information-about-our-dataset)
   - [Data Organization and verification](#data-organization-and-verifaication)
   -[Data Credibility and Integrity](#data-credibility-and-integrity)
4. [Process Phase](#process-phase)
   - [Data Cleaning](#data-cleaning)
   - [Duplicate Handling](#duplicate-handling)
   - [Data Merging](#data-merging)
5. [Analyze and Share Phase](#analyze-and-share-phase)
  - [Top-Selling Products](#top-selling-products)
- [Frequent Stockouts](#frequent-stockouts)
- [Store Performance](#store-performance)
- [Overstocked Products](#overstocked-products)
- [Frequently Bought Together (Basket Analysis)](#frequently-bought-together-basket-analysis)
6. [KPI Dashboard](#kpi-dashboard)
- [Overview](#overview)
- [Key Metrics Tracked](#key-metrics-tracked)
- [Business Significance](#business-significance)
- [Dashboard Access](#dashboard-access)
7. [Conclusion (Act Phase)](#conclusion-act-phase)


## Summary

Maven Toys is a leading retailer in the toy and entertainment industry, offering a diverse selection of products designed to foster creativity, learning, and play. With a strong presence across multiple store locations, the company has established itself as a trusted destination for high-quality toys, games, and educational products.

Committed to innovation and customer satisfaction, Maven Toys curates a product range that includes art and crafts, board games, action figures, outdoor play equipment, and STEM-based learning kits. Its omnichannel retail strategy integrates physical stores and online platforms to enhance accessibility and convenience for customers.

By prioritizing product diversity, strategic store placement, and an engaging shopping experience, Maven Toys continues to strengthen its market position. The company remains focused on adapting to evolving consumer trends while maintaining its reputation for quality and excellence in the toy industry. 
## Ask Phase 

### Business Task
Analyze sales and inventory data to optimize stock levels, reduce stockouts, and enhance revenue performance.

Stakeholders:
- **Supply Chain Managers** – Ensure efficient inventory replenishment and minimize stock imbalances.
- **Retail Store Operators**– Manage on-ground stock availability and align with customer demand.
- **Marketing Executives** – Use sales insights to develop targeted promotions and pricing strategies.
- **Financial Analysts** – Assess financial impact and recommend cost-effective inventory management solutions.
## Prepare Phase

### Dataset Used
The dataset utilized for this analysis is the Maven Toy Company dataset, which was directly obtained from the company itself, ensuring authenticity and reliability.

### Accessibility and privacy of data

The Maven Toy Company dataset used in this analysis is openly available, ensuring accessibility for research and analysis purposes. As an open-source dataset, it allows for transparency and reproducibility while adhering to ethical data usage standards. However, despite its open nature, users should ensure compliance with relevant data privacy guidelines and industry best practices when handling and sharing the data.

### Information about our dataset
The dataset used for this analysis originates from **Maven Toys' sales and inventory management system**, providing a comprehensive view of transactional and operational data across multiple store locations. It includes key attributes such as **transaction dates, store locations, product categories, unit sales, inventory levels, and pricing details**, enabling a detailed examination of sales performance and stock availability. The dataset integrates information from various sources, including **sales transactions, inventory logs, and store-specific attributes**, ensuring a holistic perspective on business operations. This data is essential for identifying **sales trends, optimizing stock levels, and enhancing revenue performance** through data-driven decision-making. By leveraging this dataset, the analysis aims to provide actionable insights for **inventory management, demand forecasting, and strategic business planning**.

### Data Organization and verification


The provided dataset contains structured business data related to **sales, inventory, product details, store locations, and calendar events**. This dataset is essential for analyzing sales trends, optimizing stock levels, and understanding store performance across various locations. The data originates from **Maven Toys' business operations**, tracking transactional details, product attributes, and store-specific metrics over a defined period. The dataset integrates multiple sources, ensuring a **comprehensive view of sales, inventory management, and business insights** to drive data-driven decision-making.  

Below is a structured table detailing each dataset, its format, and its significance:  

---

### Dataset Table  

| **Table Name**            | **Type**               | **Description**  |
|---------------------------|------------------------|-------------------------------------------------------------|
| **sales.csv**             | CSV File               | Contains transactional sales records, including date, store ID, product ID, and units sold. |
| **products.csv**          | CSV File               | Provides product details such as product ID, name, category, cost, and price. |
| **inventory.csv**         | CSV File               | Tracks stock levels at various store locations for different products. |
| **stores.csv**            | CSV File               | Includes store information such as store ID, name, location type, and city. |
| **calendar.csv**          | CSV File               | Contains date-related attributes to analyze sales trends over time. |
| **data_dictionary.csv**   | CSV File               | Provides metadata for all dataset attributes, ensuring clarity and consistency in data interpretation. |

This dataset serves as the foundation for business analysis, allowing for insights into **sales performance, inventory management, product demand, and store operations**.

### Data Credibility and Integrity


Ensuring the reliability and accuracy of the dataset is paramount for deriving meaningful insights and making data-driven decisions. The dataset used in this analysis originates from Maven Toys’ internal business systems, which track sales transactions, inventory levels, and store performance metrics. To maintain data integrity, multiple verification processes were implemented, including cross-referencing sales records with inventory updates, validating store attributes against official business records, and ensuring product details align with standardized classifications. Additionally, consistency checks were performed to identify and resolve discrepancies, such as missing values, duplicate entries, and anomalies in transactional data. The dataset underwent data cleaning procedures to correct formatting inconsistencies and align date structures for accurate trend analysis. By leveraging reliable data sources and applying rigorous validation methods, the dataset ensures a high level of authenticity, supporting accurate business analysis and strategic decision-making.
## Process Phase
To ensure data accuracy and efficiency in analysis and dashboard creation, Excel and Python were utilized for data preparation. Excel was employed for initial data cleaning, allowing for an intuitive approach to identifying and resolving inconsistencies, while Python provided robust capabilities for advanced data manipulation and integration.

### Data Cleaning
The datasets were first opened in Excel for a preliminary review, enabling the identification of missing values and formatting inconsistencies. Null values were systematically addressed—irrelevant missing data was removed to maintain dataset integrity, while necessary null values, such as those in the “Stock in Hand” column, were replaced with 0 to prevent misinterpretation during analysis.

### Duplicate Handling

Duplicate records were identified and removed to prevent skewed results. Rather than relying on a single-column check (such as Product ID, which may naturally repeat for different stores), comparisons were conducted across multiple columns to ensure duplicate detection was accurate and did not mistakenly remove legitimate data entries.

### Data Merging

Once the cleaned datasets were finalized, Python was used to merge them into a single consolidated CSV file, facilitating seamless data analysis and visualization. This integration step ensured that sales, inventory, product, and store information were aligned efficiently, enabling comprehensive insights for strategic decision-making.

**Python Code for Merging Datasets**  
```python
# Import necessary libraries
import pandas as pd

# Load datasets
sales_df = pd.read_csv("sales.csv")       # Sales transaction data
products_df = pd.read_csv("products.csv") # Product details
inventory_df = pd.read_csv("inventory.csv") # Inventory levels
stores_df = pd.read_csv("stores.csv")     # Store location details
calendar_df = pd.read_csv("calendar.csv") # Date-related attributes

# Merge sales data with product details using 'Product_ID' as the key
sales_products_df = sales_df.merge(products_df, on="Product_ID", how="left")

# Merge the result with store details using 'Store_ID' as the key
sales_products_stores_df = sales_products_df.merge(stores_df, on="Store_ID", how="left")

# Merge with inventory data to include stock levels
sales_products_stores_inventory_df = sales_products_stores_df.merge(inventory_df, on=["Store_ID", "Product_ID"], how="left")

# Merge with calendar data to add date-based attributes
final_merged_df = sales_products_stores_inventory_df.merge(calendar_df, on="Date", how="left")

# Save the final merged dataset to a new CSV file
final_merged_df.to_csv("merged_dataset.csv", index=False)

# Print confirmation message
print("Datasets successfully merged and saved as 'merged_dataset.csv'.")
```
Usage Notes
- Ensure all datasets (sales.csv, products.csv, inventory.csv, stores.csv, calendar.csv) are in the same directory as the script.
- Modify the on parameter in merge() if column names differ in your dataset.
- The "left" join ensures that all sales records are retained, even if some corresponding details are missing.

## Analyze and Share Phase

In this phase, **Exploratory Data Analysis (EDA)** is conducted to extract meaningful insights from the dataset. SQL is utilized to **answer key business questions**, providing a data-driven foundation for decision-making. By analyzing sales trends, inventory levels, and store performance, this phase aims to identify actionable opportunities that enhance overall business operations.  

### **1️⃣ What are the top-performing products in terms of sales?**  
```SQL
select Product_Name , sum(Units) as Total_sales
from `1.maven_toy_data`
group by Product_Name
order by Total_sales desc
LIMIT 5;
```
 - **Colorbuds** led sales with **104,368 units sold**, followed by **PlayDoh Can (103,128 units)** and **Barrel O’ Slime (91,663 units)**.  
- These products represent **high-demand items** and should be prioritized for restocking and promotional strategies.  
- Bundling strategies can be explored, especially for frequently bought-together items identified in the basket analysis.  


### **2️⃣ Which products frequently go out of stock?**  

```SQL
select Product_Name , count(*) as stock_instance
from `1.maven_toy_data`
where Stock_On_Hand = 0
group by Product_Name
order by stock_instance desc
limit 5 :
```
 - **Action Figure (5,035 stockouts)** and **Hot Wheels 5-Pack (4,853 stockouts)** were the most frequently unavailable products.  
- Persistent stock shortages indicate **supply chain inefficiencies**, requiring improved demand forecasting and supplier coordination.  
- Implementing automated stock alerts and supplier agreements can help **minimize lost sales** due to stockouts.  

### **3️⃣ Which store locations generate the highest revenue?**  

```SQL
select Store_Location , sum(Product_Price*Units) as Total_sales
from `1.maven_toy_data`
group by Store_Location
order by Total_sales desc;
```
- **Downtown stores generated the highest revenue ($8.2M),** significantly outperforming other locations.  
- **Airport stores recorded the lowest revenue ($1.2M),** suggesting a need to optimize product offerings or revise pricing strategies.  
- Commercial and residential stores show **moderate performance**, presenting opportunities for **localized product curation and targeted promotions**.  

### **4️⃣ Which product categories have excess inventory?**  
```SQl
select Product_Category , sum(Stock_On_Hand) as total_stock
from `1.maven_toy_data`
group by Product_Category
order by total_stock desc
limit 5 ; 
```
- **Art & Crafts (6.5M units) and Games (5.5M units) held the most excess inventory**, leading to high holding costs.  
- Overstocked items should be **targeted for promotional campaigns or bundled with high-demand products** to improve turnover.  
- Dynamic discounting models can be implemented to **gradually clear excess stock without heavy markdown losses**.  

### **5️⃣ Which products were frequently bought together?**
```SQL
select a.Product_Name as product_a , b.Product_Name as product_b,count(*) as frequency
from `1.maven_toy_data` a 
join `1.maven_toy_data` b 
on a.Sale_ID = b.Sale_ID and a.Product_ID <> b.Product_ID
group by product_a , product_b
order by frequency desc
limit 5;

```
- **PlayDoh Can & Colorbuds** were frequently purchased together, suggesting a strong correlation between art supplies and creativity-based products.  
- **Hot Wheels 5-Pack & Action Figure** showed repeated co-purchases, emphasizing demand for collectible and toy vehicle categories.  
- **Deck of Cards & Magic Sand** were commonly bought together, indicating interest in a mix of tabletop games and creative sand products.  
- Bundling these frequently bought-together items into **combo deals or promotional discounts** can help **increase basket size and boost revenue**.  


## **6. KPI Dashboard**

### **Overview**
The KPI Dashboard provides a **comprehensive view** of key business metrics, allowing stakeholders to track performance, identify trends, and make data-driven decisions. Designed to be **interactive and user-friendly**, the dashboard consolidates insights from sales, inventory, and store performance, enabling real-time monitoring of critical business indicators.

### **Key Metrics Tracked**
The dashboard focuses on the following **Key Performance Indicators (KPIs):**

- **Total Sales Revenue** – Measures overall sales performance across all stores.
- **Best-Selling Products** – Identifies top-performing items based on unit sales and revenue.
- **Stock Availability** – Tracks product inventory levels to prevent stockouts and overstocking.
- **Frequent Stockouts** – Highlights items that frequently go out of stock, indicating potential supply chain issues.
- **Store Revenue Performance** – Compares sales performance across different store locations (Downtown, Commercial, Residential, Airport).
- **Inventory Turnover Rate** – Evaluates how efficiently stock is moving through the supply chain.
- **Basket Analysis (Frequently Bought Together)** – Shows product pairings frequently purchased together to enhance bundling strategies.

### **Business Significance**
Each KPI plays a crucial role in **performance evaluation and strategic decision-making:**
- **Sales revenue and best-selling products** help prioritize high-performing products for stock optimization.
- **Stock availability and frequent stockouts** aid in refining supply chain efficiency.
- **Store performance analysis** supports expansion strategies and localized marketing efforts.
- **Inventory turnover rate** ensures that capital is not tied up in slow-moving stock.
- **Basket analysis insights** enable cross-selling opportunities, increasing overall basket size and revenue.

### **Dashboard Access**
To interact with the KPI Dashboard, access the following link:  
➡ **[Maven Toys KPI Dashboard](https://public.tableau.com/app/profile/shalabh.yadav/viz/maven_toy_KPI_dashboard/Dashboard1?publish=yes)** 

By leveraging this **KPI Dashboard**, Maven Toys can optimize its operations, enhance customer satisfaction, and drive business growth with **real-time, data-driven insights**.
## **7. Conclusion (Act Phase)**  

The analysis of Maven Toys' sales, inventory, and store performance has provided valuable insights into key areas for business optimization. By leveraging data-driven strategies, the company can improve its operational efficiency, enhance product availability, and drive revenue growth. Below are the key findings and actionable recommendations based on the data analysis.  

---

### **Findings and Recommendations**  

| **Recommendation** | **Description** |
|--------------------|----------------|
| **1. Optimizing Stock for Best-Selling Products** | High-demand products such as Colorbuds, PlayDoh Can, and Barrel O’ Slime frequently sell out, leading to missed sales opportunities. Maven Toys should improve demand forecasting and prioritize stock replenishment for these products to maximize revenue potential. |
| **2. Addressing Frequent Stockouts** | Items such as Action Figures and Hot Wheels 5-Pack experience persistent stock shortages, indicating inefficiencies in supply chain planning. Implementing automated stock alerts and strengthening supplier coordination can help prevent inventory gaps. |
| **3. Enhancing Store-Specific Strategies** | Downtown stores generate the highest revenue, while airport stores underperform. Expanding in high-traffic areas and adjusting product selections in low-performing locations can improve profitability. |
| **4. Managing Overstocked Inventory** | Overstocked categories, such as Art & Crafts and Games, lead to high holding costs. Targeted clearance sales, dynamic discounting, and bundling with high-demand products can improve inventory turnover. |
| **5. Leveraging Basket Analysis for Cross-Selling** | Frequently bought-together products, such as PlayDoh Can and Colorbuds, present opportunities for bundle promotions. Implementing targeted product pairings and discounts can increase basket size and enhance customer engagement. |

---

### **Additional Insights**  

- **Ensuring product availability for top-selling items** is critical to maintaining customer satisfaction and maximizing sales.  
- **Optimizing store-specific performance** through strategic expansion and tailored product assortments can improve overall revenue.  
- **A data-driven approach to inventory management** will help balance stock levels, preventing both overstocking and stockouts.  
- **Cross-selling opportunities based on purchasing patterns** can be leveraged to drive additional revenue and increase customer retention.  

By implementing these insights, Maven Toys can strengthen its market position, improve operational efficiency, and drive long-term business growth through strategic decision-making.
