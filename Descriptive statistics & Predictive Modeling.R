
# -------------------------------------------------------------
# Descriptive Statistics & Predictive Modeling on German Credit Data
#
# This script performs exploratory analysis, data cleaning, 
# statistical transformation, and predictive modeling (linear and logistic regression)
# on the German credit card dataset.
#
# Author: Himanshu Bundel
# Date: March 2025
# -------------------------------------------------------------

# --- Load Libraries ---
library(readxl)

# --- Load Dataset ---
my_cards <- read_excel("german credit card.xls")

# --- Initial Summary ---
summary(my_cards)

# --- Dataset Dimensions ---
my_obs <- nrow(my_cards)
my_var <- ncol(my_cards)
my_dim <- c(my_obs, my_var)

# --- Data Cleaning: 'purpose' and 'good_bad' ---
table(my_cards$purpose)
table(my_cards$good_bad)

# Replace 'X' in purpose with '10' and convert to numeric
my_cards[which(my_cards$purpose == 'X'), "purpose"] <- '10'
my_cards$purpose <- as.numeric(my_cards$purpose)

# Convert 'good_bad' to binary: good = 1, bad = 0
my_cards$good_bad[my_cards$good_bad == "good"] <- '1'
my_cards$good_bad[my_cards$good_bad == "bad"] <- '0'
my_cards$good_bad <- as.numeric(my_cards$good_bad)

# --- UDF for Summary Statistics ---
udf_mean_min <- function(df_var) {
  c(min = min(df_var), 
    mean = mean(df_var), 
    sd = sd(df_var), 
    max = max(df_var))
}

# --- Run UDF on Variables ---
udf_mean_min(my_cards$checking)
udf_mean_min(my_cards$duration)
udf_mean_min(my_cards$age)

# --- Risk Score UDF ---
risk_score <- function(w1, w2, w3, w4, var1, var2, var3, var4) {
  w1*var1 + w2*var2 + w3*var3 + w4*var4
}

# Example Risk Scores
my_cards$prof_risk_score <- risk_score(0.2, 0.7, 0.4, -0.5, my_cards$age, my_cards$duration, my_cards$coapp, my_cards$installp)
my_cards$prof_risk_score_team_4 <- risk_score(3, 1, 4, 2, my_cards$employed, my_cards$age, my_cards$history, my_cards$existcr)
my_cards$prof_risk_score_team_5 <- risk_score(0.1, 0.2, 0.25, 0.35, my_cards$age, my_cards$employed, my_cards$savings, my_cards$property)

# --- Compare Risk Scores ---
udf_mean_min(my_cards$prof_risk_score)
udf_mean_min(my_cards$prof_risk_score_team_4)
udf_mean_min(my_cards$prof_risk_score_team_5)

# --- Simulation: Dice and Coin Experiments ---
dice <- sample(1:6, 48, replace = TRUE)
dice1 <- sample(1:6, 1000, replace = TRUE)
dice2 <- sample(1:6, 100000, replace = TRUE)

hist(dice); hist(dice1); hist(dice2)

coin <- sample(1:2, 48, replace = TRUE)
coin1 <- sample(1:2, 1000, replace = TRUE)
coin2 <- sample(1:2, 100000, replace = TRUE)

hist(coin); hist(coin1); hist(coin2)

# --- Simulation: Exponential Distribution ---
sfo <- rexp(48, rate = 0.5); hist(sfo)
sfo2 <- rexp(100000, rate = 0.5); hist(sfo2)

boston <- rexp(48, rate = 3); hist(boston)
boston2 <- rexp(100000, rate = 3); hist(boston2)

japan <- rexp(48, rate = 10); hist(japan)
japan2 <- rexp(100000, rate = 10); hist(japan2)

# --- Histograms for All Variables ---
my_cards <- as.data.frame(my_cards)
for (i in 1:my_var) {
  hist(my_cards[[i]], main = colnames(my_cards)[i])
}

# --- Standardization Functions ---
standardz <- function(my_var) {
  (my_var - mean(my_var)) / sd(my_var)
}

standardt <- function(my_var) {
  ((my_var - mean(my_var)) / sd(my_var)) * 10 + 50
}

normalize <- function(my_var) {
  (my_var - min(my_var)) / (max(my_var) - min(my_var))
}

# --- Apply Standardization ---
standardz(my_cards$checking)
standardt(my_cards$age)
normalize(my_cards$duration)

# --- Predictive Modeling ---

# Split into Train/Test
set.seed(123)
train_idx <- sample(1:my_obs, size = 0.8 * my_obs)
my_cards_train <- my_cards[train_idx, ]
my_cards_test <- my_cards[-train_idx, ]

# --- Linear Regression ---
my_linear <- lm(amount ~ age, data = my_cards_train)
summary(my_linear)

# --- Logistic Regression ---
logit <- glm(good_bad ~ amount + age + checking + installp + duration + savings + coapp, 
             data = my_cards_train,
             family = "binomial")
summary(logit)

# --- Session Info ---
sessionInfo()
