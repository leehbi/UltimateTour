library(shiny)
shinyUI(navbarPage(
  title = 'The Tour Planner',
  
  tabPanel('Documentation',
           tags$h1("Documentation for the ultimate tour"),
           tags$p("This shiny app uses the crowd to arrange a city tour. It does this by querying online services and using the TSP package to predict the optimal route and plotting the route on Google maps using the GGMAP package"),
           tags$p("The R code queryies the following sources:"),
           tags$ol(
             tags$li("Google Maps Distance API - to find a distance matrix"), 
             tags$li("Google Maps Route API - to plot the plot"), 
             tags$li("Various packages are used to acquire, transform and model.")
           ),
           tags$p("The main model is built using the TSP (Travelling Sales Person) package. The prediction is made by cycling through the algorithms and selecting the one returning the minimum distance"),  
           tags$p("To process the model select the parameters on the Input tab and press the process button")      
           ),
    
  
  
  tabPanel('Inputs',textInput("city", "Enter a city", value="Chester"),
           textInput("country", "Enter a country", value="UK"),
           selectInput("type", "Select the venue type you wish to visit", choices=(c("bars", "resturants", "museums", "parks")), selected="bars"), 
           sliderInput("radius", "Select the radius (distance you want to walk)", value=3000,min=100, max=10000, step=100),                
           h4("When ready press the process button to create the tour"),
           submitButton("process","Process")
           
  ),
  tabPanel('Venues', dataTableOutput('venues')),
  tabPanel('Route', tableOutput('route')),
  tabPanel('Map', plotOutput('map'))
    
  ))

