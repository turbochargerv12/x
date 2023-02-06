library(caret)

library(rpart.plot)

intrain=createDataPartition(y=iris$Species,p=0.7,list = FALSE)

training=iris[intrain,]

testing=iris[-intrain,]

trctrl=trainControl(method = "repeatedcv",number = 10,repeats =3)

dtree_fit_info <- train(Species ~., data = training, method = "rpart", parms = list(split = "gini(or information)"), trControl=trctrl)

prp(dtree_fit_info$finalModel)
 
test_info=predict(dtree_fit_info,newdata=testing)

confusionMatrix(test_info,testing$Species)
