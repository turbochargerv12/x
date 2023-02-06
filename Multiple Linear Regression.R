# Load the mtcars dataset and select columns mpg, disp, hp, and wt
input <- mtcars[, c("mpg", "disp", "hp", "wt")]

# Fit a multiple linear regression model to the data
model <- lm(mpg ~ disp + hp + wt, data = input)

# Summarize the model
summary(model)

# Extract the model intercept and coefficients
a <- coef(model)["(Intercept)"]
Xdisp <- coef(model)["disp"]
Xhp <- coef(model)["hp"]
Xwt <- coef(model)["wt"]

# Predict mpg for a car with disp = 221, hp = 102, and wt = 2.91
x1 <- 221
x2 <- 102
x3 <- 2.91

Y <- a + Xdisp * x1 + Xhp * x2 + Xwt * x3

print(Y)