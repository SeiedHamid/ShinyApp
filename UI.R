shinyUI(pageWithSidebar(
  headerPanel("IMDB.com"),
  sidebarPanel(
    selectInput("GraphType","Select Graph Type:",choices = c("Budget/Gross"=1,"Budget/Score"=2,"Score/Fb Likes"=3,"Score/Genre"=4))


  ),
  #      checkboxInput(inputId = "Action", label = "Action", value = TRUE),),),
  #     sliderInput("sampleSize","Please select ....",
  #                min = 100, max = 1000, value = 200,step = 50)),),
  mainPanel(

    h1('IMDB Dataset Analyze'),
  #  p('And here is some content that is put into the first paragraph'),
    #  p(textOutput('dynamicText'))
    
    plotOutput('dynamicPlot')
  )
))