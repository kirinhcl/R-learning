library(tidyverse) #select函数会用到
help(mtcars) #查看数据，发现其中vs和am列为非连续性变量，后面会去掉
data(mtcars)
summary(mtcars)
mtcars <- mtcars %>% select(-c(vs,am))#剔除vs和am列, -c()即剔除
mtcars_pca <- prcomp(mtcars,center = TRUE,scale.=TRUE) #主成分分析
summary(mtcars_pca)
biplot(mtcars_pca,las=1,
       col=c("darkslategrey","firebrick"),cex=rep(.6,2))
#las在problem1提过，col颜色，cex为点的标签大小，rep也在problem1

#solution第二种biplot
#install.packages('devtools')安装devtools包
#library(devtools)载入包
#install_github("vqv/ggbiplot")安装ggbiplot包
library(ggbiplot)#载入ggbiplot
ggbiplot(mtcars_pca, labels=rownames(mtcars))

mtcars_country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3), "Europe",
                    rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe", 3))
#创建产地向量
ggbiplot(mtcars_pca, ellipse=TRUE, labels=rownames(mtcars), groups=mtcars_country)
#ellipse加椭圆，lables箭头标签，rownames为数据第一列的行名，groups分组 分组上色、椭圆
ggbiplot(mtcars_pca, ellipse=TRUE, choices=c(1,3), labels=rownames(mtcars), groups=mtcars_country)
#choices选择PCs，该例子choices=c(1,3)为选了PC1和PC3