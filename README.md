#  Pizza Sales Analytics Report

##  Problem Statement
Pizza restaurants generate large amounts of transactional data every day — from orders, categories, and sizes to total revenue.  
The goal is to analyze sales trends and uncover insights that can help improve marketing, inventory, and operational decisions.

### Objectives
- Identify daily, weekly, and monthly sales patterns  
- Determine best and worst-performing pizza categories  
- Understand revenue contribution by size and category  
- Calculate KPIs like Total Revenue, Total Pizzas Sold, and Average Order Value  
- Build interactive dashboards using Power BI and Excel  
- Connect MySQL database to Power BI and Excel for real-time updates  

##  Tech Stack & Tools
- **MySQL Workbench** – Data storage, cleaning, and transformation  
- **Excel Dashboard** – Visual summary and KPI metrics  
- **Python (Google Colab)** – EDA, data wrangling, visualization  
  - Libraries: `Pandas`, `NumPy`, `Matplotlib`, `Seaborn`, `Plotly`
- **Power BI** – Interactive dashboard and DAX-based measures  
- **GitHub** – Version control and documentation  

##  Key Steps
1. **Data Extraction:** Imported CSV data into MySQL database  
2. **Data Cleaning:** Handled missing values, formatted dates, standardized columns  
3. **EDA in Python:** Performed exploratory data analysis and plotted key visuals  
4. **SQL Analysis:** Aggregated KPIs – total orders, revenue by category, daily/weekly/monthly sales  
5. **Dashboard Design:** Built interactive Power BI and Excel dashboards  
6. **Insights Generation:** Interpreted visuals to derive actionable findings  


## Important Charts
1. **Weekly Sales Trend** – Line chart showing how pizza orders vary week to week
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/d9dcb323df14582770d860475da84ed1d9e0b40c/weekly_revenue.png" width="500"/>
   
2. **Monthly Orders Trend** – Area chart highlighting total orders and seasonal peaks
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/main/Monthly_Trends.png" width="500"/>

3. **Category-Size Heatmap** – Heatmap showing sales distribution across pizza categories and sizes
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/main/Heatmap_CategoryWise.png" width="500"/>

4. **Top 5 Pizzas by Revenue** – Horizontal bar chart displaying highest-earning pizzas
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/main/Top5%20Pizzas.png" width="500"/>

5. **Bottom 5 Pizzas by Revenue** – Bar chart showing least-performing pizzas
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/main/Bottom5%20Pizzas.png" width="500"/>

6. **Pizza Category Sales %** – Pie chart showing revenue contribution by each pizza category
<img src="https://github.com/drenu04/Pizza-Analytics-Report/blob/main/Sales_of_Pizza.png" width="500"/>


##  Key Insights
- **Top Category:** Classic pizzas generate the highest total revenue  
- **Best Size:** Large size contributes the most to sales volume  
- **Peak Day:** Friday and Saturday show maximum sales activity  
- **Monthly Trend:** Sales spike during weekends and holidays  
- **Low Performers:** Some premium pizzas show low order frequency — may require re-pricing or promotions  

##  KPIs
| Metric | Formula | Purpose |
|--------|----------|----------|
| Total Revenue | `SUM(order_price)` | Overall income from pizza sales |
| Total Pizzas Sold | `COUNT(order_id)` | Volume of sales |
| Avg Order Value (AOV) | `Total Revenue / Total Orders` | Customer spending behavior |
| Top Category | `MAX(SUM(revenue) GROUP BY category)` | Category performance |
| Peak Sales Day | `MAX(SUM(revenue) GROUP BY weekday)` | Demand trend |


##  How to Use
1. Open `.pbix` file in **Power BI Desktop**
2. Use **slicers** for date, size, and category filters  
3. Hover over charts for detailed tooltips  
4. Open **Excel Dashboard** for summarized KPIs  
5. Use **MySQL connection** for real-time data refresh  


##  Conclusion
This project demonstrates how **SQL**, **Python**, **Power BI**, and **Excel** can work together to convert raw pizza sales data into **actionable insights**.  
It provides clarity on sales behavior, customer preferences, and revenue trends — supporting better business decisions.
