df_covariance <- cov(data_nt_pl) # covariance matrix
# print it fancy
df_covariance %>% t() %>% kable("latex", booktabs=TRUE, caption = "Covariance matrix/table") %>% kable_styling(latex_options =c("striped", "HOLD_position"))

df_correlation <- cor(data_nt_pl) # correlation matrix
# print it fancy
df_correlation %>% t() %>% kable("latex", booktabs=TRUE, caption = "Correlation matrix/table") %>% kable_styling(latex_options =c("striped", "HOLD_position"))

## png(filename="images/plot04.png", width = 2*500, height = 2*500)
## # plot(data_nt_pl)
## ## put histograms on the diagonal
## panel.hist <- function(x, ...)
## {
##     usr <- par("usr"); on.exit(par(usr))
##     par(usr = c(usr[1:2], 0, 1.5) )
##     h <- hist(x, plot = FALSE)
##     breaks <- h$breaks; nB <- length(breaks)
##     y <- h$counts; y <- y/max(y)
##     rect(breaks[-nB], 0, breaks[-1], y, col = "light blue", ...)
## }
## pairs(data_nt_pl, panel = panel.smooth,
##       cex = 1.5, pch = 1, bg = "light blue", horOdd=TRUE,
##       diag.panel = panel.hist, cex.labels = 2, font.labels = 2)
## dev.off()


## # Parrallel coordinates plot
## png(filename="images/plot05.png", width = 2*500, height = 1*400)
## plot(x=1:length(data_nt_pl[1,]), y=data_nt_pl[1,], type="l",
##      col=my_r_color, las=1, xaxt = "n")
## axis(1, at=1:length(data_nt_pl[1,]), labels=colnames(data_nt_pl))
## for(i in 2:length(data_nt_pl[,1])){
##   lines(x=1:length(data_nt_pl[i,]), y=data_nt_pl[i,], col=my_r_color[i])
## }
## dev.off()
## # multivariate scatterplots
## png(filename="images/plot06.png", width = 2*500, height = 1*400)
## boxplot((data_nt_pl), col=my_r_color, horizontal=T, las=1)
## dev.off()
## 
## mlab <- "Time it took to run 100m"
## plab <- "Time it took to run 200m"
## layout(matrix(c(2, 0, 1, 3), nrow = 2, byrow = TRUE),
##        widths = c(2, 1),
##        heights = c(1, 2),
##        respect = TRUE)
## png(filename="images/plot07.png", width = 2*500, height = 2*500)
