

rho11 <- matrix(c(1, .4, .4, 1), nrow = 2)
U1 <- eigen(rho11)$vectors; U1
D1 <- diag(eigen(rho11)$values); D1
rho11; U1%*%D1%*%solve(U1)
rho11_sqrt_inv <- U1%*%solve(sqrt(D1))%*%solve(U1); rho11_sqrt_inv

rho22 <- matrix(c(1, .2, .2, 1), nrow = 2); solve(rho22)
