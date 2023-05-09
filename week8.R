insurance_data <- read.csv("insurance.csv", na="")
str(insurance_data)

#converting sex, smoker, region

insurance_data$sex_data <- factor(insurance_data$sex, labels = c("female", "male"))
insurance_data$sex <- insurance_data$sex_data
insurance_data

insurance_data$smoker_data <- factor(insurance_data$smoker)
insurance_data$smoker <- insurance_data$smoker_data

insurance_data$region_data <- factor(insurance_data$region)
insurance_data$region <- insurance_data$region_data
str(insurance_data)

insurance_data$sex <- insurance_data$sex_data
insurance_data$smoker <- insurance$smoker_data
insurance_data$region <- insurance_data$region_data

#balance of the categorical variables
table(insurance_data$sex)
table(insurance_data$smoker)
table(insurance_data$region)

#initial investigation of the data
pairs(insurance_data)

install.packages("psych")
library(psych)
pairs.panels(insurance_data,
            smooth = FALSE,
            density = TRUE,
            method = "spearman",
            pch = 21,
            cor = TRUE,
            factor = TRUE)
set.seed(1)
#formula = dependent~independent, independent 
model <- lm(formula = charges ~ 
              age + 
              sex +
              bmi +
              children + 
              smoker +
              region,
            data = insurance_data)
model
