library(shiny)
library(ggplot2)
library(colourpicker) 
library(dplyr)
library(DT)
options(shiny.maxRequestSize=30*1024^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    fileInput("file", "Please select CSV file" , accept = ".csv"),
    radioButtons('button1', 'Please select a variable to plot', 
                 c('Sample_title',
                   'Sample_geo_accession',
                   'Sample_type',
                   'Sample_channel_count',
                   'Sample_source_name_ch1',
                   'Sample_organism_ch1' )),
    sliderInput('slider', 'Select the magnitude of samples you would like to see', -300, 0, -10),
    submitButton('Submit', icon('sync'), '400px'),
    mainPanel(tabsetPanel(
        tabPanel('Summary',
                 tableOutput('Summary')),
        
        tabPanel('Counts',
                 tableOutput('counts')),
        tabPanel('DE',
                     tableOutput('DE'))
         
    )))
# Define server logic required to draw a histogram
server <- function(input, output, session) {
    data <- readr::read_csv('/projectnb/bf591-r/students/yamuna21/')}
server <- function(input, output) {
    output$mytable <- DT::renderDataTable(data,
                                          options = list(scrollX = TRUE),
                                          rownames = FALSE)}



# Run the application
shinyApp(ui = ui, server = server)