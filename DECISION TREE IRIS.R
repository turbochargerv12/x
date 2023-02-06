library(caret)
library(rpart.plot)

# Load the Iris Dataset
irisdata <- datasets::iris

# Check the Attributes and Class Distribution in the Data
head(iris)
table(iris$Species)

# Summary of Data
summary(irisdata)

# Structure of Data
str(irisdata)

# Split Data into Training and Testing Sets
set.seed(3033)
intrain <- createDataPartition(y = irisdata$Species, p = 0.7, list = FALSE)
training <- irisdata[intrain,]
testing <- irisdata[-intrain,]

# Train a Decision Tree Model with Information Gain Split Criteria
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
dtree_fit_info <- train(Species ~ ., data = training, method = "rpart",
                        parms = list(split = "information"), trControl = trctrl,
                        tuneLength = 10)

# Plot the Trained Model
prp(dtree_fit_info$finalModel, box.palette = "Reds", tweak = 1.2)

# Predict the Outcome for Testing Data
test_pred_info <- predict(dtree_fit_info, newdata = testing)
confusionMatrix(test_pred_info, testing$Species)

# Train a Decision Tree Model with Gini Coefficient Split Criteria
set.seed(3333)
dtree_fit_gini <- train(Species ~ ., data = training, method = "rpart",
                        parms = list(split = "gini"), trControl = trctrl,
                        tuneLength = 10)

# Plot the Trained Model
prp(dtree_fit_gini$finalModel, box.palette = "Blues", tweak = 1.2)

# Predict the Outcome for Testing Data
test_pred_gini <- predict(dtree_fit_gini, newdata = testing)
confusionMatrix(test_pred_gini, testing$Species)
