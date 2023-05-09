Dosage <- c(20, 30, 40, 45, 60)
DrugA <- c(16, 20, 27, 40, 60)
DrugB <- c(15, 18, 25, 31, 40)
Opinion <- c("Excellent", "No effect", "Some effect", "No effect", "Some effect")
drugs <- data.frame(Dosage, DrugA, DrugB, Opinion)
drugs


str(drugs)
plot(drugs)
#examine individual charts
attach(drugs)
plot(Dosage, type = "o", col = "blue")

#"b" means both lines are plotted
plot(Dosage, DrugA, type = "b")

#if we want to plot a cat var
#then we need to convert to factor first

factored_opinion <- as.factor(drugs$Opinion)
drugs$Opinion <- factored_opinion
str(drugs)

plot(drugs$Opinion, las = 2)

#par function - default parameters
opar <- par(no.readonly = TRUE)
#lty = line type
#lwd = line width

par(lty = 2, pch = 17)
plot(Dosage, DrugA, type = "b")
par = opar

#dotted line 3 times wider than default
plot(DrugA, type = "o", 
     pch = 22, 
     lty = 2, 
     col = "red",
     main = "Drug dosage", 
     col.main = "Blue", 
     font.main = 4,
     xlab = "No of days", 
     ylab = "Drug dosage (ml)")

#drug A on the y axis that ranges from 0 to max value
graph_range <- range(0, DrugA, DrugB)
graph_range
plot(DrugA,
     type = "o",
     col = "blue",
     ylim =graph_range,
     axes = FALSE,
     ann = FALSE)

#graph drug B with red dashed lines and square points
lines(DrugB, type = "o", pch = 22,
      lty = 2,
      col = "Red")

#make custom x axis
axis(1, at = 1:5, lab = c("20 ml", "40 ml", "60 ml", "80 ml", "100 ml"))

#make custom y axis
axis(2, las =1, at = 5 * 0:graph_range[2])

#add a box
box()

#plot druga and drugb in one chart
#show drug a as blue line and blue triangles
#and drug b as red line and red square
opar <- par(no.readonly = TRUE)
plot(DrugA,
     type = "o",
     main = "Drug dosage",
     xlab = "No of days",
     ylab = "Drug dosage (ml)",
     col = "blue"
)

#graph drug B with red dashed lines and sq points
lines(DrugB, type = "o", pch = 22, lty = 2, col = "red")
par(opar)

#modify default parameters so that
#graph is 2 inches wide and 3 inches tall
par(pin = c(2,3))

#lines will be twice default width and
#symbols will be 1.5 default size
par(lwd =2, cex = 1.5)

#arrange charts in 3 rows by 1 column
par(mfrow = c(3,1))

plot(DrugA,
     type = "o",
     main = "Drug dosage",
     xlab = "No of days",
     ylab = "Drug dosage (ml)",
     col = "blue"
)
plot(DrugA,
     type = "o",
     main = "Drug dosage",
     xlab = "No of days",
     ylab = "Drug dosage (ml)",
     col = "blue"
)
plot(DrugA,
     type = "o",
     main = "Drug dosage",
     xlab = "No of days",
     ylab = "Drug dosage (ml)",
     col = "blue"
)


#extract data

#changing str
#changing variable names
#subset
#missing data
#plot
