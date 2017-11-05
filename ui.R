# Copyright (C) 2016-2017 Mohammad Tarek Mansour - AFCM BioInformatics Lab
#AFCM-Egypt IGEM2017



# This file is the UI part of the platform.



# ------------------------------------------------------------------------------------

library(shiny)
library(deSolve)
library(ggplot2)
library(shinythemes)


# Define UI

ui<- shinyUI(fluidPage(theme = shinytheme("paper"),
                          
                          list(tags$head(HTML('<link rel="icon", href="https://raw.githubusercontent.com/MTarekM/AFCMHeatMapGeneratingTool/master/afcm.png", 
                                              
                                              type="image/png" />'))),
                          
                          div(style="padding: 1px 0px; width: '100%'",
                              
                              titlePanel(
                                
                                title="", windowTitle="AFCM Easy-Model"
                                
                              )
                              
                          ),
  pageWithSidebar(
    
    
    
    # Application title
    
    
   
    headerPanel(h1(a(img(src = "http://2017.igem.org/wiki/images/7/71/SoftareAFCM.png", align = "center", width = "100%",height="250px"), href = "http://2017.igem.org/Team:AFCM-Egypt"))),
    
    
    
    # Sidebar with controls
    
    sidebarPanel(
      
      
      
      helpText(a("AFCM Easy-Model tool Source Code on GitHub", href = "https://github.com/MTarekM/afcmeasymodel", target = "_blank")),
      sliderInput("C", "Initial CircularRNA Concentration",  min = 0,max = 20, value = 1, step=1),
      sliderInput("Mi", "Initial miRNA Concentration", min = 0,max = 20, value = 1, step=1),
      sliderInput("CM", "Initial Sponge Concentration", min = 0,max = 20, value = 1, step=1),
      sliderInput("ksc", "Rate of circularRNA synthesis", min = 0,max = 5, value = .155, step=.1),
      
      sliderInput("kas", "Rate of Sponge Association", min = 0,max = 5, value = 0.0005, step=.1),
      
      
      
      sliderInput("kds", "Rate of sponge dissociation", min = 0,max = 5, value = 0.00031, step=.1),
      
      
      sliderInput("kgc", "Rate of sponge degradation", min = 0,max = 5, value = 0.0004, step=.1),
      
      sliderInput("ksmi", "Rate of miRNA synthesis", min = 0,max = 5, value = 0.2, step=.1),
      sliderInput("kgmi", "Rate of miRNA degradation", min = 0,max = 5, value = 0.0003, step=.1),
      sliderInput("tmax", "Maximum simulation time", min = 0,max = 100, value = 10, step=1)
    
  ),
  
  
  
  # Show the plot of the requested variable against mpg
  
  mainPanel("AFCM-Easy Model",
           
           textInput("text", "This tool was developed as a part of Team AFCM-Egypt 2017 IGEM project, We have developed as an interactive web tool that embeds R Codes used for modeling our project in a user-friendly interface. Solving ODEs could be quite challenging. However, it's crucial for modeling synthetic biology projects. We believe our software will help other iGEM teams working on ceRNA networks to solve ODEs easily, specify parameters, rates and reaction species. We believe this tool will help other teams model their projects in an easy interactive way without facing technical issues. You could modify parameters to be fitting your project. You may also save your plot as an image.",width = 900),
           
           
                      plotOutput("guessPlot",height = 800))
 
  
            
  ),
  tags$footer("Developed at Bioinformatics & Computational Biology Lab - AFCM 2017 under the

              GNU General Public License v3.0", align = "center", style = "
              
              position:bottom;
              
              bottom:0;
              
              width:100%;
              
              height:25px;   /* Height of the footer */
              
              color: black;
              
              padding: 10px;
              
              background-color: white;
              
              z-index: 1000;
              align: center;")
  
)

)