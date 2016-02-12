shinyUI(
  pageWithSidebar(
    #Application title
    headerPanel("Orange Tree Age and Circumfrence Graph"),
    
    sidebarPanel(
      checkboxGroupInput("id1", "Tree Number",
                         c("1" = 1,
                           "2" = 2,
                           "3" = 3,
                           "4" = 4,
                           "5" = 5)),
      submitButton('Submit')
    ),
    mainPanel(
      plotOutput("MyPlot")
    )
  )
)


