#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)

simulated_data <-
  read_csv(
    file = here("inputs/data/simulated_data.csv"),
    show_col_types = FALSE
  )

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Building with Wifi Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
      simulated_data |> ggplot(aes(x= building_number, fill= has_wifi))+
        geom_histogram(position = "dodge", bins = input$bins)+
        theme_minimal()+
        scale_fill_brewer(palette = "Set1") +
        labs(
          x = "Building Number",
          y = "Occurrences",
          fill = "has wifi"
        )
        # draw the histogram with the specified number of bins
       
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
