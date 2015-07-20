library(shiny)
shinyUI(fluidPage(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index Calculation Tool"),
   
    sidebarPanel(
      numericInput('Height', 'Your Height', value = 1.75, step=0.1),
      numericInput('Weight', 'Your Weight', value = 75),
      
      radioButtons(
        inputId  = "units",
        label    = "Units:",
        choices  = c("Metric (kg & m)" = 1, "Imperial (lb & in)" = 2),
        selected = 1
      ),
      
      submitButton('Submit')
      
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Your results',
                 
                h3('Your BMI'),
                verbatimTextOutput("prediction"),
                h3('Classification'),
                verbatimTextOutput("classe"),
                h6("This tool is valid only for Adults older than 20"),
                img(src="BMI_chart.png", height = 400, width =400),
                p("Source: ", a("WHO BMI classification", 
                                href = "https://en.wikipedia.org/wiki/Body_mass_index#/media/File:Body_mass_index_chart.svg"))
        ),
        tabPanel('How to get started?',
                 
                 br(),br(),"Enter your Height in the left side bar, under", strong("Your Height"), ".
                 Enter your Weight in the left side bar, under",strong("Your Weight"),". Then click on the", strong("Submit"),"button. 
                 ", strong("Your BMI")," will appear on the right side panel, under",strong("Your results")," tab. You will also see your", strong("Classification")," according 
                 to the World Health Organisation.",    
                 
                 br(),br(), em("Note:"), "You can choose either", em("Metric"),"or",em("Imperial")," units by checking the corresponding radio button in the left side bar
                 under", strong("Units.")
        ),
        
        tabPanel('Documentation',
                 helpText(strong("Brief Introduction"),br(),
                          h6(strong("Description:")), "BMI provides a simple numeric measure of a person's thickness or thinness, 
                          allowing health professionals to discuss weight problems more objectively with their patients.",  
                          
                          
                          br(),h6(strong("Classification:")), "BMI was designed to be used as a simple means of classifying average sedentary (physically inactive) 
                          populations, with an average body composition. For these individuals, 
                          the current value recommendations are as follow: a BMI from 18.5 up to 25 may indicate optimal weight, 
                          a BMI lower than 18.5 suggests the person is underweight, a number from 25 up to 30 may indicate the person 
                          is overweight, and a number from 30 upwards suggests the person is obese.",    
                          
                          
                          br(), h6(strong("Formula:"))," BMI= Weight / (Height^2) kg/m^2"),
                 
                          p("Source: ", a("Wikipedia", 
                                 href = "https://en.wikipedia.org/wiki/Body_mass_index")),
                 
                          p(strong("Github repository:",a("Developing Data Products - Course Project",href="https://github.com/ilame/DevDataProd")))
                          
                          
                 )
      
      )
  )
)))


  