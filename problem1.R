#macos 'option' + '-' = '<-'
#p1.1
data <- c(rep(0,8),rep(1,2)) #=data<-rep(c(0,1),c(8,2))  
summary(data)
#p1.2
set.seed(1) #保证前后生成的数据一样，参数任意，仅为代号
data <- rnorm(10,10,sqrt(4))  #rnorm（数据量，平均数，标准差）
summary(data)
mean=sum(data)/length(data)
data=c(data,NA) 
summary(data)
mean(data)
help(mean)
mean(data,na.rm=1)
sum(is.na(data)) #计算数据集data中的缺失值总数，which(is.na())返回缺失值位置,sum(complete.cases())完整样本个数
#p2
p=137/526 
se=sqrt(0.26*(1-0.26)/526) 
q=qnorm(0.975) 
round(c(p-q*se,p+q*se),2)
#p2.1
q=qnorm(0.9)
round(c(p-q*se,p+q*se),2)

q=qnorm(0.995)
round(c(p-q*se,p+q*se),2)
#p2.2
p=0.26
se=sqrt(0.26*(1-0.26)/50) 
q=qnorm(0.975) 
round(c(p-q*se,p+q*se),2)
#p2.3
#p2.4        
5/9*(70-32)
5/9*(90-32)#round(5/9*(c(70,90)-32),0) round第二个参数为小数点位数
#p3.1
#p4
a <- rnorm(100,100,2)
b <- rnorm(100,99,2)
boxplot(a,b,las=1,col=c("tan","turquoise"),names=c("a","b"),ylab="score") 
#las=0时纵坐标刻度数值方向是侧着的，1为正，2横坐标标签侧着
qqnorm(a,las=1,pch=16,col="lightseagreen")#pch为画图符号
qqline(a,col="palevioletred")
qqnorm(b,las=1,pch=16,col="lightseagreen")
qqline(b,col="palevioletred")
t.test(a,b,conf.level = .99)
#p5
drug <- c(98.59,99.55,99.99,101.00,99.87,102.36,100.36,102.13,100.04,101.73,
          98.76,106.27,101.36,102.15,105.24,99.93,103.02,102.88,100.4,100.72)
rank(drug)


