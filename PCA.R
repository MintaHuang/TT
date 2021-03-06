---
title: "5241 HW1"
author: "MengjiaH"
date: "2018/2/4"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, warning = FALSE)
```
#Problem 3
#1
```{r, warning=FALSE}
library(quantmod)
library(TTR)
index=c("DWDP","AAPL","GS","NKE","V","UNH","CSCO","TRV","CVX","PFE","VZ","HD","INTC","MSFT","JNJ","WMT","CAT","JPM","DIS","BA","KO","MCD","AXP","IBM","MRK","MMM","UTX","PG","XOM","GE")
data=matrix(data=rep(0,251*30),nrow = 251)
for(i in 1:30){
  sub_index=index[i]
  data[,i]=getSymbols( sub_index, auto.assign = F, from = "2017-01-01", to = "2018-01-01")[,4]
}

colnames(data)<-c("DWDP","AAPL","GS","NKE","V","UNH","CSCO","TRV","CVX","PFE","VZ","HD","INTC","MSFT","JNJ","WMT","CAT","JPM","DIS","BA","KO","MCD","AXP","IBM","MRK","MMM","UTX","PG","XOM","GE")
head(data)
```

#2
```{r}
pr.out=princomp(data,cor=FALSE)
pr.out
biplot(pr.out,cex=0.8)
screeplot(pr.out,npcs = min(10,length(pr.out$sdev)),type = "barplot")
```

Comment: 

First, from the screeplot, we can see that the variances of the first PC is much higher than the rest, which means the first component can almost represent the distribution of the data without normalizing the variances.
From the biplot, we can see that there are several clusters based on the dates of the stocks (sort of depends on seasons). Boeing is very significant in the first component. This means that the stock price of Boeing varies a lot compared with others. Goldman Sachs is significant in the second component. 


#3
```{r}
pr.out1=princomp(data,cor=TRUE)
pr.out1
biplot(pr.out1,cex=0.6)
screeplot(pr.out1,npcs=min(10,length(pr.out1$sdev)),type="barplot")
```

Comment: 

From the screeplot, we can see that the variances of the first two PCs are higher than the rest.However, only use the first two may lose some of the features in the data because the third and fourth PCs also can explain some variance of data.
From the biplot, we can see that the cluster which depends seasons still exists.All stocks are almost equally important in the first two principal components. Some of them are more important in the first one. Others are more important in the second. Besides, some of them are more correlated with each others because the vectors are closer between them.


#4
```{r}
dim(data)
returndata=matrix(data=rep(0,250*30),nrow = 250)
for(i in 1:30){
  returndata[,i]= (data[-1,i]/data[-251,i])-1
}
colnames(returndata)<-c("DWDP","AAPL","GS","NKE","V","UNH","CSCO","TRV","CVX","PFE","VZ","HD","INTC","MSFT","JNJ","WMT","CAT","JPM","DIS","BA","KO","MCD","AXP","IBM","MRK","MMM","UTX","PG","XOM","GE")

dim(returndata)

pr.out2=princomp(returndata,cor=TRUE)
biplot(pr.out2,cex=0.6)
screeplot(pr.out2,npcs=min(10,length(pr.out2$sdev)),type="barplot")
```

Comment: 

From the screeplot, although the first two PCs still explain larger variance than the other PCs, the rest PCs take a moderate part of explaining the variance. Thus, only using the first two PCs will lose some of the features in the data. Meanwhile, the returns of the stocks are correlated with each other (Some of them are highly correlated).The screeplot should look flat if all the stocks are independent and randomly changed with each other. 
From the biplot, the return seems to mix along the entire year because no obvious seasonal change here. They are almost equally important in the first principal component.





