# Copyright (C) 2016-2017 Mohammad Tarek Mansour - AFSponge BioInformatics Lab
#AFSponge-Egypt IGEM2017
# This file is the server part of the platform.
# ------------------------------------------------------------------------------------



library(shiny)

library(deSolve) 

library(ggplot2)





shinyServer(function(input, output) {
  output$default <- renderText({ input$text })

  
  
  
  
  IGEM <- function(t, state, parameters) { # returns rate of change
      
      with(as.list(c(state, parameters)), {
        
        
        dCircularRNA = ksc - kgc* CircularRNA +( -kas * miRNA * CircularRNA +kgc*Sponge)
        dmiRNA = ksmi - kgmi + (-kas* miRNA *CircularRNA+kds * Sponge)
        dSponge = kas*miRNA*CircularRNA - (kds + kgc)*Sponge
        
        return(list(c(dCircularRNA, dmiRNA,dSponge)))
        
      })
  }
      
  

    
 
    
  
  
  
  
 output$guessPlot <- reactivePlot(function() {
    
   
    
    state <- c(CircularRNA = input$C, miRNA = input$Mi, Sponge = input$CM)
    parameters <- c( ksc = input$ksc, kas = input$kas, kds = input$kds, kgc = input$kgc, ksmi = input$ksmi, kgmi = input$kgmi )
    time <- seq(0, input$tmax, by = 0.1)
    ## Integration with 'ode'
    out <- ode(y = state, times = time, func = IGEM, parms = parameters)
    
    ## Ploting
    out.df = as.data.frame(out) # required by ggplot: data object must be a data frame
    library(reshape2)
    out.m = melt(out.df, id.vars='time') # this makes plotting easier by puting all variables in a single column

    print(ggplot(data = out.m, aes(time, value, color = variable)) + geom_point())
   
    
  })
  
  

})
