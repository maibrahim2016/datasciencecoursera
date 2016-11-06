## Loading Necessary Libraries

  rm(list=ls(all=TRUE))
  library(dplyr)
  library(knitr)
  library(ggplot2)
  library(datasets)
  library(gridExtra)
  library(GGally)
  

## 1. Load the ToothGrowth dataset and perform some basic exploratory data analyses 

  library(datasets)
  data(ToothGrowth)
  
## Some basic exploratory data analyses 

  str(ToothGrowth)
  head(ToothGrowth)
  tail(ToothGrowth)

## Number of Rows and Columns.

  dim(ToothGrowth)

## Sample Size n

  sample_size <- length(ToothGrowth$len)
  sample_size

## Mean group by dose and by OJ & VC

  mean_groups <- aggregate(ToothGrowth$len,list(ToothGrowth$supp,ToothGrowth$dose),mean) ## X bar - Mean
  mean_groups

## Standard Deviation group by dose and by OJ & VC

  SD_group <- aggregate(ToothGrowth$len,list(ToothGrowth$supp,ToothGrowth$dose),sd) ## s - standard Deviation
  SD_group

## Boxplot graph of the tooth length vs the does 

  ggplot(ToothGrowth, aes(x = factor(dose), y = len, fill = factor(dose)))+
        geom_boxplot()+
        facet_grid(.~supp)+
        labs(title = "Tooth Length vs. Dose  by for OJ & VC",
        x = "Doses", y = "Tooth Length") 
              

## 2. Provide a basic summary of the data.

    summary(ToothGrowth)

## Table view of data. 

    table(ToothGrowth$supp,ToothGrowth$dose)
    table(ToothGrowth)

    
###########################################################################################################
## 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. 

## (Only use the techniques from class, even if there's other approaches worth considering)
## From the box plot, OJ looks to be doing better with dose 0.5 and 1 effect on teeth growth than VC. To test this hypothesis
## by hold a the mean of OJ and VC does not cross zero. 
###########################################################################################################
    
    
## dose 0.5
## We are 95% confident that the limits of 1.719057 and 8.780943 actually do contain the difference between the two population means. 
## Because those limts do not contain zero, this confodence interval suggests that it is very possible that the two population 
## means are not equal.

            ojdose0.5 <- ToothGrowth %>% filter(supp=="OJ" & dose=="0.5")
            vcdose0.5 <- ToothGrowth %>% filter(supp=="VC" & dose=="0.5")
            t.test(ojdose0.5$len,vcdose0.5$len)

## dose 1
## We are 95% confident that the limits of 2.802148 and 9.057852 actually do contain the difference between the two population means. 
## Because those limts do not contain zero, this confodence interval suggests that it is very possible that the two population 
## means are not equal.
            

            ojdose1 <- ToothGrowth %>% filter(supp=="OJ" & dose=="1")
            vcdose1 <- ToothGrowth %>% filter(supp=="VC" & dose=="1")
            t.test(ojdose1$len,vcdose1$len)

            
## dose 2
## We are 95% confident that the limits of -3.79807 and 3.63807 actually do contain the difference between the two population means. 
## However, because those limts do contain zero, this confodence interval suggests that it is very possible that the two population 
## means are equal.
            

            ojdose2 <- ToothGrowth %>% filter(supp=="OJ" & dose=="2")
            vcdose2 <- ToothGrowth %>% filter(supp=="VC" & dose=="2")
            t.test(ojdose2$len,vcdose2$len)

            
###########################################################################################################
## 4. State your conclusions and the assumptions needed for your conclusions. 

## We are 95% confident that dose 0.5 and dose 1 of OJ result in longer tooth length than dose 0.5 and dose 1 of VC. However, at the 
## highest dose of 2, there is no statistically significant difference between the effects of OJ and VC. 

###########################################################################################################

            
setwd("~/Project/GitHub/datasciencecoursera/Statistical_Inference")
##rmarkdown::render("ToothGrowth.rmd", "ToothGrowth.html")
knit2html("ToothGrowth.rmd", "ToothGrowth.html")
opts_knit$set(base.dir = 'figure')