# 🚴 Biker Project: Power BI Dashboard
## End-to-end Data Analysis Project: SQL and Power BI

This project involves building a comprehensive Power BI dashboard for **Toman Bike Share**. The dashboard provides insights into key performance metrics to support informed decision-making. 

[🔗 Power BI Dashboard Link](https://businesscollaborate-my.sharepoint.com/:u:/g/personal/asiphe_t_sedibada_co_za/EVvJUg07P19DrWce9PbcKxoBrLhL3uGplxYHgNYxTiysyQ?e=Zerl2R)

---

## 📊 Data Analysis Workflow

1. **Create a Database**
2. **Develop SQL Queries**
3. **Connect Power BI to the Database**
4. **Build the Dashboard in Power BI**
5. **Answer Key Analysis Questions**

---

## 📝 Project Specifications

The goal is to develop a dashboard showcasing critical metrics, including:

- **Hourly Revenue Analysis**
- **Profit and Revenue Trends**
- **Seasonal Revenue Insights**
- **Rider Demographics**

### Design Requirements
- Use **company colors** for consistency.
- Ensure **easy navigation** for users.

### Data Source
Access to company dataset: ensure you download the Microsoft Excel files attached to this project. Load the dataset into SQL after creating database. Write and execute the query provided in this project and connect it to Power BI Dashboard

### Additional Request
Provide an estimated timeline for project completion and recommendations for **price adjustments** next year.

### 📈 Insights from Data
- Hourly Trends: The highest earnings occur during midday and early evening hours (10:00–15:00).
- Weekly Patterns: Days like Wednesday and Friday experience significantly higher sales.
- Seasonal Peaks: Specific seasons show fluctuating demand, providing insights into profitable periods.
  
### 💡 Analysis and Recommendations
#### Central Question: Should we raise prices next year?
##### Price Increase Proposal
- Current Price: $3.99
- Proposed Price: $4.99 (a 25% increase)
##### Demand Analysis
- Increase in riders: 64%
- A moderate price increase (10-15%) is recommended for sustainable growth without negatively impacting demand.
##### Strategic Recommendations
- Market Research: Evaluate customer satisfaction, competitor pricing, and broader economic factors.
- Differentiated Pricing: Consider separate rates for casual and registered riders.
- Monitor & Adapt: Test new prices and adjust based on initial reactions to avoid alienating customers.

### 📆 Estimated Timeline
- Data Preparation: 2 hours
- Dashboard Development: 1 day
- Review & Adjustments: 1 hour
- Total: 2 days

Feel free to contribute or suggest enhancements!
📧 Contact me at asiphetyolo@gmail.com.


---

## 🛠️ SQL Query Used

Below is the SQL query to consolidate data for the dashboard:

```sql
-- Combine yearly data using UNION ALL
WITH cte AS (
    SELECT * FROM Bike_data.dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM Bike_data.dbo.bike_share_yr_1
)

-- Join with cost table to calculate revenue and profit
SELECT 
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,           -- Cost of Goods
    riders * price AS Revenue,
    (riders * price) - (COGS*riders) AS Profit
FROM cte a
LEFT JOIN Bike_data.dbo.cost_table b
ON a.yr = b.yr;

