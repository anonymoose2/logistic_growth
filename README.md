**1) (10 points) Annotate the README.md file in your logistic growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used).****
   
**Answer** 

in this analysis we investigated the dynamics of population growth for a culture of Escherichia coli, with the aim of estimating inital population size, growth rate and carrying capacity.
For this analysis I used the first dataset : growth_data <- read.csv("/cloud/project/experiment1.csv")

Firstly, I constructed two plots, of population size (N) against time (t), with no model fitted to the data. The code for the first plot was as follows

ggplot(aes(t,N), data = growth_data) +
  geom_point() +
   xlab("t") +
   ylab("y") +
  theme_bw()
![20a62089-9358-4b15-a1d6-b499c38f948e](https://github.com/anonymoose2/logistic_growth/assets/150136026/979611e5-46c2-4e4d-89a5-b37f2538c1f3)

On the 2nd plot, I log transformed the y axis (N), the code is as follows

ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  xlab("t") +
  ylab("y") +
  scale_y_continuous(trans='log10')

![2cfde111-7fd9-4481-99fa-886a287c3e5e](https://github.com/anonymoose2/logistic_growth/assets/150136026/8b11a87f-6bfb-4092-bd19-68ea217239b7)


N0 <- exp(6.8941709) #intercept of the 1st regression e^N0

r <- 0.0100086 #gradient of the 1st regression

K <- 6.00e+10 #intercept of 2nd regression

graph to show how prediction fits to model

**2) (10 points) Use your estimates of N0 and r to calculate the population
size at t = 4980 min, assuming that the population grows exponentially.
How does it compare to the population size predicted under logistic
growth?**

**Answer**

Under the assumption of expontential growth:
N(t) = N0e^rt
Population size ( at 4980 minutes) = exp6.8941709e ^ (0.0100086 x 4980) = 4.370846e+24
N(t) = 4.370846e+24

Under the assumption of logistic growth:
N(t) = K + 0 · t 
Population size (at 4980 minutes) = 6.00e+10 
N(t) = 6.00e+10

This is significantly lower than the population size predicted under the exponential model as it assumes that the population is eventually  limited by the resources in the growth medium of the culture and therefore reaches a fixed carrying capcity 

**3.(20 points) Add an R script to your repository that makes a graph
comparing the exponential and logistic growth curves (using the same
parameter estimates you found). Upload this graph to your repo and
include it in the README.md file so it can be viewed in the repo
homepage.**

