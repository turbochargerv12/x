 text=readLines(file.choose())
 text=Corpus(VectorSource(text))
 text=tm_map(text,removeNumbers)
 text=tm_map(text,removePunctuation)
 text=tm_map(text,removeWords,stopwords("english"))# remove

# common english words

text=tm_map(text,stemDocument)#stemming( turn to root words)
 
text=tm_map(text,content_transformer(tolower))#to lower case

 #frequency
dtm=as.matrix(TermDocumentMatrix(text))

dtm_v=sort(rowSums(dtm),decreasing = TRUE)
 
print(dtm_v)
 
frame=data.frame(word=names(dtm_v),freq=dtm_v)
 
barplot(frame[1:5,]$freq,names.arg = frame[1:5,]$word)

wordcloud(words = frame$word,freq = frame$freq)
