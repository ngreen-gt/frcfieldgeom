
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(png)
source("geom_func.R")


shinyServer(function(input, output) {

  output$robotPlot <- renderPlot({

    # background image
    img<-readPNG('hemi.field.stnghld.png')
    
    # plot
    ggplot(data = ZoneFun(c(0,14.3),inner_radius = (input$inner1/12)+2.19,outer_radius = (input$outer1/12)+2.19, start = 1.5, end = 2.5),aes(x,y),alpha=0)+coord_cartesian(xlim=c(-2.17,27.31),ylim=c(-0.98,27.67))+annotation_raster(img,-2.17,27.31,-0.98,27.67)+geom_polygon(data=ZoneFun(c(0,14.3),inner_radius = (input$inner1/12)+2.19,outer_radius = (input$outer1/12)+2.19, start = 1.5, end = 2.5),aes(x,y),fill="red",alpha=0.9)+geom_polygon(data=ZoneFun(c(0,14.3),inner_radius = (input$inner2/12)+2.19,outer_radius = (input$outer2/12)+2.19, start = 1.5, end = 2.5),aes(x,y),fill="blue",alpha=0.9)+geom_polygon(data=robotFun(position=c(input$rposx,input$rposy),width=input$width,length=input$length,angle=input$rangle,offset=input$roffset,pivot=input$rpivot),aes(x,y),fill="grey")+geom_point(aes(input$rposx,input$rposy))+theme(legend.position="none")
    
  })

})
