X


## 5.1
X = matrix(c(2,8,6,8,12,9,9,10), nrow=4, ncol=2); X
cov(X)
4*t(apply(X,2,mean))%*%solve(cov(X))%*%(apply(X,2,mean))


## 5.3 a)
E0 = matrix(c(-5,1,-2,1,1,-2,-2,-1), nrow = 4); E0
E = matrix(c(-4,2,0,2,2,-1,-1,0), nrow = 4); E
3*det((E0%*%t(E0)))/det((E%*%t(E)))


## 5.4 a)
sweatdata <- read.table("SweatData.DAT",
              col.names = c("sweatrate", "sodium", "potassium"))
S = cov(sweatdata); eigen(S)
p <- ncol(sweatdata); n <- nrow(sweatdata); alpha <- 0.1
half_lengths <- 
  eigen(S)$values*sqrt( p*(n-1)/(n*(n-p))*qf(p=(1-alpha), df1=p, df2=n-p) )
axes = half_lengths*eigen(S)$vectors; axes


## 5.7
alpha <- 0.05; p <- ncol(sweatdata); n <- nrow(sweatdata)
c = sqrt(p*(n-1)/(n-p)*qf(p=(1-alpha), df1=p, df2=n-p ))
mu0 <- c(4, 50, 10)
mu <- apply(sweatdata,2,mean, simplify = TRUE)

c(mu[1] - (c*sqrt(diag(S)[1]/n) ), mu[1] + (c*sqrt(diag(S)[1]/n) ))
c(mu[2] - (c*sqrt(diag(S)[2]/n) ), mu[2] + (c*sqrt(diag(S)[2]/n) ))
c(mu[3] - (c*sqrt(diag(S)[3]/n) ), mu[3] + (c*sqrt(diag(S)[3]/n) ))

t <- qt(p=( 1-(alpha/(2*p)) ), df=n-1)

c(mu[1] - (t*sqrt(diag(S)[1]/n) ), mu[1] + (t*sqrt(diag(S)[1]/n) ))
c(mu[2] - (t*sqrt(diag(S)[2]/n) ), mu[2] + (t*sqrt(diag(S)[2]/n) ))
c(mu[3] - (t*sqrt(diag(S)[3]/n) ), mu[3] + (t*sqrt(diag(S)[3]/n) ))
