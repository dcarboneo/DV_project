library(ggplot2) # For Data visualization & Graphs
library(dplyr) # For data wrangling and manipulation
library(zoo) # For strings and regex
library(tidyr)

fb_data <-read.csv("C:/Users/dcarb/Documents/Quarter 5/DataViz/Project/FB (1).csv")
goog_data <-read.csv("C:/Users/dcarb/Documents/Quarter 5/DataViz/Project/GOOG (1).csv")


merged_data = merge(fb_data, goog_data, by = "Date")

merged_data <- merged_data %>%
  mutate(change_fb = (Close.x - first(Close.x))/first(Close.x),
         change_goog = (Close.y - first(Close.y))/first(Close.y),
         smooth_fb = rollmean(change_fb,20, align = 'right', fill = 0),
         smooth_goog = rollmean(change_goog, 20, align = 'right', fill = 0),
         date = as.Date(Date))

ggplot(merged_data, aes(x = date)) +
  geom_line(aes(y = smooth_fb, color = 'blue')) +
  geom_line(aes(y = smooth_goog, color = 'red'))