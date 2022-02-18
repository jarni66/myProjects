
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

tokped_page = 'https://www.tokopedia.com/duhamuslim/product'
driver = webdriver.Chrome()

# TOKPED
driver.get(tokped_page)
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

link_list = []
prod_ca = soup.find_all('div', class_='css-zimbi')
for i in prod_ca:
    li = i.find('a')
    link_list.append(li.get('href'))


prod_card = soup.find_all('div', class_='css-1sn1xa2')


prod_name = []
prod_price = []
prod_sales = []
prod_rating = []
prod_stock = []


for j in prod_card:
    namep = j.find('div',class_='css-1b6t4dn').text
    prod_name.append(namep)
    pricep = j.find('div',class_='css-1ksb19c').text
    prod_price.append(pricep)
    try:
        sold = j.find('span', class_='css-1duhs3e').text
    except:
        sold = ''
    prod_sales.append(sold)
    try:
        ratingp = j.find('span', class_='css-t70v7i').text
    except:
        ratingp = ''
    prod_rating.append(ratingp)
    try:
        stock = j.find('div', class_='css-1458qc4').text
    except:
        stock = 'Tersedia'
    prod_stock.append(stock)

data = {'prod_name':prod_name, 'prod_price':prod_price, 'prod_sold':prod_sales, 'prod_rating':prod_rating, 'prod_stock':prod_stock}
ecommerece_data = pd.DataFrame(data)
ecommerece_data.to_csv('ecommerece_tokped.csv')



print("#########")

print(len(prod_name),'name', prod_name[3])
print(len(prod_sales), 'sales', prod_sales[3])
print(len(prod_stock),'rating', prod_stock[3])
print(len(prod_price),'price', prod_price[3])

print("________FINISH")
