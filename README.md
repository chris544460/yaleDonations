# Yale Donations

## Introduction

Welcome to my exploration and analysis of alumni donations at Yale University. The goal of this project is to understand the factors that influence these donations and to identify opportunities for further analysis and improvement. Through my research, I have been able to uncover some interesting trends and patterns in the data, and I am excited to share my findings with you. I believe that this project has the potential to benefit both the university and its alumni community, and I am eager to continue exploring and analyzing the data to better understand these donations.

## Purpose

This is an exploration and analysis of Yale's Alumni Donations.

The goal of this project is to:
- explore the data and find interesting insights about the donations
- make recommendations to the development office about how to improve the donations
- develop a model to predict the amount of a donation

<!-- add a gif image with image address with size 5x5: https://www.google.com/url?sa=i&url=https%3A%2F%2Fgiphy.com%2Fexplore%2Fmagnifying-glass&psig=AOvVaw3QG9uAm-Fnb7_UecRkxHf3&ust=1671954255901000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCPjM447hkfwCFQAAAAAdAAAAABAD-->
<!-- ![Magnifying Glass](https://media2.giphy.com/media/42wQXwITfQbDGKqUP7/giphy.gif) -->

## Summary of Findings  

---
### 🚀 The total gifts have gone up from 2012 until 2015, and since then they've stayed about the same.
<!-- ![Plot 1](/plots_dataExploration/plot1.png) but smaller -->
![Plot 1](/plots_dataExploration/plot1.png)

<!-- add a horizontal line -->
---
### 🔽 It looks like participation has been decreasing since 2012
---
### ⭐️ Overall, the average class has had total gifts and participation around or below half a million dollars and 50% each year since 2012. But there have been some really impressive classes
![Plot 6](/plots_dataExploration/plot6.gif)
---
###  👈 The way the annual gifts are distributed looks like a right-skewed bell curve, with more lower-value gifts than high-value ones. This makes sense because it's probably more common for people to give smaller gifts than really expensive ones
![Plot 9](/plots_dataExploration/plot9.png)
---
### 📈 It seems like if the annual gifts went up a lot in value last year, they'll probably go down this year. If they stayed about the same as the year before, they'll probably stay about the same this year. But if the gifts went down in value last year, they'll probably go back up to their average or normal level this year. It's like the annual gifts are trying to balance out and stay around their average or normal amount from year to year
![Plot 11](/plots_dataExploration/plot11.png)
---
### 🏔 It looks like the more time that has passed since someone graduated, the more they tend to give in annual gifts, at least for the first ten years. It seems like this trend continues for the first 25-30 years or so, but then it starts to go in the opposite direction and people start giving less. Every 5 years, it looks like there's a big increase in annual gifts, with the biggest jump happening at the 50-year mark. There are also some other big increases around the 25, 30, and 35-year marks
![Plot 16](/plots_dataExploration/plot16.png)
---
### 🤔 It doesn't seem like there's a clear pattern between how long it's been since someone graduated and how likely they are to give in annual gifts. However, for people who graduated over 50 years ago, it looks like there might be a slight trend where they're more likely to give gifts as more time passes. But we can't say for sure without looking at data from earlier years, since other factors could be influencing the relationship.
![Plot 17](/plots_dataExploration/plot17.png)







# Full Working Report:

## Preliminary Steps

The cleaning of the data is done in `cleaner_dataExploration.py`. This script takes the raw data inside of the folder `rawData` and cleans it. It also does some initial exploration of the data. The cleaned data is saved inside of the folder `processedData`.

_Therefore, first you should run `cleaner_dataExploration.py` to clean the data. After doing this, you will see a bunch of files inside of the folder `processedData`. These files might not be properly formatted (some of them may have differing titles from one another). This is because the script `cleaner_dataExploration.py` is still in development. I recommend you skim over the files that `cleaner_dataExploration.py` produced and double-check them. I recommend you make the necessary final changes manually with a text editor / IDE. The data in these files is the data we will use for the rest of the project_

The wrangling of the data is done in `wrangler_dataExploration.R`. This script reads the cleaned data (i.e. each file) from the folder `processedData`. Each file is a dataset. This script binds all datasets into one: `yaleDonations.csv`, which is saved inside of the folder `processedData`. This script also does some other reformatting of the data.

_Therefore, after you have cleaned the data, you should run `wrangler_dataExploration.R` to wrangle the data. After doing this, you will see a file called `yaleDonations.csv` inside of the folder `processedData`. This file contains the dataset we will use for the rest of the project, until said otherwise_

## Data Exploration

### Initial Exploration

I do the initial data exploration in `visualizer_dataExploration.ipynb`. This notebook reads the dataset `yaleDonations.csv` from the folder `processedData`. This notebook does some initial exploration of the data. 

Recall that the first goal of this project is to explore the data and find interesting insights about the donations. This notebook attempts to do this. 

First, I try to explore the data with naive, introductory plots:
- Gifts by Year for each class
<!-- paste image with path: plots_dataExploration/plot1.png -->
![Plot 1](/plots_dataExploration/plot1.png)
- Gifts against Years since Graduation for each class (from 2012 to 2020 since I cannot find data before 2012)
<!-- paste image with path: plots_dataExploration/plot2.png -->
![Plot 2](/plots_dataExploration/plot2.png)
> I find by eye, generally, a positive correlation between years since graduation and gift amounts. This is expected. However, it might be interesting to see later, in the analysis, how strong this is / if it is a statistically significant effect.
- Participation Rate by Year for each class
<!-- paste image with path: plots_dataExploration/plot3.png -->
![Plot 3](/plots_dataExploration/plot3.png)
- Participation Rate against Years since Graduation for each class (from 2012 to 2020 since I cannot find data before 2012)
<!-- paste image with path: plots_dataExploration/plot4.png -->
![Plot 4](/plots_dataExploration/plot4.png)
- Quadrant-based Plot of Gifts against Participation Rate for each class. The quadrants of the plot were defined as follows: 
    - Along x axis
        - Low Participation Rate: 0 < Participation Rate < 0.25
        - Medium Participation Rate: 0.25 < Participation Rate < 0.50
        - High Participation Rate: 0.50 < Participation Rate < 0.75
        - Very High Participation Rate: 0.75 < Participation Rate < 1.00
    - Along y axis
        - Mass Affluent: 0 < Gift < 100000
        - Affluent: 100000 < Gift < 500000
        - High Net Worth: 500000 < Gift < 1250000
<!-- paste image with path: plots_dataExploration/plot6.gif -->
![Plot 6](/plots_dataExploration/plot6.gif)
- Having taken a look at the graph below, you might see that classes do not remain in the same quadrant over time. We might want to know which classes spend the most time in which quadrant. An example of this is asking: "Which class spent the most time in the _Affluent and Highest Participation Rate_ quadrant?" or "Which class spent the most time in the _Mass Affluent and Lowest Participation Rate_ quadrant?"
<!-- paste image with path: plots_dataExploration/plot7.png -->
![Plot 7](/plots_dataExploration/plot7.png)
> We find that the 1952 class is a great class donations-wise!
<!-- paste image with path: plots_dataExploration/plot8.png -->
![Plot 8](/plots_dataExploration/plot8.png)
> We don't see one class spending too much time in the _Mass Affluent and Lowest Participation Rate_ quadrant. But, at some point, many classes have spent some time in this quadrant.
<!--  paste image with path: plots_dataExploration/plot18.png -->
![Plot 18](/plots_dataExploration/plot18.png)
> We find that the 2017, 1959, 1962, 1963, 1966, 1956, 1953, 1955 are the ones that spend the most time in the _Affluent and Highest Participation Rate_ quadrant.

- Gifts by Year for each class, normalized by the number of alumni in that class / participation rate of the class

Ok, that was the initial exploration. Now, let's try to explore the data with more useful plots (or at least potentially more useful plots from a statistical perspective).

## Statistical Exploration

### Distribution of Annual Gifts

In `dataExplorer.R`, I plot a histogram of the data for all years available in the `yaleDonations.csv` dataset (from 2012 to 2020).

<!-- paste image with path: plots_dataExploration/plot9.png -->
![Plot 9](/plots_dataExploration/plot9.png)

This is a histogram of all annual gifts. That is, we are considering gifts given by all classes for all years in the dataset. 

We see that the distribution of annual gifts is right skewed. This is expected since we can expect higher-value gifts to be less frequent than lower-value gifts. 

In `dataExplorer.R`, I also plot a histogram of the differenced series of the Annual Gifts. That is, I plot a histogram of the differences between consecutive years' gifts. I obtain the histogram below. This histogram tells us that the differenced series is approximately normally distributed (i.e. the value of the time series has gone up and down around a mean value over time. However, the distribution is not exactly normal. It is slightly right skewed. 
<!-- paste image with path: plots_dataExploration/plot10.png -->
![Plot 10](/plots_dataExploration/plot10.png)

### Predicting Annual Gifts Changes and Annual Gifts

We might ask ourselves, how can we predict future Annual Gifts changes? A naive approach would be to predict a year's Annual Gifts changes using the previous year's Annual Gifts changes. I plot a scatterplot of the previous year's Annual Gifts changes against the current year's Annual Gifts changes. I obtain the scatterplot below. I do this in `dataExplorer.R`.

<!-- paste image with path: plots_dataExploration/plot11.png -->
![Plot 11](/plots_dataExploration/plot11.png)

> Notice the shape of the scatterplot. I will make a hypothesis on this shape. I notice three "segments" in the scatterplot. The first segment is the segment where the previous year's Annual Gifts changes are positive at high values: we see that as the previous year's Annual Gifts changes increase, the current year's Annual Gifts changes decrease; this is expected because if a class makes a large donation in one year, the next year may see a return to the mean / trend level of donations; the larger the increase in gifts today, the larger the drop next year to return closer to the original level. The second segment is the segment where the previous year's Annual Gifts was around zero: we see that if the previous year's Annual Gifts changes were around zero, the current year's Annual Gifts changes are between around zero and about a million; this is expected because if the previous year's Annual Gifts changes were unchanged, it may be that the Annual Gifts were at their mean / trend level, and so the next movement may be up or down (i.e. no correction is expected). But, what is interesting about this assumption, is that there is no "down" movement in this segment - the current year's Annual Gifts changes are always positive. The third segment is the segment where the previous year's Annual Gifts changes were negative at high values: we see that as the previous year's Annual Gifts changes decrease, the current year's Annual Gifts changes are about zero; this is expected because if the previous year's Annual Gifts changes were negative at high values (because they corrected for a large increase in the previous year), the current year's Annual Gifts changes are about zero (because we are back to the mean / trend level of donations). In summary, a story that we can tell ourselves is that if the previous year's Annual Gifts changes were positive at high values, the current year's Annual Gifts changes will be negative at high values; if the previous year's Annual Gifts changes were around zero, the current year's Annual Gifts changes will be unchanged at worst; if the previous year's Annual Gifts changes were negative at high values, the current year's Annual Gifts changes will be around zero - therefore, the story is one where the Annual Gifts are at their mean / trend level, and if they enjoy a large increase, they will correct for this increase in the next year.

We might also ask ourselves, how can we predict future Annual Gifts? A naive approach would be to predict a year's Annual Gifts using the previous year's Annual Gifts. I plot a scatterplot of the previous year's Annual Gifts against the current year's Annual Gifts. I obtain the scatterplot below. I do this in `dataExplorer.R`.

<!-- paste image with path: plots_dataExploration/plot12.png -->
![Plot 12](/plots_dataExploration/plot12.png)

> To discuss this plot, I will divide it into two regions: the region where the previous year's Annual Gifts are less than 400K and the region where the previous year's Annual Gifts are greater than 400K. In the region where the previous year's Annual Gifts are less than 400K, we see a positive correlation between Annual Gifts for the Previous Year and Annual Gifts (in the next year). We also find that the variance looks constant. I find that a y=x line may fit the model well. This would support the earlier hypothesis that "the story is one where the Annual Gifts are at their mean / trend level, and if they enjoy a large increase, they will correct for this increase in the next year". Why? This hypothesis is about the Annual Gifts being at their mean / trend level. If the Annual Gifts are at their mean / trend level, we would expect the Annual Gifts to be around the same value in the next year. In the region where the previous year's Annual Gifts are greater than 400K, we see a weaker positive correlation between Annual Gifts for the Previous Year and Annual Gifts (in the next year) and greater variance. Thus, it is more uncertain to predict the Annual Gifts in the next year. This may imply that, if an annual gift is very high, it is more difficult to predict the next year's Annual Gifts. This may be because the Annual Gifts are not at their mean / trend level. If the Annual Gifts are not at their mean / trend level, we would expect the Annual Gifts to be different in the next year. However, since the correlation seems to remain positive (implying that an increase in the previous year's Annual Gifts is associated with an increase in the next year's Annual Gifts), this may contradict the earlier hypothesis. Why? The earlier hypothesis would expect to see a decrease (because of corrections) at higher values of the previous year's Annual Gifts. But this is not what we are observing.

### Exloring Stationarity (for Total Annual Gifts)

We might ask ourselves, is are the total annual gifts stationary? To do so, we can do a Dickey-Fuller test. I do this in `dataExplorer.R`. However, we have a small range of years in the dataset (from 2012 to 2020), so the results are likely not to be reliable. So take the results from the Dickey-Fuller test with a grain of salt. I obtain the results below.

```
        Augmented Dickey-Fuller Test

data:  df3$Total_Annual_Gifts
Dickey-Fuller = -2.3667, Lag order = 2, p-value = 0.4327
alternative hypothesis: stationary
```

> The results above, with a p-value of 0.4327, suggest that the total annual gifts are not stationary. However, the results are not reliable since we have a small range of years in the dataset (from 2012 to 2020).

We might also ask ourselves, is are the annual gifts changes stationary? To do so, we can do a Dickey-Fuller test. I do this in `dataExplorer.R`. I obtain the results below.

```
        Augmented Dickey-Fuller Test

data:  df3$Total_Annual_Gifts_difference[-1]
Dickey-Fuller = -2.4848, Lag order = 1, p-value = 0.3877
alternative hypothesis: stationary
```

> The results above, with a p-value of 0.3877, suggest that the annual gifts changes are not stationary. However, the results are not reliable since we have a small range of years in the dataset (from 2012 to 2020).

### Exploring Autocorrelation (for Total Annual Gifts)

We might ask ourselves, is there autocorrelation in the total annual gifts? To do so, we can do an autocorrelation plot. I do this in `dataExplorer.R`. I obtain the plot below.

<!-- paste image with path: plots_dataExploration/plot13.png -->
![Plot 13](/plots_dataExploration/plot13.png)

> The plot above suggests that there is autocorrelation in the total annual gifts for the first lag.

We might also ask ourselves, is there autocorrelation in the annual gifts changes? To do so, we can do an autocorrelation plot. I do this in `dataExplorer.R`. I obtain the plot below.

<!-- paste image with path: plots_dataExploration/plot14.png -->
![Plot 14](/plots_dataExploration/plot14.png)

> The plot above suggests that there is autocorrelation in the annual gifts changes for the first lag.

## Data Analysis

### Relationship between Annual Gifts and Years Since Graduation

We recall the plot of the relationship between Annual Gifts and Years Since Graduation from the Data Exploration section above. Here it is below as a refresher:

<!-- paste image with path: plots_dataExploration/plot2.png -->
![Plot 2](/plots_dataExploration/plot2.png)

Notice that I have excluded the class of 2017. This is because their Annual Gifts at their 0th year of graduation was anomalously higher than that of the rest of the classes since 2017. You can see this below:

<!-- paste image with path: plots_dataExploration/plot15.png -->

![Plot 15](/plots_dataExploration/plot15.png)

So, I exclude the class of 2017 from the analysis of the relationship between Annual Gifts and Years Since Graduation (I want to find the underlying general relationship, so I exclude anomalies). 

I fit a linear model to the relationship between Annual Gifts and Years Since Graduation. I control for the Class year. I only include classes from 2012 to 2021 (excluding 2017) because these are the classes for which I can plot years of graduation starting from zero. I do this in `dataAnalyser.R`. I obtain the results below.

```
lm(formula = Annual_Gifts ~ Years_Since_Graduation + Class, data = df2)

Residuals:
   Min     1Q Median     3Q    Max 
-19482  -8728  -5352   9294  43543 

Coefficients:
                        Estimate Std. Error t value Pr(>|t|)    
(Intercept)            4255369.6  2170144.1   1.961 0.057254 .  
Years_Since_Graduation    3451.4      934.2   3.694 0.000691 ***
Class                    -2101.9     1076.8  -1.952 0.058332 .  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 14120 on 38 degrees of freedom
Multiple R-squared:  0.4032,    Adjusted R-squared:  0.3718 
F-statistic: 12.84 on 2 and 38 DF,  p-value: 5.501e-05
```

What if I plot all the classes? I do this in `visualizer_dataExploration.R`. I obtain the plot below.

<!-- paste image with path: plots_dataExploration/plot16.png -->
![Plot 16](/plots_dataExploration/plot16.png)

Notice that the relationship between Annual Gifts and Years Since Graduation appears non-linear by eye. So, it is more appropriate to fit a non-linear model to the relationship between Annual Gifts and Years Since Graduation. There seems to be a positive relationship for the first 25-30 years since graduation. Also notice that at every 5-year interval (indicated by the dashed lines) there seems to be a jump in Annual Gifts. 


### Relationship between Participation and Years Since Graduation

Below is a plot of the relationship between Participation and Years Since Graduation. I do this in `visualizer_dataExploration.R`. I obtain the plot below.

<!-- paste image with path: plots_dataExploration/plot17.png -->
![Plot 17](/plots_dataExploration/plot17.png)

Unlike the plot of Annual Gifts against Years Since graduation, there does not seem to exist a strong, perceivable positive or negative relationship between Participation and Years Since Graduation. However, after 50 years since graduation, there seems to be a slight positive relationship between Participation and Years Since Graduation. However, this does not control for time-related factors, so we would need more data to make a more informed decision. That is, datasets published in earlier years.