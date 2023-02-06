x=c(1,2,3,4,5)
 y=c(11,22,33,44,55)
 print(summary(lm(y~x)))
 plot(y,x,col="blue",main="Height and weight regression",abline(lm(x~y)),xlab="kg",ylabs="cm")
