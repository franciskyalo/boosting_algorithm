-----------------------about project----------------
  
  # in this project, we will use boosting to predict species**
  #*** in the iris data set
  
  #------------------data----------------

data("iris")

head(iris)

summary(iris)

#----------------model-------------------

#partitioning data into training and testing sets

set.seed(123)

split <- sample(2, nrow(iris), replace = T, prob = c(0.8, 0.2))

train <- iris[split==1,]

test <- iris[split==2,]

#training our model

library(gbm)

model.boost <- gbm(Species ~., data=train, distribution = "gaussian",n.trees = 13,
                   interaction.depth = 4, shrinkage = 0.2, verbose = F)
model.boost

# using the model to predict test data

pred <- predict.gbm(model.boost, test)

confusionmatrix <- table(pred, test$Species)

confusionmatrix

gbm.perf(model.boost)
