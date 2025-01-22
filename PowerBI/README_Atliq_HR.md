# AtliQ (HR Dashboard)

## Project Background

Pinali M., an HR representative of AtliQ has reached out to the data analytics team to help the company build a dashboard to track employee attendance. The company will use the dashboard to derive insights about their employee’s attendance, wellness, and make smarter business decisions. During a meeting with Pinali and the company's co-founder, several goals for the dashboard were outlined. They are as follows:

* To gain insights about employee’s work setting preferences (home or office)
* To gain insights on trends of when employees are working from home or the office
* To gain insights on sick leave to better understand employee wellness
* To maximize attendance of in-office events 
* To reconsider infrastructure expenses and use expenses towards other areas of business
* To automate the collection of attendance data

## Data Structure & Initial Checks

The company has provided 3 months of attendance data. The dataset is stored in one Excel worksheet consisting of four tables: Apr 2022, May 2022, June 2022, Attendance Code. An entity relationship diagram of the tables is as follows:

![ERD_snapo](https://github.com/huizliang/PowerBI/blob/main/AtliQ_HR_ERD.png)

While exploring the data, it was observed that the days in each of the months served as the headers in each table. This was problematic because it meant that the tables could not be easily appended with future attendance information. Below are the steps followed to transform the data.

### Steps Followed to Transform Data

- Step 1 : Load dataset from Excel into Power BI Desktop.
- Step 2 : Duplicate dataset and name the new one "Template"
- Step 3 : In “Template”, filter out the “Attendance Key” table as this will not be used to build the dashboard and expand the table for April. 
- Step 4:  Make the top row the new header row.
- Step 5 : Delete the first row as it does not contain any useful information.
- Step 6 : Rename the first column to "Employee Code" and the second column to "Name".
- Step 8 : Select "Employee Code" and"Name" then unpivot all of the other columns. Now all of the other columns have been transposed into two columns.  
- Step 9 : Rename the new columns to "Date" and "Value"
- Step 10 : Change the data type of the “Date” to date. Remove errors (non-date data) in the column.
- Step 11 : Create a new parameter. Name it “worksheet” and type “Apr 2022” for value.
- Step 12 : Go back to “Template”. Under applied steps, edit “Filtered Rows” and apply the “Worksheet” parameter. 
- Step 13 : Right click on “Template” and create a new function. Name it “Get Data”
- Step 14 : Apply the new function to the original dataset. (Add column>Invoke custom function>Name it “GetData” and choose GetData). All of the data has been transformed to the same format as the data in "Template".
- Step 15 : Build dashboard with the transformed data.

 ## Snapshot of Mobile View Dashboard (Power BI DESKTOP)

![dashboard_snapo](https://github.com/huizliang/PowerBI/blob/main/AtliQ_HR_Dashboard.png)


### Main Insights

* The rate of employees working in the office shows a gradual decrease over the period. 
* The rate of employees working from home shows a gradual increase over the period. 
* Sick leave rates are low and only slightly increase over the period. 
* Monday, Tuesday, and Wednesday have the highest rates of employees working in the office (all 91%+)
* Friday (13%)  and Thursdays(11%) have the highest rates of employees working from home
* Monday (1.6%) has the highest rate of sick leave.


[Data Source](https://codebasics.io/resources/resume-project-data-analytics)


