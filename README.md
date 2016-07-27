# whatsapp-chat-text-mining
This is a code written in R to show the text extraction from a whatsapp chat and representing them in a form of word cloud.
Basically the idea is to mine all the words/texts used in the group and find the most frequent words.

Following are the steps involved in the process,
1. Extract the data in the required form.
2. Data cleaning by getting rid of emoticons, punctuations, numbers, stopwords.
3. Stemming of the data.
4. Creating a vector corpus of the data
5. Making document term matrix of the same.
6. Create a word cloud of the text extracted with respective to its ocurring frequency.

R library which were used are - dplyr, tm, wordcloud, RColorBrewer.
