# required libraries
library(dplyr)
library(kableExtra)
library(RColorBrewer)
my_r_color <- brewer.pal(n=12, name="Paired") # colorblind friendly
# load data
data_nt <- read.table(file="T1-9.dat")
# add feature names
colnames(data_nt) <- c("Country", "100m", "200m", "400m","800m", "1500m", "3000m", "marathon")

# get the analicys of each feature
data_nt_anal <- data.frame("mean"=apply(data_nt[,-1], 2, mean),
            "median"=apply(data_nt[,-1], 2, median),
            "sd"=apply(data_nt[,-1], 2, sd),
            "min"=apply(data_nt[,-1], 2, min),
            "max"=apply(data_nt[,-1], 2, max),
            "top 5%"=apply(data_nt[,-1], 2, FUN=function(x){quantile(x,0.05)}),
            "top 95%"=apply(data_nt[,-1], 2, FUN=function(x){quantile(x,0.95)}))
# create a fancy table
data_nt_anal %>% t() %>% kable("latex", booktabs=TRUE, caption = "Analysis by numbers") %>% kable_styling(latex_options =c("striped", "HOLD_position"))

## random nice plots
## stacked barchart
data_nt_pl <- data_nt[,-1]
rownames(data_nt_pl) <- data_nt[,1]
# sort from lowest to higher time
totsum <- apply(data_nt_pl, 1, sum)
totsum <- sort(totsum); index_x <- c()
for(i in 1:length(totsum)){
  index_x <- c(index_x, 
               which(rownames(data_nt_pl) == names(totsum)[i]))
}
## png(filename="images/plot01.png", width = 2*500, height = 1*350)
## data_nt_pl[index_x,] %>% t() %>% barplot(col=my_r_color, las=2)
## dev.off()
## 
## ## find extreme values
## colnames_cat <- colnames(data_nt_pl)
## png(filename="images/plot02.png", width = 2*500, height = 1*450)
## par(mfrow = c(2,4))
## for(i in 1:length(data_nt_pl)){
##   s=2
##   boxplot(data_nt_pl[,i], col=my_r_color[i], main= colnames_cat[i],
##           cex.main=s) #cex.lab=s, cex.axis=s, cex.sub=s)
## }
## par(mfrow = c(1,1))
## dev.off()
## 
## # find if variables are normaly distributed/ hustogram with density curve
## png(filename="images/plot03.png", width = 2*500, height = 1*450)
## par(mfrow = c(2,4))
## for(i in 1:length(data_nt_pl)){
##   # avoid desity line being cutted
##   dessitylocal=density(data_nt_pl[,i])
##   hist(data_nt_pl[,i], col=my_r_color[i], main= colnames_cat[i],
##           ylim = c(0, max(dessitylocal$y)), cex.main=2, freq=FALSE)
##   lines(dessitylocal, lwd=2)
##   lines(density(data_nt_pl[,i], adjust=2),
##         lwd=2, lty="dotted")
## }
## par(mfrow = c(1,1))
## dev.off()
