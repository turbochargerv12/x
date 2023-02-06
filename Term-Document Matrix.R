# Install tm package
install.packages("tm")

# Load tm package
library(tm)

# Load crude data
data("crude")

# Create Term Document Matrix
tdm <- TermDocumentMatrix(crude, control = list(removePunctuation = TRUE, stopwords = TRUE))

# Inspect first 20 terms of documents 100 through 150
inspect(tdm[100:150, 1:20])

# Inspect terms "price", "prices", and "texas" in documents "127", "144", "191", and "194"
inspect(tdm[c("price", "prices", "texas"), c("127", "144", "191", "194")])

# Inspect terms "prices" and "oil" in document "191"
inspect(tdm[c("prices","oil"), c("191")])

# Create Document Term Matrix
dtm <- DocumentTermMatrix(crude, control = list(removePunctuation = TRUE, stopwords = TRUE))

# Inspect first 20 documents of terms 100 through 150
inspect(dtm[1:20, 100:150])
