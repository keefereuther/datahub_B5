library(rmarkdown)
library(tidyverse)
library(data.table)

all_possible_data_tp <- read_csv("all_possible_data_tp.csv")
View(all_possible_data_tp)

set.seed(27182818)
#first 8 digits of e without the decimal place




#code to generate independent variable = 2 level categorical; dependent variable = binomial

r <- rnorm(1, 0.5, 0.1)
#should mess around with mean and sd ratio to get things that show a difference most of the time but not all the time
cat2binom2a  <- rbinom(50, 1, r)
#need to swap out "50" for "as.integer($samplesize/$levels)"
cat2binom2a
cat2binom2b <- rbinom(50, 1, r)
cat2binom2b

df <- data.frame(anovabinom2a, anovabinom2b)
write_csv(df, file = "kdreuther.csv")
#need to make file name $username.csv

#code to generate independent variable = 3 level categorical; dependent variable = binomial

q <- rnorm(1, 0.5, 0.1)
#should mess around with mean and sd ratio to get things that show a difference most of the time but not all the time
cat3binom3a  <- rbinom(33, 1, q)
#need to swap out "33" for "as.integer($samplesize/$levels)"
cat3binom3a
cat3binom3b <- rbinom(33, 1, q)
cat3binom3b
cat3binom3c <- rbinom(33, 1, q)
cat3binom3c

df2 <- data.frame(cat3binom3a, cat3binom3b, cat3binom3c)
write_csv(df, file = "kdreuther2.csv")
#need to make file name $username.csv
#the students will have to make their data tidy

#code to generate independent variable = 2 level categorical; dependent variable = double; t test

m <- rnorm(1, 100, 50)
sd <- rnorm(1, 10, 5)
cat2doublea <- rnorm(50, m, sd)
cat2doubleb <- rnorm(50, m, sd)
sda <- sd(cat2doublea)
sdb <- sd(cat2doubleb)
sda
sdb

df3 <- data.frame(cat2doublea, cat2doubleb)
write_csv(df3, file = "kdreuther3.csv")
#the students will have to make their data tidy

ttesta <- select(df3,cat2doublea, row.names(FALSE))
leva <- rep(c("a"), length.out=50)
ttestb <- select(df3,cat2doubleb, row.names(FALSE))
levb <- rep(c("b"), length.out=50)
ttesta2 <- cbind(ttesta, leva)
colnames(ttesta2) <- c("value", "group")
ttesta2
ttestb2 <- cbind(ttestb, levb)
colnames(ttestb2) <- c("value", "group")
ttestb2tib <- as_data_frame(ttestb2)
ttesta2tib <- as_data_frame(ttesta2)
ttest3 <- bind_rows(ttesta2tib, ttestb2tib)
ttest3
resultttest <- t.test(value ~ group, data = ttest3, var.equal = FALSE)
resultttest


Graph1 = ggplot(ttest3, aes(y=value, x=group))

Graph1+
  stat_summary(fun.y = mean,
               geom = "bar", 
               color = "black", 
               fill = "white")+
  stat_summary(fun.data = mean_se,
               geom = "errorbar", 
               width = .2)

#code to generate independent variable = 2 level categorical; dependent variable = integer; t test
#code to generate independent variable = 3 level categorical; dependent variable = double; ANOVA
#code to generate independent variable = 3 level categorical; dependent variable = integer; ANOVA
#code to generate independent variable = double; dependent variable = binomial; logistic regression
#code to generate independent variable = double; dependent variable = integer; linear or Poisson regression
#code to generate independent variable = double; dependent variable = double; linear regression
