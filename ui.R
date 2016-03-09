library(shiny)

shinyUI(fluidPage(h1("FRC field app with scoring and robot positions"),
                  absolutePanel(
                    top = 20, right = 20, width = 300,
                    draggable = TRUE,
                    wellPanel(
                      numericInput("inner1",label = "1st - Inner Radius (in. from goal)", value = 27),
                      numericInput("outer1",label = "1st - Outer Radius",value=75),
                      numericInput("inner2",label = "2nd - Inner Radius",value=102),
                      numericInput("outer2",label = "2nd - Outer Radius",value=111),
                      numericInput("rposx",label = "Position (x) robot intake right (ft)",value=0),
                      numericInput("rposy",label = "Position (y)",value=0),
                      numericInput("width",label = "Robot width (ft)",value=2),
                      numericInput("length",label = "Robot length (ft)",value=3),
                      numericInput("rangle",label = "Robot angle (degrees)",value=90)
                    )
                  ),
                  plotOutput("robotPlot", height="700px",width="800px")
))