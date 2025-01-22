# Cyclistic

## Project Background

Cyclistic is a bike-share program that has been serving the city of Chicago since 2016. Today the company owns over 5,824 bicycles and 692 docking stations. 

Although ridership has steadily grown throughout the years, converting more customers into annual members will be essential to the company’s growth. The goal of this project was to analyze the company's bike trip data from October 2023 to September 2024, uncover differences in the way members and non-members use bikes, and make recommendations for the marketing team to maximize resources to convert more non-members into members.

**Insights and recommendations are provided on the following key areas:**

* Ride behavior patterns of members and non-members: how long riders generally ride for
* Popular locations of rides: where rides start and end
* Seasonality pattern in usage of bikes: patterns throughout the day, weeks, months or seasons

To view the original dataset, click [here](https://divvy-tripdata.s3.amazonaws.com/index.html).

## Data Structure and Initial Checks

The data used for this project is made available through Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). The dataset contains 12 months of data. Each month is stored in a separate table and each row contains information about one trip. All of the tables have the same headers. In total, there are 5,854,544 rows in the combined dataset. 

Overview of column names and data types:

![Cyclistic_headers](https://github.com/user-attachments/assets/3f8009c1-82ef-4aed-b1e5-19e794ff411d)


Due to the large volume of the dataset, Python was the most efficient tool to use to gain familiarization with the data and to check the quality of the data. To view the codes used to clean and analyze the dataset in Python, click [here](https://github.com/huizliang/Cyclistic/blob/main/Cyclistic_tripdata2.ipynb).

## Executive Summary
After reviewing the dataset, several key differences between how members and non-members used bikes emerged:

* The **average ride length for casual rides is almost always twice as long as the average ride length of member rides**. This indicates that casual riders and member riders have different purposes for renting out bikes.
* All 10 of the **top busiest docking stations for casual riders are near city attractions**. This indicates that many casual riders are renting out bikes for sightseeing or leisure purposes. This would also explain why their ride lengths are generally longer than member riders. In contrast, all 10 of the **top busiest docking stations for member riders are concentrated in residential areas, business districts, or university districts**. This indicates that most member riders are renting out bikes for commuting reasons, which could also be why their average ride lengths are generally shorter than casual riders. 
* Rides for **casual riders steadily increase throughout the day and peak at around 4PM.** However, **rides for member riders peak around 8 AM, dip in the afternoon, and peak again at around 4PM**. This further confirms the hypothesis that the majority of casual riders are not people going to work. Instead, they may be vistiors to Chicago or residents who enjoy riding for leisure, whereas peak hours for member riders indicate that they are communting to work, school, or home because their peak hours are similar to traditional rush hours.
* The most **popular days for casual riders are Saturday and Sunday and the most popular days for member riders are Wednesday and Thursday**. Again, this further confirms that most casual riders are riding for leisure and most member riders are commuting.
* **Peak season for both types of riders are from late spring to early fall**. This is not surprising considering Chicago’s long winters but worth emphasizing as it is a factor that must be included in making marketing decisions.

Below is a visualization of the key findings:

![Cyclistic Dashboard 1](https://github.com/user-attachments/assets/3182ba88-424e-454d-b50e-bc68933a5b67)
![Cyclistic Dashboard 2](https://github.com/user-attachments/assets/7ec7fd6c-3b23-416b-a964-e0a937bd935e)


To view the visualizations in Tableau, click [here](https://public.tableau.com/app/profile/hui.liang/vizzes).

## Recommendations

* **Focus marketing efforts in areas and times where casual rides happen most frequently**: ideas include engaging casual riders in-person through bicycle education events and offering one time sign up discounts
* **Utilize existing members to convert non-members**: introduce a referral program, create fun events such as city scavenger hunts or contests that recognize riders for various accomplishments. Then invite members to post pictures and use hashtags to promote events on social media in order to increase awareness of member benefits.
* **Offer more than one option for annual membership**: currently there is only one option for membership which is an annual membership of $143.90 for an unlimited number of rides. This could be leaving out casual riders who only ride a few times a week and do not feel the price is justified. Additional options could be a membership that offers a limited number of rides for a specific price instead or a seasonal membership to capitalize on the influx of riders during the warmer months.

## Limitations 
Cyclistic currently offers 3 options for customers: single ride pass, full-day pass, and membership pass. Both the single ride pass and full-day pass option are considered casual rides in the dataset. About 1% of the rides in the dataset had ride lengths that were 0 seconds or negative seconds. They were removed from the dataset since they are not valid rides. 18% of the total rides did not have start station names or IDs.
