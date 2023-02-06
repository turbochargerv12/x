# Install packages
install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "ggplot2"))

# Load packages
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)

# Load text data
text <- readLines(file.choose())
text_corpus <- Corpus(VectorSource(text))

# Clean data
text_corpus <- tm_map(text_corpus, removeNumbers)
text_corpus <- tm_map(text_corpus, removePunctuation)
text_corpus <- tm_map(text_corpus, stripWhitespace)
text_corpus <- tm_map(text_corpus, removeWords, stopwords("english"))
text_corpus <- tm_map(text_corpus, stemDocument)
text_corpus <- tm_map(text_corpus, content_transformer(tolower))
text_corpus <- tm_map(text_corpus, removeWords, c("s", "company", "team"))

# Create a term-document matrix
text_dtm <- TermDocumentMatrix(text_corpus)
text_matrix <- as.matrix(text_dtm)

# Find most frequent words
word_frequency <- sort(rowSums(text_matrix), decreasing = TRUE)
word_data <- data.frame(word = names(word_frequency), freq = word_frequency)

# Plot most frequent words
barplot(word_data[1:5, ]$freq, las = 2, names.arg = word_data[1:5, ]$word,
        col = "lightgreen", main = "Top 5 most frequent words",
        ylab = "Word frequencies")

# Generate word cloud
set.seed(1234)
wordcloud(words = word_data$word, freq = word_data$freq, min.freq = 5,
          max.words = 100, random.order = FALSE, rot.per = 0.40, 
          colors = brewer.pal(8, "Dark2"))

# Find associations
findAssocs(text_dtm, terms = c("shine", "place", "move"), corlimit = 0.25)

# Replace characters with spaces
text_corpus <- tm_map(text_corpus, content_transformer(function (x, pattern) gsub(pattern, " ", x)), "/")
text_corpus <- tm_map(text_corpus, content_transformer(function (x, pattern) gsub(pattern, " ", x)), "@")
text_corpus <- tm_map(text_corpus, content_transformer(function (x, pattern) gsub(pattern, " ", x)), "\\|")
text_corpus <- tm_map(text_corpus, content_transformer(tolower))


