
# Atliq Dashboard

## Project Background

This dashboard was created for Atliq, a computer hardware and peripheral products supplier in India. The dashboard will be used by Bhavin Patel, the sales director of the Delhi headquarter office to track sales of markets all across India. It will also help the company's sales analysts save time from gathering data manually and divert their energy elsewhere. 

Prior to the project, the data analytics team met with Bahvin to discuss the dimensions of the project by using the AIMS grid. The dimensions are as follows:

**Purpose:** To unlock sales insights that are not visible before to support the sales team in decision making & reduce manual time spent in data gathering.

**Stakeholders:** sales director, marketing team, customer service team, data & analytics team, IT

**End result:** An automated dashboard providing quick and latest sales insights in order to support data driven decision making

**Success criteria:** Dashboard(s) uncovering sales order insights with latest data available. Sales analyst stop data gathering manually in order to save 20% of their business time and divert value elsewhere.

## Data Structure

The companies main database structure as seen below consists of five tables: sales products, sales transactions, sales date, sales customers, and sales markets with more than 150,000 records. An entity relationship diagram of the tables is as follows:

![ERD_snapo](https://github.com/huizliang/PowerBI/blob/main/Atliq_sales_ERD.png)

### Steps Followed

- Step 1 : Load data into MySQL to perform brief exploratory analysis and note any data discrepancies.
- Step 2 : Load data into Power BI Desktop from MYSQL. 
- Step 3 : Identify duplicated records and filter them.
- Step 4 : Filter sales transactions that took place outside of India, or had 0 or -1 as sales_amount.
- Step 6 : Create new column titled 'norm_sales_amount' and convert records with USD as currency to INR to match the rest of the transactions.
- Step 7 : Filter records with blank product_codes.
- Step 8 : Create new measure to calculate revenue using DAX: Revenue = sum('sales transactions'[norm_sales_amount])
- Step 9 : Create new measure to calculate totol Sales Qty using DAX: Sales Qty = sum('sales transactions'[sales_qty])
- Step 10 : Created card visual to display revenue and sales qty.
- Step 11 : Created stacked bar chart to show revenue by markets.
- Step 12 : Created stacked bar chart to sales qty by markets.
- Step 13 : Added slicer for year, month, and market name.
- Step 14 : Added line chart for historical revenue trend by month. 
- Step 15 : Added stacked bar chart to show top 5 markets by revenue.
- Step 16 : Added stacked bar chart to show top 5 products by revenue.
- Step 17 : Added matrix to display YOY changes in revenue and sales quantity.
- Step 17 : Created a version of dashboard for mobile view.

## Snapshot of Dashboard (Power BI Desktop)

![dashboard_snapo](https://github.com/huizliang/PowerBI/blob/main/Atliq_Sales_Dashboard.png)
 
 ## Snapshot Mobile View Dashboard (Power BI DESKTOP)
 
![Dashboard_upload](https://github.com/huizliang/PowerBI/blob/main/Atliq_Sales_mobile_view.png)



[Dataset Source](https://codebasics.io/resources/sales-insights-data-analysis-project)
