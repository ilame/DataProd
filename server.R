METRIC   = 1;
IMPERIAL = 2;

bmi <- function(Mass, Height,units) 
{ bmi= Mass / (Height^2)
if (units == IMPERIAL) {
  bmi = bmi * 703
}
return(bmi)
}
  

shinyServer(
  function(input, output) {
    
    output$prediction <- renderPrint({round(bmi(input$Mass,input$Height,input$units),2)})
    output$classe<- reactive(ifelse (bmi(input$Mass,input$Height,input$units) > 30, "Obese", ifelse(bmi(input$Mass,input$Height,input$units) <18.5, "Underweight", ifelse(bmi(input$Mass,input$Height,input$units) <30 & bmi(input$Mass,input$Height,input$units) >25, "Overweight", "Normal"))))
    
    
  }
)

