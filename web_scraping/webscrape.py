from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
import time
import pandas as pd
from bs4 import BeautifulSoup

chrome_options = Options()
chrome_options.add_argument('disable-notifications')
chrome_options.add_argument('--disable-infobars')
chrome_options.add_argument('start-maximized')

#this URL is search page in glints.com and i using keyword Data Analyst
page_url = 'https://glints.com/id/opportunities/jobs/explore?keyword=Data+Analyst&country=ID&locationName=Indonesia'

driver = webdriver.Chrome()

driver.get(page_url)        #accessing page
driver.implicitly_wait(60)  #waiting page to loading all element
print('Page Loaded_______') #just to monitor terminal

#this set of code is to press page down on webpage 1 time
action = ActionChains(driver)
action.key_down(Keys.PAGE_DOWN).key_up(Keys.PAGE_DOWN).perform()
time.sleep(5)

#pop up element will appear after some action happen in page
#this code will click close button on popup element
pat = '/html/body/div/div/div/div/div/div/div/div/div/div/div/header/button'
close_butt = driver.find_element_by_xpath(pat)
close_butt.click()
time.sleep(5)

#after element close
#code below do scrolling down the page with page down button to load all jobs card
print("STARTING PANGING DOWN =============") #just to monitor terminal
con = 0
while con < 100:
    action.key_down(Keys.PAGE_DOWN).key_up(Keys.PAGE_DOWN).perform()
    time.sleep(1.5)
    con += 1
    print(con)
print("DONE PANGING DOWN =============") #just to monitor terminal

#the code below is to get the html resources and then parsed with beautifulsoup
html = driver.execute_script("return document.getElementsByTagName('html')[0].innerHTML")
soup = BeautifulSoup(html, "html.parser")
section = soup.find('div', class_='CompactJobCardListsc__JobCardListContainer-sc-1jkgvrs-0 NTbmw stylessc__CompactJobCardList-aui2cq-0 gZatJu')
card = section.find_all('div', class_='JobCardsc__JobcardContainer-sc-1f9hdu8-0 RBKNv CompactOpportunityCardsc__CompactJobCardWrapper-sc-1y4v110-0 cqpitP compact_job_card')

#some list below to contains data
job_title = []
job_comp = []
job_det = []

#start collecting data
print('START COLLECTING DATA==========') #just to monitor terminal
for i in card:
    job_title.append(i.find('h3', class_='CompactOpportunityCardsc__JobTitle-sc-1y4v110-7 iHWORg').text)
    try:
        job_comp.append(i.find('a', class_='CompactOpportunityCardsc__CompanyLink-sc-1y4v110-8 bKQzLW').text)
    except:
        job_comp.append('')
    details = i.find_all('div', class_='CompactOpportunityCardsc__OpportunityInfo-sc-1y4v110-13 fEKNZJ')
    a = []
    for j in details:
        a.append(j.text)
    job_det.append(a)

print('END COLLECTING DATA==========') #just to monitor terminal

#after data collected, it convert to dataframe
print('BUILD DATAFRAME=====') 
dataset = pd.DataFrame({'job_title':job_title, 'job_company':job_comp, 'job_details':job_det})
dataset.to_csv('dataset.csv') #save dataframe to csv, then process in Jupyter Notebook
print('DONE BUILD DATAFRAME=====')#just to monitor terminal


time.sleep(5)


print('length job card data', len(card))    #to monitor how much jobs data we get
#to monitor if all data contain same lenght
print('lenght data=======', len(job_title)) 
print('lenght data=======', len(job_comp))
print('lenght data=======', len(job_det))

print('finish=================================')
