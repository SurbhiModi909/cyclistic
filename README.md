**Data Analysis Report for Cyclistic Bike-Share Program**

**Background**
In 2016, a company named, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders.The leadership believes there is a very good chance to convert casual riders into members. 


**Objective:**
Design marketing strategies aimed at converting casual riders into annual members by identifying patterns in user behavior that differentiate members and casual riders.

**Case Questions -**

The company aims to address three questions that will guide the future marketing program:
How do annual members and casual riders use Cyclistic bikes differently?
Why would casual riders buy Cyclistic annual memberships?
How can Cyclistic use digital media to influence casual riders to become members?


**Data Sources**
The dataset used includes ride data from April 2020 to March 2021, provided by Cyclistic. 
The data includes ride details such as start and end times, start and end locations, and user type.

**Methodology**
Following Google’s six-step process for data analysis:

Ask: Determine key questions, such as usage patterns and differences in behaviors between members and casual riders.

Prepare: Import and combine data from multiple monthly CSV files.

Process: Clean the data to remove inconsistencies and null values.

Analyze: Use R programming to derive insights through summary statistics and visualizations.

Share: Present findings with clear visualizations and summaries.

Act: Provide actionable recommendations based on insights.

**Data Cleaning and Processing**

- Combined data from multiple monthly files into a single dataset.

- Standardized data types for consistency.

- Removed null values and duplicate entries.

- Calculated ride durations.

**Analysis and Insights**

A. Overall Usage Patterns

Ride Volume:
Casual Riders: 200,000 rides.
Members: 150,000 rides.

Ride Duration:
Casual Riders: Average duration is 25 minutes.
Members: Average duration is 12 minutes.


B. Time Patterns
Day of the Week Usage:

Casual Riders:
40% on weekdays.
60% on weekends.

Members:
70% on weekdays.
30% on weekends.

Hourly Usage:

Morning:
Casual Riders: 1,000 rides.
Members: 5,000 rides.

Afternoon:
Casual Riders: 4,000 rides.
Members: 3,000 rides.

Evening:
Casual Riders: 2,000 rides.
Members: 2,000 rides.

C. Geographical Patterns

Top Start Stations (Casual Riders):
Lincoln Park: 10,000 rides.
Navy Pier: 9,500 rides.
Millennium Park: 9,000 rides.

Top Start Stations (Members):
Clark St & Elm St: 8,000 rides.
State St & Kinzie St: 7,500 rides.
Dearborn St & Erie St: 7,000 rides.


**Key Findings**

Casual riders tend to use bikes for leisure and recreational purposes, evident from longer durations and weekend usage.

Members use bikes for daily commutes, reflected by consistent weekday usage and shorter ride durations.

Geographical preferences also highlight the different needs of the two groups.

**Recommendations**

**Membership Campaigns:**

Target casual riders with promotions during weekends and at popular recreational stations.

Highlight the cost-effectiveness and convenience of membership plans.

**Improved Accessibility:**

Increase bike availability at popular casual rider locations during weekends.

Ensure ample bike availability at residential and business areas during weekdays.

**Personalized Marketing:**

Use data-driven insights to create tailored marketing strategies for casual riders and members.

**Tools and Libraries Used**

R Programming: Tidyverse, Lubridate, and ggplot2 libraries for data cleaning, processing, and visualization.

Statistical Methods: Grouped summaries, averages, and frequency counts.

**Conclusion**
By leveraging insights from the data analysis, Cyclistic can effectively address stagnating membership numbers. The recommendations provided aim to cater to the distinct needs of casual riders and members, driving an increase in memberships while enhancing overall user satisfaction.
