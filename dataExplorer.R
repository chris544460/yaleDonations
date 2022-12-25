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

# We might ask ourselves, how can we predict future Annual Gifts changes? A naive approach would be to predict a year's Annual Gifts changes using the previous year's Annual Gifts changes. I plot a scatterplot of the previous year's Annual Gifts changes against the current year's Annual Gifts changes. I obtain the scatterplot below. I do this in `dataExplorer.R`.

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



# We might also ask ourselves, how can we predict future Annual Gifts? A naive approach would be to predict a year's Annual Gifts using the previous year's Annual Gifts. I plot a scatterplot of the previous year's Annual Gifts against the current year's Annual Gifts. I obtain the scatterplot below.

# plot a scatterplot of Annual_Gifts vs. Annual_Gifts for the previous year
plot(lead(df$Annual_Gifts, n = 1, order = df$Class), df$Annual_Gifts, 
     main = "Annual Gifts vs. Annual Gifts for the Previous Year", 
     xlab = "Annual Gifts for the Previous Year", 
     ylab = "Annual Gifts ", 
     col = "blue", 
     pch = 20)



# import library
library(zoo)

# plot a graph of total Annual_Gifts (this is the sum of all Annual_Gifts for which the year is the relevant yesar) by Year: from 2012 to 2021
plot(df %>% group_by(Year) %>% summarise(Total_Annual_Gifts = sum(Annual_Gifts)), 
     type = "l", 
     col = "blue", 
     lwd = 2, 
     xlab = "Year", 
     ylab = "Total Annual Gifts", 
     main = "Total Annual Gifts")


df3 <- df %>% group_by(Year) %>% summarise(Total_Annual_Gifts = sum(Annual_Gifts))

# plot a rolling average of Annual_Gifts with a dashed line
f1 <- rollapply(df3$Total_Annual_Gifts, width = 2, FUN = mean, align = "right", fill = NA)

plot(df3, type = "l", col = "blue", lwd = 2, xlab = "Year", ylab = "Annual Gifts", main = "Annual Gifts")
lines(f1, col = "red", lwd = 2, lty = 2)

# We might ask ourselves, is the data stationary? To do so, we can do a Dickey-Fuller test. I do this in `dataExplorer.R`. However, we have a small range of years in the dataset (from 2012 to 2020), so the results are likely not to be reliable. So take the results from the Dickey-Fuller test with a grain of salt. I obtain the results below.

# import library
library(tseries)

# set up a dataframe for the time series
df3 <- df %>% group_by(Year) %>% summarise(Total_Annual_Gifts = sum(Annual_Gifts))

# perform a Dickey-Fuller test
adf.test(df3$Total_Annual_Gifts)

# We might also ask ourselves, is are the annual gifts changes stationary? To do so, we can do a Dickey-Fuller test. I do this in `dataExplorer.R`. I obtain the results below.

# import library
library(tseries)

# set up a dataframe for the time series
df3 <- df %>% group_by(Year) %>% summarise(Total_Annual_Gifts = sum(Annual_Gifts))

# sort the dataframe by Year, descending
df3 <- df3[order(df3$Year), ]

# add a column that is the difference between the current year's Annual_Gifts and the previous year's Annual_Gifts
df3$Total_Annual_Gifts_difference <-  df3$Total_Annual_Gifts - lag(df3$Total_Annual_Gifts, n = 1, order = df3$Year) 

# perform a Dickey-Fuller test. Drop the first row, which is NA
adf.test(df3$Total_Annual_Gifts_difference[-1])


# We might ask ourselves, is there autocorrelation in the total annual gifts? To do so, we can do an autocorrelation plot. I do this in `dataExplorer.R`. I obtain the plot below.

# import library
library(tseries)

# set up a dataframe for the time series
df3 <- df %>% group_by(Year) %>% summarise(Total_Annual_Gifts = sum(Annual_Gifts))

# sort the dataframe by Year, descending
df3 <- df3[order(df3$Year), ]

# add a column that is the difference between the current year's Annual_Gifts and the previous year's Annual_Gifts
df3$Total_Annual_Gifts_difference <-  df3$Total_Annual_Gifts - lag(df3$Total_Annual_Gifts, n = 1, order = df3$Year)

# plot an autocorrelation plot of annual gifts (not the difference)
acf(df3$Total_Annual_Gifts, main = "Autocorrelation Plot of Total Annual Gifts")

# plot an autocorrelation plot of annual gifts (the difference)
acf(df3$Total_Annual_Gifts_difference[-1], main = "Autocorrelation Plot of Total Annual Gifts Difference")
