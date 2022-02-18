
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

shopee_page = 'https://shopee.co.id/duhamuslimwear#product_list'

driver = webdriver.Chrome()

#SHOPEE
driver.get(shopee_page)
driver.implicitly_wait(60)
print('Page Loaded_______')

action = ActionChains(driver)
action.key_down(Keys.PAGE_DOWN).key_up(Keys.PAGE_DOWN).perform()
time.sleep(2)
print("STARTING PANGING DOWN =============") #just to monitor terminal
con = 0
while con < 8:
    action.key_down(Keys.PAGE_DOWN).key_up(Keys.PAGE_DOWN).perform()
    time.sleep(1.5)
    con += 1
    print(con)
print("DONE PANGING DOWN =============")

html = driver.execute_script("return document.getElementsByTagName('html')[0].innerHTML")
soup = BeautifulSoup(html, "html.parser")
    
prod_card = soup.find_all('div', class_='shop-search-result-view__item col-xs-2-4')


prod_name = []
prod_price = []
prod_sales = []
prod_stock = []

for j in prod_card:
    namep = j.find('div',class_='_1sRyv_ _2j2K92 _3j20V6').text
    prod_name.append(namep)
    pricep = j.find('span',class_='_3TJGx5').text
    prod_price.append(pricep)
    try:
        sold = j.find('div', class_='_2Tc7Qg').text
    except:
        sold = ''
    prod_sales.append(sold)
    try:
        stock = j.find('div', class_='_20V39n').text
    except:
        stock = 'Tersedia'
    prod_stock.append(stock)

next_link = soup.find('link', rel='next').get('href')
driver.get(next_link)
driver.implicitly_wait(60)
print('Page Loaded_______')
print("STARTING PANGING DOWN =============") #just to monitor terminal
con = 0
while con < 15:
    action.key_down(Keys.PAGE_DOWN).key_up(Keys.PAGE_DOWN).perform()
    time.sleep(1.5)
    con += 1
    print(con)
print("DONE PANGING DOWN =============")
html = driver.execute_script("return document.getElementsByTagName('html')[0].innerHTML")
soup = BeautifulSoup(html, "html.parser")
    
prod_card = soup.find_all('div', class_='shop-search-result-view__item col-xs-2-4')
prod_card2 = soup.find_all('div', class_='shop-collection-view__item col-xs-2-4')
prod_card3 = prod_card + prod_card2
for j in prod_card3:
    namep = j.find('div',class_='_1sRyv_ _2j2K92 _3j20V6').text
    prod_name.append(namep)
    pricep = j.find('span',class_='_3TJGx5').text
    prod_price.append(pricep)
    try:
        sold = j.find('div', class_='_2Tc7Qg').text
    except:
        sold = ''
    prod_sales.append(sold)
    try:
        stock = j.find('div', class_='_20V39n').text
    except:
        stock = 'Tersedia'
    prod_stock.append(stock)
data = {'prod_name':prod_name, 'prod_price':prod_price, 'prod_sold':prod_sales, 'prod_stock':prod_stock}
ecommerece_data = pd.DataFrame(data)
ecommerece_data.to_csv('ecommerece_shopee_data.csv')

print("#########")

print(len(prod_name),'name', prod_name[3])
print(len(prod_sales), 'sales', prod_sales[3])
print(len(prod_stock),'rating', prod_stock[3])
print(len(prod_price),'price', prod_price[3])

print("________FINISH")
