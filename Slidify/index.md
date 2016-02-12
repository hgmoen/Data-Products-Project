---
title       : Course Project - Orange Trees
subtitle    : Plotting Age and Circumfrence of Five Orange Trees
author      : Hilary
job         : Engineer/student
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : [bootstrap, quiz]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
--- 
<style type="text/css">
code.r{
  font-size: 14px;
}
</style>
## Purpose

The Purpose of this presentation is to pitch the Shiny application that I developed, and to demonstrate the Shiny and Slidify skills I have learned in the Developing Data Products course. 

For my Shiny application I used the Orange dataset in R. The Orange data frame has 35 rows and 3 columns of records of the growth of orange trees. 

--- &radio 

## Shiny Application Data Set

Out of 5 orange trees in the Orange dataset in R, which orange tree has the largest circumference at age 1582?

1. 1
2. _5_
3. 2
4. 4

*** .hint

Go to my shiny app: https://hgmoen.shinyapps.io/Shiny/

*** .explanation

Exploring the graph in my shiny app will give you this answer. 

--- .class #id 

## Shiny Application

My Shiny Application uses the graphics package and Orange data set to plot the growth of a tree or trees specified by the user. The following 2 slides show the the sample code and corresponding graph of all of the tree circumference growth measurements.

In the shiny app, I create the graph output based on the user's tree selection.

Here is the link to my shiny app: https://hgmoen.shinyapps.io/Shiny/

---

## Graph Code


```r
library(graphics)
data("Orange")
Orange$Tree <- as.numeric(Orange$Tree) 
ntrees <- max(Orange$Tree)
xrange <- range(Orange$age) 
yrange <- range(Orange$circumference) 
plot(xrange, yrange, type="n", xlab="Age of Measurement (days)",ylab="Circumference (mm)", xaxt='n') 
axis(1, at=Orange$age, labels=Orange$age)
colors <- rainbow(ntrees) 
linetype <- c(1:ntrees) 
plotchar <- seq(18,18+ntrees,1)
for (i in 1:ntrees) { 
  tree <- subset(Orange, Tree==i) 
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
  lty=linetype[i], col=colors[i], pch=plotchar[i]) 
} 
axis(1, at=1:7, labels=c(118, 484, 664, 1004, 1231, 1372))
legend(xrange[1], yrange[2], trees, cex=0.8, col=colors,pch=plotchar, lty=linetype, title="Tree")
title("Tree Growth")
```

--- .class #id 

## Tree Growth Graph

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

```
## Error in axis(1, at = 1:7, labels = c(118, 484, 664, 1004, 1231, 1372)): 'at' and 'labels' lengths differ, 7 != 6
```

--- .class #id 
