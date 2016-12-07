library(shiny)
library(datasets)
library(ISOcodes)
library(UsingR)
library(ggplot2)
library(rsconnect)
require(devtools)
require(rCharts)

data(ISO_3166_1)
shinyUI(pageWithSidebar(
        headerPanel("Body Mass Index Classification for Adults"),
        sidebarPanel(
                numericInput(inputId="heightM", label="Your height in cm", value= 0,min=0),
                numericInput(inputId="weightM", label="Your weight in kg", value= 0,min=0),
                radioButtons(inputId="gender", label="Gender", choices=c("Female","Male")),
                selectInput(inputId="country", label="Country", choices=sort(ISO_3166_1$Alpha_3),
                multiple = FALSE,selected="USA"),
                conditionalPanel(
                        condition = "input.country == 'USA'",
                        p("If you live in USA, please choose a state"),
                        selectInput(inputId="state", label="State", choices=state.name,
                        multiple = FALSE,selected=NULL)),
                actionButton("goButton", "GO!"),
                br(),
                p(strong(em("Documentation:",a("Body Mass Index Classification for Adults",href="https://github.com/maibrahim2016/datasciencecoursera/tree/master/Data_Product/Assignment_3_New/Readme.html")))),
                p(strong(em("Github repository:",a("Developing Data Products - Shiny Application and Reproducible Pitch",href="https://github.com/maibrahim2016/datasciencecoursera/tree/master/Data_Product/Assignment_3_New"))))
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel('Your results',
                                h5('Your BMI coefficient kg/m^2'),
                                verbatimTextOutput("oiBMI"),
                                verbatimTextOutput("oiBMIclass"),
                                img(src="WHOBMI.png", height = 500, width =700),
                                p("Source: ", a("WHO BMI classification", 
                                    href = "http://apps.who.int/bmi/index.jsp?introPage=intro_3.html"))
                                ),
                        tabPanel('Data Summary',
                                 h5('Available data for'),
                                 verbatimTextOutput("oicountry"),
                                 h5('Gender'),
                                 verbatimTextOutput("oigender"),
                                 h5('Mean BMI (kg/m2) (crude estimate) and 95% CI'),
                                 verbatimTextOutput("oiBMIcrude"),
                                 p("Source: ", a("WHO Global Health Observatory Data Repository", 
                                                 href = "http://apps.who.int/gho/data/node.main.A903?lang=en")),
                                 h5('Recent BMI Indicators'),
                                 dataTableOutput("oiBMIcattable"),
                                 p("Source: ", a("KNOEMA-WHO Global Database on Body Mass Index (BMI)", 
                                        href = "http://knoema.com/WHOGDOBMIMay/who-global-database-on-body-mass-index-bmi"))
                                ),
                        tabPanel('Plot: BMI Indicators',
                                 h5('Recent BMI Indicators'),
                                 p("Plotted data are for your gender for your specific country"),
                                 p("If there are no data for your gender, plotted data are for adults for your specific country"),
                                 verbatimTextOutput("oiPlotYear"),
                                 showOutput("Plot1","highcharts"),
                                 p("Worldwide Data: ", a("KNOEMA-WHO Global Database on Body Mass Index (BMI)", href = "http://knoema.com/WHOGDOBMIMay/who-global-database-on-body-mass-index-bmi"))
                                 ),
                        tabPanel('Plot: Mean BMI Trend',
                                 h5('Mean BMI Trend per Years'),
                                 showOutput("Plot2","highcharts"),
                                 p("Source: ", a("WHO Global Health Observatory Data Repository", 
                                                 href = "http://apps.who.int/gho/data/node.main.A903?lang=en"))
                                 ),
                        tabPanel('Plot: BMI Indicators for US States',
                                 h5('2012 US States BMI Indicators for Adults '),
                                 verbatimTextOutput("oiState"),
                                 showOutput("Plot3","highcharts"),
                                 p("US States Data: ", a("CDC-Behavioral Risk Factor Surveillance System; Prevalence and Trends Data; Overweight and Obesity(BMI) 2012", href = "http://www.cdc.gov/obesity/index.html"))
                                 )
                ),
                p(strong("A Quotes by Charles M. Schulz: All you need is love. But a little chocolate now and then doesn't hurt"))
               )
)
)
