#Vikas Pal
#the data show the text minning and representation of it the form of word cloud

#loading data from the local folder
data <- read.csv('data.csv',header = FALSE)

#handling emoticons
data <- sapply(data,function(row) iconv(row, 'latin1', 'ASCII',sub = ''))

#calling text mining package
library(tm)

#making it a corpus vector source
newCorpus <- Corpus(VectorSource(d))
#making all the text to lower case
newCorpus <- tm_map(newCorpus, content_transformer(tolower))
#removing al the punctuation from the data
newCorpus <- tm_map(newCorpus, removePunctuation)
#removing all the numbers from the data, this will also remove the date written in number format
newCorpus <- tm_map(newCorpus, removeNumbers)
#remove teh extra white spaces from the data
newCorpus <- tm_map(newCorpus, stripWhitespace)
#taking care of all thee stopwords in english language
newCorpus <- tm_map(newCorpus, removeWords, stopwords("english"))
#stemming the data
newCorpus <- tm_map(newCorpus, stemDocument, language = 'english')

#creating a document term frequency
ndtm <- DocumentTermMatrix(newCorpus)
nndtm <- as.matrix(ndtm)

#calling wordcloud package 
library(wordcloud)

#this wil get the sum of the occurance of the words
f <- colSums(nndtm)
#sorting it in decreasing form
f <- sort(f, decreasing = TRUE)
#view the occurance of the data
head(f)
#taking the names of the words occured in the data and converting it to a vector form
words <- names(f)
words <- as.vector(words)

#making it into a dataframs so the extraction of words and frequency will be easy
f1 <- as.data.frame(f)
#writing the data with word frequency
write.csv(x = f1,file = 'newdata.csv')
#taking the frequency of the occured word
freq <- f1$f

#RColorBrewer package to get the color in the word cloud
library(RColorBrewer)

##following type to get the output in the form of word cloud
#Type1
wordcloud(words, scale = c(2,.2))

#Type 2
wordcloud(words = words, 
          freq = freq, 
          min.freq = 4,
          colors = brewer.pal(8, "Dark2"))

#Type 3
wordcloud(words = words, 
          freq = freq, 
          min.freq = 4,
          scale = c(5,0.5),
          random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))
