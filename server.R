METRIC   = 1;
IMPERIAL = 2;

bmi <- function(Weight, Height,units) 
{ bmi= Weight / (Height^2)
if (units == IMPERIAL) {
  bmi = bmi * 703
}
return(bmi)
}
  

shinyServer(
  function(input, output) {
    
    output$prediction <- renderPrint({round(bmi(input$Weight,input$Height,input$units),2)})
    output$classe<- reactive(ifelse (bmi(input$Weight,input$Height,input$units) > 30, "Obese", ifelse(bmi(input$Weight,input$Height,input$units) <18.5, "Underweight", ifelse(bmi(input$Weight,input$Height,input$units) <30 & bmi(input$Weight,input$Height,input$units) >25, "Overweight", "Normal"))))
    
    
  }
)

