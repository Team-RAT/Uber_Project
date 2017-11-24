
# coding: utf-8

# In[182]:


import matplotlib.pyplot as plt
from pandas import DataFrame, Series
import pandas as pd


# In[183]:


get_ipython().magic('pylab inline')


# In[184]:


fig = plt.figure()


# In[185]:


df = pd.read_csv(r'C:\Users\Student\Documents\Uber_Project\data\TourismSpending2014-2016.csv', dtype={'Region': np.object, '2014': np.int32, '2015': np.int32, '2016': np.int32, 'UberIntorduced2015': np.object})


# In[186]:


uberregions = df[df.UberIntroduced2015 == 'YES']


# In[187]:


notuber = df[df.UberIntroduced2015 == 'NO']


# In[188]:


fig = plt.figure()
plt.plot(notuber.mean())
fig.suptitle('Regions where Uber was not introduced in 2015', fontsize=17)
plt.xlabel('Year', fontsize=14)
plt.ylabel('Tourism Spending (£million)', fontsize=14)
fig.savefig('Tourist Spending - uber NOT introduced 2015.jpg')


# In[189]:


fig = plt.figure()
plt.plot(uberregions.mean())
fig.suptitle('Regions where Uber was introduced in 2015', fontsize=17)
plt.xlabel('Year', fontsize=14)
plt.ylabel('Tourism Spending (£million)', fontsize=14)
fig.savefig('Tourist Spending - uber introduced 2015.jpg')

