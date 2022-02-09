# Busses are very easy to use, you just need to know which bus to get on, where to get on, and where to get off (and you need to pay your fare). Cars, on the other hand, require much more work: you need to have some type of map or directions (even if the map is in your head), you need to put gas in every now and then, you need to know the rules of the road (have some type of drivers license). The big advantage of the car is that it can take you a bunch of places that the bus does not go and it is quicker for some trips that would require transferring between busses. Using this analogy, programs like SPSS are busses, easy to use for the standard things, but very frustrating if you want to do something that is not already preprogrammed. R is a 4-wheel drive SUV (though environmentally friendly) with a bike on the back, a kayak on top, good walking and running shoes in the passenger seat, and mountain climbing and spelunking gear in the back. R can take you anywhere you want to go if you take time to learn how to use the equipment, but that is going to take longer than learning where the bus stops are in SPSS. Greg Snow

#This book is more programming than stat.

#Use the R and RStudio interfaces
  #Run R commands
  #Create R objects
  #Write your own R functions and scripts
  #Load and use R packages
  #Generate random samples
  #Create quick plots
  #Get help when you need it

1+1
100:130
5 - 
  +1

237+2
239*3
717-6
711/3
1:6
a <- 1
a
a*3
a^0
die <- 1:6
die
ls()
die - 1
die / 2
die * die
die %% die
die %*% die
die %o% die
round(3.14, digits=1)
factorial(7)
mean(die)
sample(die, 10, replace = TRUE)
sample(die, 10, replace = TRUE)
args(sample)
dice <-  sample(die, 10, replace = TRUE)
dice
sum(dice)
# The numbers in the "dice" object are set and don't change.
my_function <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}
my_function()
my_function()
roll <- my_function()
roll
roll
roll
my_function()
roll2 <- function(bones) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2(bones = 1:100)

roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2
roll2()

#making quick plots and getting packages

library("ggplot2")
qplot
x <- c(1, 2, 3.4, -0.8, 2, -3, 3, 4, 6, 8)
y <- x^2
qplot(x, y)
x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)
x2 <- c(1,1,1,1,1,2,2,2,2,3,3,4)
qplot(x2, binwidth = 1)

lots <- replicate(1000,my_function() )
qplot(lots, binwidth = 0.5)
?sample
lots <- replicate(10000,my_function() )
qplot(lots, binwidth = 0.5)

#now lets make it an unfair die

my_function
unfair_dice <- function() {
  die <- 1:6
  unfair <- sample(die, size = 1, replace = TRUE, prob = c(1,1,1,1,1,5))
}
unfairresult <- replicate(10000, unfair_dice())
qplot(unfairresult, binwidth = 0.5)
knitr::spin()

##Part 2

#Making vectors and matrices

time <- Sys.time()
time

cface <- c("deuce", "ace", "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", "four", "three")
csuit <- c("spades", "hearts", "clubs", "diamonds")
cvalue <- c(15:3)
clist <- list(cface, csuit, cvalue)
clist
typeof(clist)
class(clist)
str(clist)

#Data Frames

df <- data.frame(face = c("ace", "two", "six"),  
                 suit = c("clubs", "clubs", "clubs"), value = c(1, 2, 3))
df

typeof(df)
class(df)
str(df)

allfaces <- rep(cface,4)
allsuits <- rep(csuit, each=13)
allvalues <- rep(cvalue, 4)

deuces.d <- data.frame(face = allfaces, suit = allsuits, value = allvalues)
deuces.deck

allsuitvalue <- rep(c(4:1),each=13)
deuces.deck <- cbind(deuces.d, allsuitvalue)
deuces.deck

write.csv(deck, file = "cards.csv", row.names = FALSE)
write.csv(deuces.deck, file = "deuces.deck.csv", row.names = FALSE)

read.csv(deck)

deck[,]
deck[1,]
deck[-1:-50,]
deck[1, c(TRUE, TRUE, FALSE)]
rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, 
          F, F, F, F, F, F, F, F, F, F, F, F, F, F)
deck[rows, ]
deck[1, c("face", "suit", "value")]
deck[ , "value"]

#Exercise 6.1 (Deal a Card) Complete the following code to make a function that returns the first row of a data frame:

deal <- function(cards) {
  deck[1, c("face", "suit", "value")]}
deal()

deck2 <- deck[1:52, ]
random <- sample(1:52, size = 52)
random
deck4 <- deck[random, ]
head(deck4)

#Exercise 6.2 (Shuffle a Deck) Use the preceding ideas to write a shuffle function. shuffle should take a data frame and return a shuffled copy of the data frame.

shuffle <- function(cards) {random <- sample(1:52, size = 52)
  +   cards[random, ]}
shuffle()

shuffle()
shuffle(cards = deck)
shuffle(deuces.deck)

deck$value
mean(deck$value)
median(deck$value)

vec <- c(0, 0, 0, 0, 0, 0)
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec

deck2$new <- 1:52
deck2$new <- NULL

deck2[face(ace), ]
