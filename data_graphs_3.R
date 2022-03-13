library(ggplot2) # For Data visualization & Graphs
library(dplyr) # For data wrangling and manipulation
library(zoo) # For strings and regex
library(tidyr)

fb_data <-read.csv("C:/Users/dcarb/Documents/Quarter 5/DataViz/Project/FB.csv")

fb_data <- fb_data %>%
  mutate(date = as.Date(Date),
         seven_avg = rollmean(Close, 
                              10,
                              align = 'right',
                              fill = 0)) %>%
  filter(date > '2017-01-31')

ggplot(fb_data, aes(x = date, y = seven_avg)) +
  geom_line()
