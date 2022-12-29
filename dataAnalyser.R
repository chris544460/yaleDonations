# import libraries
library(tidyverse)

# set working directory: /Users/christianmartinez/Downloads/trash/Yale Donations
setwd("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData")

# import data
df <- read_csv("yaleDonations.csv")

### Relationship between Annual Gifts and Years Since Graduation

# copy df to df2
df2 <- df
# convert class year to numeric, excluding errors (e.g. 1931-1939)
df2$Class <- as.numeric(df2$Class, na.rm = TRUE)
# years since graduation is the year of donation minus the year of graduation. Create a new column for this.
df2$Years_Since_Graduation <- df2$Year - df2$Class

# run a regression of donation amount on years since graduation + Class. Use only data where Class is between 2012 and 2021.
df2 <- df2 %>% filter(Class >= 2012 & Class <= 2021 & Class != 2017) 
# run a regression of donation amount on years since graduation + Class
reg <- lm(Annual_Gifts ~ Years_Since_Graduation + Class, data = df2)
# print summary of regression
summary(reg)
