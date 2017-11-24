
# coding: utf-8

# In[1]:


from twython import TwythonStreamer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from pprint import pprint
import re
import pymongo
from wordcloud import WordCloud
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import Image
import os
import pickle


# In[2]:


#twitter keys
CONSUMER_KEY = r'Et3rX2Zjpa2VQVGUJSbMgj960'
CONSUMER_SECRET = r'jBzvvxc6MS3ErmP7HBb53VyqoktUKVblxgpUtv19r5O9hrOXqV'
ACCESS_TOKEN = r'357028618-gIFRDv1f5tsBX5KZCR4u7hgKuufIPjiTQ9m4K4kw'
ACCESS_TOKEN_SECRET = r'0Wlzyj0hpBqEKJZ5sUbr8AWQC0CvHedHM19IAYTx7kKXP'


# In[3]:


analyser = SentimentIntensityAnalyzer() #Initializes Sentiment Analyser.
negdict = {}
posdict = {}
negawords = {}
poswords = {}
conn = pymongo.MongoClient() #Creates a connection to local MongoDB database.
tweet_collection = conn.uber.tweets #Creates a collection called tweets. 
array = []


# In[4]:


from nltk.corpus import stopwords


# In[5]:


stop = stopwords.words('english')

with open(r'C:\Data\twitterwords.txt','r') as twitterwords:
    twwords = [line.strip() for line in twitterwords] #Lists of all the most commen words on twitter.

with open(r"C:\Data\dictionarywords.txt",'r') as dictwords:
    dictwords = [line.strip() for line in dictwords] #Lists of all words in the english dictionary.


# In[6]:


class MyStreamer(TwythonStreamer):  # inherits from base class TwythonStreamer.

    counter = 0
    def on_success(self, data):
            try:
                tweet_dict = {}
                tweet_dict['text'] = data['text']
                tweet_dict['sentiment'] = analyser.polarity_scores(data['text'])['compound']
                array.append(tweet_dict) #creates an array of dictionaries.
                if data['lang'] == 'en':
                    MyStreamer.counter += 1
                    print('Yes - Tweet number {a} has arrived'.format(a=MyStreamer.counter))
                    tweet_words = [words.strip().replace(':','') for words in data['text'].split()]
                    twe = [w for w in tweet_words if w in dictwords]
                    tweets = [wor.lower().strip() for wor in twe if wor.lower().strip() not in (stop and twwords)]
                    for word in tweets:
                        if float(analyser.polarity_scores(data['text'])['compound'])<0:
                             negdict[word] = negdict.get(word,0) + 1 #Collects negative sentiment words.
                        elif float(analyser.polarity_scores(data['text'])['compound'])>0:
                            posdict[word] = posdict.get(word,0) + 1 #Collects positive sentiment words.
            except:
                pass

    def on_error(self, status_code, data):
        print(status_code, data)
        self.disconnect()


stream = MyStreamer(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)


# In[ ]:


while True:
    stream.statuses.filter(track='uber,Uber,UBER') 
#Searches for Uber related tweets.


# In[ ]:


tweet_collection.insert_many([t for t in array])
#For each tweet, this uploads the tweet text and sentiment to pymongo.


# In[10]:


negwordslist = np.array(sorted(negdict.items(), key =lambda x: x[1], reverse=True)) 
pickle.dump(negwordslist, open(r'C:\Users\Admin\Documents\UberProject\code\TwitterStreamer\negativeword.pkl','wb'))
# Orders negative words in descnding order w.r.t vword count and pickles the list.


# In[11]:


poswordslist = np.array(sorted(posdict.items(), key =lambda x: x[1], reverse=True))
pickle.dump(poswordslist, open(r'C:\Users\Admin\Documents\UberProject\code\TwitterStreamer\positiveword.pkl','wb'))
# Orders positive words in descnding order w.r.t vword count and pickles the list.


# In[13]:


words_amount_neg = 10 
for keys in range(0,words_amount_neg):
    negawords[str(negwordslist[keys:keys+1,0][0])]= int(negwordslist[keys:keys+1,1][0])
#Converts negwordslist into a dictionary


# In[ ]:


words_amount_pos = 10 #len(poswordslist)
for keys in range(0,words_amount_pos):
    poswords[str(poswordslist[keys:keys+1,0][0])]= int(poswordslist[keys:keys+1,1][0])
#Converts poswordslist into a dictionary


# In[15]:


get_ipython().magic('matplotlib inline')


# In[16]:


with Image.open(r"C:\Users\Admin\Pictures\taxi.png",'r') as image:
    mask = np.array(image)
#Converts image to numpy array.


# In[ ]:


#Negative words Wordcloud.
plt.figure(figsize=(10,10))
negwordcloud = WordCloud(mask=mask,background_color='white',colormap='inferno',normalize_plurals=True).generate_from_frequencies(negawords)
plt.title("Negative Trump")
plt.axis("off")
plt.imshow(negwordcloud)


# In[ ]:


#Positive words word cloud.
plt.figure(figsize=(10,10))
negwordcloud = WordCloud(mask=mask,background_color='white',normalize_plurals=True).generate_from_frequencies(poswords)
plt.title("Negative Trump")
plt.axis("off")
plt.imshow(negwordcloud)

