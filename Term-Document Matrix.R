# Install tm package
install.packages("tm")

# Load tm package
library(tm)

data("crude")
 tdm=TermDocumentMatrix(crude)
 inspect(tdm[100:150,1:20])
 dtm=DocumentTermMatrix(crude)
 inspect(dtm[1:20,100:150])
