# Exploratory data analysis (see readme for more detail)
# Feel free to follow these steps, or complete your own EDA

# Set up (install packages if you don't have them)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(vioplot)
setwd('~/Documents/INFO370/eda/health-burden/')
risk.data <- read.csv('./data/prepped/risk-data.csv', stringsAsFactors = FALSE) 

######################
### Data Structure ###
######################

## Using a variety of functions, investigate the structure of your data, such as:

# Dimensions, column names, structure, summaries, etc.
columnNames <- colnames(risk.data)
dim(risk.data) 
summary(risk.data)


# Replacing missing values...?
#Multiple reasons not to do so.
###########################
### Univariate Analysis ###
###########################

## Using a variety of approaches, investigate the structure each (risk column) individually

# Summarize data
 summary(risk.data[,8:ncol(risk.data)])
# Create histograms, violin plots, boxplots
hist(risk.data$alcohol.use)
hist(risk.data$drug.use)
hist(risk.data$high.meat)
hist(risk.data$low.exercise)
hist(risk.data$smoking)
####################################
### Univariate Analysis (by age) ###
####################################

# Investiage how each risk-variable varies by **age group**

# Create histograms, violin plots, boxplots. Calculate values as needed. 
library(dplyr)
grp <- group_by(risk.data, age) %>%
        summarise(drug.use = mean(drug.use), na.remove = TRUE,
                  alcohol.use = mean(alcohol.use), na.remove = TRUE)

####################################
### Univariate Analysis (by sex) ###
####################################

# Investiage how each risk-variable varies by **sex**
grp <- group_by(risk.data, sex) %>%
  summarise(drug.use = mean(drug.use), na.remove = TRUE,
            alcohol.use = mean(alcohol.use), na.remove = TRUE)
# Compare male to female values -- requires reshaping (and dropping population)!


########################################
### Univariate Analysis (by country) ###
########################################

## Investiage how each risk-variable varies by **country**
grp <- group_by(risk.data, country) %>%
  summarise(drug.use = mean(drug.use), na.remove = TRUE,
            alcohol.use = mean(alcohol.use), na.remove = TRUE)
# Aggregate by country

# Create a choropleth map (see https://plot.ly/r/choropleth-maps/)

###########################
### Bivariate Analysis ####
###########################

# Compare risks-variables to one another (visually)
