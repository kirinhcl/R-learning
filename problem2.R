#p1.1
set.seed(2)
a <- rnorm(20,mean=0,sd=1)
b <- c(a,300)
summary(a)
summary(b)
sd(a) #var算方差。sd算标准差
sd(b)
IQR(a) #四分位距
IQR(b)

#p1.2
zscale_a <- scale(a,center = TRUE, scale = TRUE) #center中心化（减去均值），scale标准化（减去均值再除以标准差）
zscale_b <- scale(b,center = TRUE, scale = TRUE)
mscale_a <- scale(a,center = min(a), scale = max(a)-min(a)) #减去center再除以scale
mscale_b <- scale(b,center = min(b), scale = max(b)-min(b))
summary(zscale_a)
summary(zscale_b)
summary(mscale_a)
summary(mscale_b)
sd(zscale_a)
sd(zscale_b)
sd(mscale_a)
sd(mscale_b)
IQR(zscale_b)
IQR(zscale_a)
IQR(mscale_a)
IQR(mscale_b)

#p1.3
bimodal <- c(rnorm(50,mean=-5,sd=1),rnorm(50,mean=5,sd=1))
summary(bimodal)
sd(bimodal)
IQR(bimodal)
hist(bimodal,nclass=40) #画直方图，nclass=breaks

#p2.1
data(iris) #加载iris数据
library(tidyverse)
round(cor(select(filter(iris,Species=="setosa"),1:4)),3) 
#filter(x,xxx=="xxx"),select(数据框名，列名1:4=1，2，3，4)
#cor(x,y)协方差系数，p=[(xi-mean(x))*(yi-mean(y))]的总和/（n*x标准差*y标准差）
#round(x,3)其中3为小数位数
#也可写作 iris %>% filter(Species=="setosa") %>% select(1:4) %>% cor() %>% round(3)
round(cor(select(filter(iris,Species=="versicolor"),1:4)),3)
round(cor(select(filter(iris,Species=="virginica"),1:4)),3)

#p1.2
ggplot()+
  geom_density(data=iris,mapping = aes(x=Sepal.Length))
#x=Sepal.Length横坐标

ggplot()+
  geom_density(data=iris, mapping = aes(x=Sepal.Length, fill=Species))
#fill=species即该数据以species分类，填充不同的颜色

ggplot()+
  geom_density(data=iris, mapping = aes(x=Sepal.Length, fill=Species, alpha=0.5))
#alpha透明度

ggplot()+
  geom_density(data=iris, mapping = aes(x=Sepal.Length, fill=Species, alpha=0.5))+
  scale_fill_brewer(palette="Dark2")
#更换配色方案

ggplot()+
  geom_density(data=iris, mapping = aes(x=Sepal.Length, fill=Species, alpha=0.5))+
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()
#theme_minimal主题为去掉坐标轴边框，默认为theme_grey()灰色背景

ggplot()+
  geom_bar(data=iris, mapping = aes(x=Species, fill=Species,alpha=0.5))+
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()
ggplot()+
  geom_boxplot(data=iris, mapping = aes(y=Sepal.Length, fill=Species,alpha=0.5))+
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()
ggplot()+
  geom_point(data=iris, mapping = aes(x=Sepal.Width,y=Sepal.Length, color=Species,alpha=0.5))+
  scale_color_brewer(palette="Dark2")+
  theme_minimal()
#install.packages("GGally")
library(GGally)
library(ggplot2)
ggpairs(iris,mapping=aes(color=Species,alpha=0.5))+
  scale_color_brewer(palette="Dark2")+
  scale_fill_brewer(palette="Dark2")+
  theme_minimal()

