# Yale Donations

This is an exploration and analysis of Yale's Alumni Donations.

The goal of this project is to:
- explore the data and find interesting insights about the donations
- make recommendations to the development office about how to improve the donations
- develop a model to predict the amount of a donation

<!-- add a gif image with image address with size 5x5: https://www.google.com/url?sa=i&url=https%3A%2F%2Fgiphy.com%2Fexplore%2Fmagnifying-glass&psig=AOvVaw3QG9uAm-Fnb7_UecRkxHf3&ust=1671954255901000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCPjM447hkfwCFQAAAAAdAAAAABAD-->
![Magnifying Glass](https://media2.giphy.com/media/42wQXwITfQbDGKqUP7/giphy.gif)





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
- Gifts by Year for each class, normalized by the number of alumni in that class / participation rate of the class

Ok, that was the initial exploration. Now, let's try to explore the data with more useful plots (or at least potentially more useful plots from a statistical perspective).

## Statistical Exploration

### Time Series Analysis

In `dataExplorer.R`, I plot a histogram of the data for all years available in the `yaleDonations.csv` dataset (from 2012 to 2020).

<!-- paste image with path: plots_dataExploration/plot9.png -->
![Plot 9](/plots_dataExploration/plot9.png)

This is a histogram of all annual gifts. That is, we are considering gifts given by all classes for all years in the dataset. 

We see that the distribution of annual gifts is right skewed. This is expected since we can expect higher-value gifts to be less frequent than lower-value gifts. 

In `dataExplorer.R`, I also plot a histogram of the differenced series of the Annual Gifts. That is, I plot a histogram of the differences between consecutive years' gifts. I obtain the histogram below. This histogram tells us that the differenced series is approximately normally distributed (i.e. the value of the time series has gone up and down around a mean value over time. However, the distribution is not exactly normal. It is slightly right skewed. 
<!-- paste image with path: plots_dataExploration/plot10.png -->
![Plot 10](/plots_dataExploration/plot10.png)

We might ask ourselves, how can we predict future Annual Gifts changes? A naive approach would be to predict a year's Annual Gifts changes using the previous year's Annual Gifts changes. I plot a scatterplot of the previous year's Annual Gifts changes against the current year's Annual Gifts changes. I obtain the scatterplot below.