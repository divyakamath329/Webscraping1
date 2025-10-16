library(rvest)
url<-"https://books.toscrape.com/"
html_content<-read_html(url)
print(html_content)

#define xpath
title_xpath<-'//*[@class="product_pod"]/h3/a'
price_xpath<-'//*[@class="product_pod"]/div[2]/p[1]'

title<-html_content%>%html_nodes(xpath=title_xpath)%>%html_text()%>%trimws()
print(title)

price<-html_content%>%html_nodes(xpath=price_xpath)%>%html_text()%>%trimws()
print(price)

#convert to data frames
books<-data.frame(TITLE=title,PRICE=price)
print(books)

#convert to csv
write.csv(books,"book_data.csv",row.names = FALSE)