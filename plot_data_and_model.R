#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(6.8941709) #intercept of the 1st regression e^N0
  
r <- 0.0100086 #gradient of the 1st regression
  
K <- 6.00e+10 #intercept of 2nd regression

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')


ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

scale_y_continuous(trans='log10')

#packages used
sink(file = "package-versions.txt")
sessionInfo()
sink()
