cars_data <- mtcars
?mtcars
str(cars_data)
attach(cars_data)

#q2
#A - show charts
hist(cars_data$mpg, main = "Freuency plot for miles/gallon",col= "steel blue")
hist(cars_data$wt, main = "Frequency plot for weight", col= "steel blue")

#B - perform test for normality
qqnorm(cars_data$mpg, main = "qq plot for mpg")
qqline(cars_data$mpg, col = "red")

qqnorm(cars_data$wt, main = "qq plot for wt('000lbs)")
qqline(cars_data$wt, col = "red")

#shapiro-wilks test 
#p-value < 0.05 not normally distributed
#p-value < 0.05 normally distributed

normality_test <- shapiro.test(cars_data$wt)
normality_test$p.value

normality_test <- shapiro.test(cars_data$mpg)
normality_test$p.value

#run pearsons test
cor.test(cars_data$wt, cars_data$mpg, method = "pearson")

#Q4
#Convert am to a factor as it is categorical
cars_data$am <- factor(cars_data$am, labels = c("automatic", "manual"))

#check the distribution of the categorical variable
attach(cars_data)
library("lattice")
histogram(~hp | am, 
          data = cars_data, 
          main = "Horse power distribution by transmission type")

shapiro.test(cars_data$am)
tapply(hp, am, shapiro.test)
shapiro.test(hp)
#summary
#hp = not normally dist(continuous)
#am = not normally dist(cat) (dependent)

#Mann-whitney test
wilcox.test(hp ~am)


