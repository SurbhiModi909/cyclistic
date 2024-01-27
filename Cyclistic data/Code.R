install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("readr")
library(tidyverse)
library (lubridate)
library(ggplot2)
library(readr)

##PROCESS

#Importing Data

April_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/April 2020.csv")
May_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/May 2020.csv")
June_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/June 2020.csv")
July_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/July 2020.csv")
August_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/August 2020.csv")
September_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/September 2020.csv")
October_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/October 2020.csv")
November_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/November 2020.csv")
December_2020 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/December 2020.csv")
Jan_2021 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/Jan 2021.csv")
Feb_2021 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/Feb 2021.csv")
March_2021 <- read_csv("C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/March 2021.csv")

#Data Cleaning and Processing
#Combine all the files

#Set the path to the folder containing your files
path <- "C:/Users/SurbhiModi(Intern)/OneDrive - Ampcus Inc/Desktop/Raw Data Cyclistic/"

#Create a vector of file names 
file_names <- paste(path, c("April 2020.csv", "May 2020.csv", "June 2020.csv", "July 2020.csv", "August 2020.csv", "September 2020.csv", "October 2020.csv", "November 2020.csv", "December 2020.csv", "Jan 2021.csv", "Feb 2021.csv", "March 2021.csv"), sep = "")

#Read and combine the files
bike_data <- file_names %>%
  map_df(~read_csv(.))

#There is an error due to inconsistency in data types across the different data frames.
#Converting data types before combining

bike_data <- file_names %>%
  map_df(~read_csv(.) %>%
           mutate(
             start_station_id = as.character(start_station_id),
             end_station_id = as.character(end_station_id)
           ))
#Checking the Consistency in data 
str(read_csv(file_names[1]))
str(read_csv(file_names[2]))

#Reviewing the Data

#First Rows of Data
head(bike_data)

#Summary of the Data
summary(bike_data)

#Structure of the Data
str(bike_data)

#There are 4738 null values in end_lat and end_lng columns. Removing these columns with missing values.
bike_data <- drop_na(bike_data)

bike_data <- bike_data %>%
  distinct()

summary(bike_data)

##ANALYSIS

#A.) OVERALL USAGE PATTERN 

#Comparing number of rides of Casual Riders Vs Members
bike_data %>%
  group_by(member_casual) %>%
  summarise(number_of_rides = n())

#Calculating duration of each ride
bike_data <- bike_data %>%
  mutate(duration = as.numeric(difftime(ended_at, started_at, units = "mins")))

#Calculating the average 
bike_data %>%
  group_by(member_casual) %>%
  summarise(average_duration = mean(duration, na.rm = TRUE))

#B.) TIME PATTERN

#Calculating usage by the day of the week
bike_data %>%
  mutate(day_of_week = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, day_of_week) %>%
  summarise(number_of_rides = n()) %>%
  arrange(member_casual, day_of_week)

#Calculating usage by the hour of the day
bike_data %>%
  mutate(hour_of_day = hour(started_at)) %>%
  group_by(member_casual, hour_of_day) %>%
  summarise(number_of_rides = n()) %>%
  arrange(member_casual, hour_of_day)

hourly_usage <- bike_data %>%
  mutate(hour_of_day = hour(started_at)) %>%
  group_by(member_casual, hour_of_day) %>%
  summarise(number_of_rides = n(), .groups = 'drop') %>%
  arrange(member_casual, hour_of_day)

print(hourly_usage, n = 48)

#C.) GEOGRAPHICAL PATTERN

#Top 10 Popular Start Stations for each type of riders
bike_data %>%
  group_by(member_casual, start_station_name) %>%
  summarise(number_of_rides = n()) %>%
  arrange(desc(number_of_rides)) %>%
  top_n(10)

#Top 10 Popular End Stations for each type of riders

bike_data %>%
  group_by(member_casual, end_station_name) %>%
  summarise(number_of_rides = n()) %>%
  arrange(desc(number_of_rides)) %>%
  top_n(10)

bike_data %>%
  group_by(member_casual, end_station_name) %>%
  summarise(number_of_rides = n()) %>%
  arrange(desc(number_of_rides)) %>%
  top_n(10)

