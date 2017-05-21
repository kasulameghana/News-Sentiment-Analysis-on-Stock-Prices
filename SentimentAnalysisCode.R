library(syuzhet)
library(tidytext)
library(dplyr)
library(tidyr)


topNews=read.csv("C:/Users/pru/Desktop/Data mining/Stock Forecadting project/Combined_News_DJIA.csv")  #Loading data
View(topNews)

s1=data.frame(lapply(topNews, as.character), stringsAsFactors=FALSE) #converting data.frame into character vector
View(s1)

c1=c=do.call(paste, c(s1[3:27], sep = ""))  #combining top 25 news data

c1 = gsub('[[:punct:]]', '', c1)  #remove punctuation using global sub
c1 = gsub('[[:cntrl:]]', '', c1)  #remove control characters
c1 = gsub('\\d+','',c1)  #remove digits
c1[1]

class(c1)
length(c1)

#get_sentiment function gives the overall positive or negative sentiment
sentiment <- get_sentiment(c1,method="syuzhet") 
sentiment

s1$PostiveOrNegative=get_sentiment(c1,method="syuzhet") 
View(s1)

dictionary=get_sentiment_dictionary(dictionary = "syuzhet")
View(dictionary)

#get_nrc_sentiment is used to get eight emotions 
#(anger, fear, anticipation, trust, surprise, sadness, joy, and disgust)
#and two sentiments (negative and positive)

nrc = get_nrc_sentiment(c1) 
View(nrc)


# adding all the sentiment columns to the original dataset
class(s1)
class(nrc)
f1=cbind(s1,nrc)
View(f1)

write.csv(f1, file = "DJIA_WithSentimentAnalysis.csv")
getwd()


