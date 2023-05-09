str(beaver2)
summary(beaver2)


beavers_data <- beaver2

pairs(beavers_data, labels = colnames(beavers_data), 
      main = "Beavers dataset correlation plot")

#labels start with what is assigned to lower value first

beavers_data$new_activity <- factor(beavers_data$activ, labels = c("no", "yes"))

attach(beavers_data)
tapply(temp, activ, summary)
par <- opar
plot(beavers_data$activity,
     temp,
     pch = 19,
     col = "lightblue")
#cant show categorical data in scatter plot

#Q2
#to display normality of data
hist(temp)
#dont do this
hist(activ)


hist(beavers_data$temp, col = "steelblue", main = "Histogram of Temperature")
hist(beavers_data$activ, col = "steelblue", main = "Activity" )


library(lattice)
histogram(~temp | activ,
          data = beavers_data,
          main = "Distribution of beaver activity data",
          xlab = "temp(deg)", ylab = "Activity(%)")

#Q - Q plot can help to determine normality

qqnorm(beavers_data$temp)
qqline(temp, col = "red")

with(beavers_data, qqnorm(temp[activ == "no"], 
                          temp[activ == "yes"],
                          main = "Comparing 2 samples of activity data",
                          xlab = "Active = yes",
                          ylab = "Active = no"))

