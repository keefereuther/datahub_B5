
library(tidyverse)
library("gapminder")

gap <- gapminder
a <- ggplot(gap, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) + geom_point()
a

ayear <- ggplot(gap, aes(x = gdpPercap, y = lifeExp, size = pop, color = year)) + geom_point()
ayear

b <- ggplot(gap, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) + geom_point() + facet_wrap(vars(year))
b

a2007 <- gap %>% dplyr::filter(year == "2007")

fig2007 <- ggplot(a2007, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) + geom_point()
fig2007

fig2007viol <- ggplot(a2007, aes(x = continent, y = lifeExp)) + geom_violin()
fig2007viol


