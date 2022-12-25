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

# plot a scatterplot of Annual_Gifts_1Y_difference vs. Annual_Gifts_1Y_difference for the previous year
plot(lead(df$Annual_Gifts_1Y_difference, n = 1, order = df$Class), df$Annual_Gifts_1Y_difference, 
     main = "Annual Gifts 1 Year Difference vs. Annual Gifts 1 Year Difference for the Previous Year", 
     xlab = "Annual Gifts 1 Year Difference for the Previous Year", 
     ylab = "Annual Gifts 1 Year Difference ", 
     col = "blue", 
     pch = 20)

# copy the data frame
df2 <- df  

# add a column that is the value of Annual_Gifts_1Y_difference for the previous year
df2$Annual_Gifts_1Y_difference_previous <- lead(df2$Annual_Gifts_1Y_difference, n = 1, order = df2$Class)

# replace Annual_Gifts_1Y_difference_previous with NA if the Year is 2012
df2$Annual_Gifts_1Y_difference_previous[df2$Year == 2012] <- NA

# add a column that is the value of Annual_Gifts_1Y_difference 
df2$Annual_Gifts_1Y_difference <- df2$Annual_Gifts_1Y_difference

# replace Annual_Gifts_1Y_difference with NA if the Year is 2012
df2$Annual_Gifts_1Y_difference[df2$Year == 2012] <- NA

# plot a scatterplot of Annual_Gifts_1Y_difference vs. Annual_Gifts_1Y_difference for the previous year
plot(df2$Annual_Gifts_1Y_difference_previous, df2$Annual_Gifts_1Y_difference, 
     main = "Annual Gifts 1 Year Difference vs. Annual Gifts 1 Year Difference for the Previous Year", 
     xlab = "Annual Gifts 1 Year Difference for the Previous Year", 
     ylab = "Annual Gifts 1 Year Difference ", 
     col = "blue", 
     pch = 20)
