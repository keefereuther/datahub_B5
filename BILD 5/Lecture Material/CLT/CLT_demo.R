###########Central Limit Theorem Visualized#################

#when every number is equally likely to be randomly drawn, we call that a uniform distribution. When you ask for a random number, what you are really asking for is a random draw from an uniform distribution bound between a min and max.

set.seed(2)
UniformData <- runif(n = 1000,min = -5,max = 5) # Let's randomly draw 1000 numbers from a uniform distribution ranging from -5 to 5. runif() is the function to draw from a uniform distribution

#What do you expect?

min(UniformData)
max(UniformData)

#What do you expect?

hist(UniformData) #looks like a rectangle!

#What do you  expect the mean to be?

mean(UniformData) #What would a distribution of means look like?

SquareData<-runif(n = 5,min = -5,max = 5) #lets start small

mean(SquareData) #I want to see what 1000 random means looks like!

meansofdata<-NA #lets use a loop, starting with an empty vector to fill

for(i in 1:1000){
  Sys.sleep(.06) #Change to speed up or slow down the demo
  SquareDataSample<-runif(n = 5,min = -5,max = 5) #exactly what we did above
  meansofdata[i]<-mean(SquareDataSample) #For each loop in 1000, calculate the mean of the random sample and add it to the vector
  hist(meansofdata,breaks = 20,xlim = c(-5,5)) #for each step in the loop, plot a histogram of the saved mean values to that point.
}

meanofmeans <- mean(meansofdata)
meanofmeans

##Don't believe me? Try it with another distribution. Any continuous distribution will work!

?rexp
?rbeta
?rnorm