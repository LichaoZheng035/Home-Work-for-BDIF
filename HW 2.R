# HW 2-1 & 2-2 #
year<-c(1988,1991,1996,2000,2003,2007,2014)
RAM<-c(0.002,0.004,0.5,1,2,8,16)
plot(year,RAM)
lines(spline(year,RAM))
lines(spline(year,RAM, n = 201), col = 2)

# HW 2-3 #
x = 6
n = 1000
lambda = 2
p = lambda / n
dbinom (x,2*n,p) # binomial probability mass function
dpois (x, 2*lambda ) # Poisson probability mass function
dpois (0, 5 )
