shinyServer(function(input, output)
{
  library("wordcloud")
  library("RColorBrewer")
  
  # output$value <- renderText({ input$somevalue })
#  imdb = read.csv("imdb2.csv", header = TRUE, sep = ",")
  imdb = read.csv("IMDBdataset.csv", header = TRUE, sep = ",")
  iname = names(imdb)
  nc <- ncol(imdb) #number of variables
  nt <- nrow(imdb)  #number of rows
  #anc = 0
  #sels = ""

 bg = imdb[which(imdb$country=='USA' & imdb$budget>0 & imdb$gross>0 &imdb$movie_fb_likes>0 ),names(imdb) %in% c("budget","gross","country","imdb_score","movie_fb_likes","genres")]


  
  observe({

    output$dynamicPlot <- renderPlot(NULL)
    if (input$GraphType == "1")
    {
      output$dynamicPlot <- renderPlot({
        #hist(tt,l = seq(0,length((tt))))
        #hist(tt)
        #    barplot(tt, names.arg = iname, las = 2)
     #   barplot(tt2, names.arg = sels, las = 2)
        plot(bg$budget/1000000, bg$gross/1000000, main = "Busget ratio to Gross",col="blue",xlab = "Budget (Million $",ylab = "Gross Million $")
      })
  
     
    }
    else if (input$GraphType == "2")
    {
      output$dynamicPlot <- renderPlot({

        plot(bg$budget/1000000, bg$imdb_score, main = "Busget ratio to Score",col="Red",xlab = "Budget Million $",ylab = "Score from 10")
        
        
      })
      
    }
    else if (input$GraphType == "3")
    {

      output$dynamicPlot <- renderPlot({
        plot(bg$movie_fb_likes, bg$imdb_score, main = "FB likes ratio to Score",col="Black",xlab = "FB likes",ylab = "Score from 10")
      })
    }
    else
    {

      output$dynamicPlot <- renderPlot({
        plot(bg$genres, bg$imdb_score, main = "Score ratio to Genre",col="skyblue1",xlab = "",ylab = "Score from 10",las=2,ann=FALSE)
        axis(1)
        mtext("Genre",side = 1,line = 4.2)
        #barplot(tt2, names.arg = sels, las = 2)
      })    
      
    }
  })
  
})