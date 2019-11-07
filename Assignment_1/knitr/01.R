expo<-function(x){
  return(x^5*exp(-x)/120)}
f.MCMC.MHoo<-function(nstep,X0,props){
  vN<-1:nstep
  vX<-rep(X0,nstep);
  for (i in 2:nstep){
    X<-vX[i-1]
    Y<-rlnorm(1, meanlog = log(X), sdlog = props)
    u<-runif(1) # this is a comment
    a<-min(c(1,(expo(Y)*dlnorm(X,meanlog = log(X),sdlog=props))/
               (expo(X)*dlnorm(Y,meanlog =log(X),sdlog=props))))
    if (u <=a){vX[i]<-Y}else{vX[i]<-X}
  }
  return(cbind(vN,vX))}
plot01 <-f.MCMC.MHoo(2000,50,1)