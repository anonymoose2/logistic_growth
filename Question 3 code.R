
install.packages("ggplot2")
library(ggplot2)

#setting parameters

N0 <-exp(6.8941709)
r <- 0.0100086
K <- 6.00e+10
t<-4980


logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
}



# Create a data frame for plotting
data <- data.frame(t = t, Logistic = logistic_fun(t), Exponential = exponential_fun(t))

# Plot the graph
ggplot(data, aes(x = t)) +
  geom_function(fun = logistic_fun, aes(colour = "Logistic"), linewidth = 1) +
  geom_function(fun = exponential_fun, aes(colour = "Exponential"), linewidth = 0.8) +
  scale_color_manual(values = c("Logistic" = "darkgreen", "Exponential" = "purple"),
                     name = "Growth curve") +
  scale_y_continuous(trans = "log10") +
  labs(x = "t (minutes)", y = "Log(N)", title = "Comparing exponential and logistic growth curves from parameter estimates of E.Coli cultures") +
  theme_bw() +
  xlim(0, 4500)+
  theme(plot.title = element_text(size = 10))

ggsave("comparison graph.png", height= 10, width =10, dpi=500 )   


