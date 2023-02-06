install.packages("ggplot2")

library(ggplot2)

# Box plot of mpg
boxplot(mtcars$mpg)

# Scatter plot of wt vs mpg with color representing disp
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) + geom_point()

# Histogram of mpg
ggplot(mtcars, aes(x = mpg)) + geom_histogram()

# Box plot of mpg by cyl
boxplot(mpg ~ cyl, data = mtcars, xlab = "Cylinder")

# Dot plot of gear vs cyl
ggplot(mtcars, aes(x = gear, y = cyl)) + geom_dotplot(binaxis = "y", stackdir = "center", stackratio = 2, dotsize = 1)
