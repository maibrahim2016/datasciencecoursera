## Loading Necessary Libraries

    rm(list=ls(all=TRUE))
    library(ggplot2)
    library(knitr)


## Sample Mean vs Theoretical Mean
## Known values to set: lambda = 0.2, n = 40, simulations = 1000

    lambda = 0.2
    n = 40 
    nosim = 1000

    set.seed(349)

    exp_sim <- function(n, lambda)
      {
                mean(rexp(n,lambda))
      }

        sim <- data.frame(ncol=2,nrow=1000)
        names(sim) <- c("Index","Mean")

              for (i in 1:nosim)
                {
                          sim[i,1] <- i
                          sim[i,2] <- exp_sim(n,lambda)
                }


## mean of n = 1000

    sample_mean <- mean(sim$Mean)
    sample_mean

        
## Theoretical exponential mean of exponential distribution
        
    theor_mean <- 1/lambda
    theor_mean


      hist(sim$Mean, 
             breaks=100, 
             prob=TRUE, 
             main="Exponential Distribution n = 1000", 
             xlab="Spread")
                    abline(v = theor_mean, 
                            col= 3,
                            lwd = 2)
                    abline(v = sample_mean, 
                           col = 2,
                           lwd = 2)
            
            legend('topright', c("Sample Mean", "Theoretical Mean"), 
                          lty=c(1,1), 
                          bty = "n",
                          col = c(col=3, col=2))


## Sample Variance vs Theoretical Population Variance

    sample_var <- var(sim$Mean)
    theor_var <- ((1/lambda)^2)/40


          hist(sim$Mean, 
                        breaks = 100, 
                        prob = TRUE, 
                        main ="Exponential Distribution n = 1000", 
                        xlab ="Spread")
                        xfit <- seq(min(sim$Mean), max(sim$Mean), length = 100)
                        yfit <- dnorm(xfit, mean = 1/lambda, sd = (1/lambda/sqrt(40)))
                        lines(xfit, yfit, pch=22, col = 3, lwd=2)
                        legend('topright', c("Theoretical Curve"), lty=1,lwd=2, col=3)


          hist(sim$Mean, 
                        breaks = 100, 
                        prob = TRUE, 
                        main = "Distribution of Simulated Exponential Distribution", xlab="")
                        lines(density(sim$Mean))
                        abline(v = 1/lambda, col = 3)
                        xfit <- seq(min(sim$Mean), max(sim$Mean), length = 100)
                        yfit <- dnorm(xfit, mean = 1/lambda, sd = (1/lambda/sqrt(40)))
                        lines(xfit, yfit, pch=22, col="red", lty=2)
                        legend('topright', c("Simulated Values", "Theoretical Values"), lty=c(1,2), col=c("black", "red"))

                        
## Show that the distribution is approximately normal
                        
    qqnorm(sim$Mean,main="Normal Q-Q Plot")
    qqline(sim$Mean,col="3")


#set directory
setwd("~/Project/GitHub/datasciencecoursera/Statistical_Inference")
knit2html("project1.rmd", "project1.html")
opts_knit$set(base.dir = 'figure')