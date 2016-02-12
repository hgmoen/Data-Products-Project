library(shiny)
library(graphics)
data("Orange")

Orange$Tree <- as.numeric(Orange$Tree) 
xrange <- range(Orange$age) 
yrange <- range(Orange$circumference) 

shinyServer(
  function(input,output) {

    output$MyPlot <- renderPlot({
      trees <- as.numeric(input$id1)
      ntrees <- length(trees)
      plot(xrange, yrange, type="n", xlab="Age of Measurement (days)",
           ylab="Circumference (mm)", xaxt='n') 
      axis(1, at=Orange$age, labels=Orange$age)
      colors <- rainbow(ntrees) 
      linetype <- c(1:ntrees) 
      plotchar <- seq(18,18+ntrees,1)
      for (i in 1:ntrees) { 
        x<-trees[i]
        treeset <- subset(Orange, Tree==x) 
        lines(treeset$age, treeset$circumference, type="b", lwd=1.5,
               col=colors[i], pch=plotchar[x]) 
        if (ntrees >= 1) {
          legend(xrange[1], yrange[2], trees, cex=0.8, col=colors,
               pch=plotchar, lty=linetype, title="Tree")
        }
      } 
      title("Tree Growth")
    })
  }
)

