# import libraries
library(tidyverse)

# set working directory: /Users/christianmartinez/Downloads/trash/Yale Donations
setwd("/Users/christianmartinez/Downloads/trash/Yale Donations/processedData")

# WRANGLE DATA

# read in data from 2021
df2021 <- read_csv("2021.csv")
# turn participation column into numeric
df2021$Participation <- as.numeric(df2021$Participation)
# add year column
df2021$Year <- 2021
# drop "Alumni_Fund_Endowment_Income" column if any
df2021 <- df2021 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2020
df2020 <- read_csv("2020.csv")
# replace all non-numerics with NA values in df$Participation
df2020$Participation <- as.numeric(df2020$Participation)
# add year column
df2020$Year <- 2020
# drop "Alumni_Fund_Endowment_Income" column if any
df2020 <- df2020 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2019
df2019 <- read_csv("2019.csv")
# replace all non-numerics with NA values in df$Participation
df2019$Participation <- as.numeric(df2019$Participation)
# add year column
df2019$Year <- 2019
# drop "Alumni_Fund_Endowment_Income" column if any
df2019 <- df2019 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2018
# df2018 <- read_csv("2018.csv")
# replace all non-numerics with NA values in df$Participation
# df2018$Participation <- as.numeric(df2018$Participation)

# read in data from 2017
df2017 <- read_csv("2017.csv")
# replace all non-numerics with NA values in df$Participation
df2017$Participation <- as.numeric(df2017$Participation)
# add year column
df2017$Year <- 2017
# drop "Alumni_Fund_Endowment_Income" column if any
df2017 <- df2017 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2016
df2016 <- read_csv("2016.csv")
# replace all non-numerics with NA values in df$Participation
df2016$Participation <- as.numeric(df2016$Participation)
# add year column
df2016$Year <- 2016
# drop "Alumni_Fund_Endowment_Income" column if any
df2016 <- df2016 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2015
df2015 <- read_csv("2015.csv")
# replace all non-numerics with NA values in df$Participation
df2015$Participation <- as.numeric(df2015$Participation)
# add year column
df2015$Year <- 2015
# drop "Alumni_Fund_Endowment_Income" column if any
df2015 <- df2015 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2014
df2014 <- read_csv("2014.csv")
# replace all non-numerics with NA values in df$Participation
df2014$Participation <- as.numeric(df2014$Participation)
# add year column
df2014$Year <- 2014
# drop "Alumni_Fund_Endowment_Income" column
df2014 <- df2014 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2013
df2013 <- read_csv("2013.csv")
# replace all non-numerics with NA values in df$Participation
df2013$Participation <- as.numeric(df2013$Participation)
# add year column
df2013$Year <- 2013
# drop "Alumni_Fund_Endowment_Income" column
df2013 <- df2013 %>% select(-Alumni_Fund_Endowment_Income)

# read in data from 2012
df2012 <- read_csv("2012.csv")
# replace all non-numerics with NA values in df$Participation
df2012$Participation <- as.numeric(df2012$Participation)
# add year column
df2012$Year <- 2012
# drop "Alumni_Fund_Endowment_Income" column
df2012 <- df2012 %>% select(-Alumni_Fund_Endowment_Income)

# bind all dataframes together
df <- bind_rows(df2021, df2020, df2019, df2017, df2016, df2015, df2014, df2013, df2012)
# drop "Alumni_Fund_Endowment_Income" column
df <- df %>% select(-Alumni_Fund_Endowment_Income)

# write out to csv
write_csv(df, "yaleDonations.csv")

