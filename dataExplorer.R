# import libraries
library(tidyverse)

# set working directory: /Users/christianmartinez/Downloads/trash/Yale Donations
setwd("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData")

# import data
df <- read_csv("yaleDonations.csv")

# plot a histogram 
hist(df$Annual_Gifts[!is.na(df$Annual_Gifts)], 
     main = "Annual Gifts", 
     xlab = "Annual Gifts", 
     ylab = "Frequency", 
     col = "blue", 
     breaks = 20)


# add a column to the data frame: "Annual_Gifts_1Y_difference" given the difference between the current year and the previous year. For each row, find the value of Annual_Gifts, find the value of Annual_Gifts in the row with the same "Class" but with a "Year" value of 1 less, and subtract the two values. The lag should be by "Year" column
df$Annual_Gifts_1Y_difference <- df$Annual_Gifts - lead(df2$Annual_Gifts, n = 1, order = df2$Class)

# replace Annual_Gifts_1Y_difference with NA if the Year is 2012
df$Annual_Gifts_1Y_difference[df$Year == 2012] <- NA

# plot a histogram
hist(df$Annual_Gifts_1Y_difference[!is.na(df$Annual_Gifts_1Y_difference)], 
     main = "Annual Gifts 1 Year Difference", 
     xlab = "Annual Gifts 1 Year Difference", 
     ylab = "Frequency", 
     col = "blue", 
     breaks = 20)
