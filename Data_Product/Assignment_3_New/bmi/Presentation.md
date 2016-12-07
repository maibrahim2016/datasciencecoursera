Peer Graded Assignment: Shiny Application and Reproducible Pitch
========================================================
author: Muhammed Afifi Ibrahim
date: 7/12/2016
autosize: true

Course Project
========================================================
 - This is the final presentation for the Course Project of the "Developing data products" course
 - This course is part of the "Data Science specialization"
 - The project consists in two activities:</br>
     - Create a Shiny application</br>
     - Create a presentation in Slidify or Rstudio Presenter to pitch for the application.</br></br>
     
 - The shiny app developed for this assignment is avalilable at this [My ShinyApps] (https://maibrahim2016.shinyapps.io/bmi_3/)
 - The source codes of ui.R and server.R and also Rpresentation are available on [My GitHub Repository] (https://github.com/maibrahim2016/datasciencecoursera/tree/master/Data_Product/Assignment_3_New/bmi)

Project Summary of BMI
========================================================
This assignment is to display some information about Body Mass Index Classification for Adults. The Body Mass Index (BMI) is a person's weight in kilograms divided by the square of height in meters and it is calculated based on the following formula:

<b>Formula BMI: weight (kg) / [height (m)]2</b>

Where:

KG = your bodyweight in Kilograms</br>
M = your height in Meters


BMI Result
========================================================
For Example: 

180 cm height and 75 kg weight:

<b>BMI = 75 / (1.80 * 1.80) = 23.1</b>

BMI <18.5 : Underweight</br>
BMI [18.5-24.9] : Normal weight</br>
BMI [25-29.9] : Overweight</br>
BMI >=30 : Obesity</br>


BMI Code for Calculation & Display Output 
========================================================

<b>BMI Calculation Code</b>

```
BMI<-function(wght,hght) {
        if (wght==0 | hght==0) return(NA) 
                else  return(round(wght/(hght/100)^2,1))
```
<b>BMI Output Code</b>
```
tabPanel('Your results',
                      h5('Your BMI coefficient kg/m^2'),
                      verbatimTextOutput("oiBMI"),
                      verbatimTextOutput("oiBMIclass"),
```

Conclusion
========================================================

To stay in healthy life there are some tips which you can follow:</br>

- Do your BMI checking once a month.
- Take a healthy food especially fruits, Milks, Vegetables, but less rice.
- Do some exercise every day to burn your fat.

<b><center> !! DO WORKOUT TO STAY HEALTHY AND FIT !!</b>

