a=glm(formula = am~cyl+hp+wt,data = mtcars,family = binomial)
print(summary(a))
