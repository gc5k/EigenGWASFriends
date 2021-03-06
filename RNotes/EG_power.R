m=1000000
alpha=0.05
pcut=alpha/m
chiT=qchisq(pcut, 1, lower.tail = F)

n=c(100,  200,  500,   1000,  1500,  2000,
    5000, 7500, 10000, 15000, 20000, 50000)
PW=matrix(0, 2, length(n))

w1=0.3
w2=1-w1

p1=0.35
h1=2*p1*(1-p1)
p2=0.5
h2=2*p2*(1-p2)

p=w1*p1+w2*p2
H=w1*h1+w2*h2

for(i in 1:length(n)) {
  ncpA=4*n[i]*w1*w2*(p1-p2)^2/(2*p*(1-p))
  ncpD=n[i]*w1*w2*(h1-h2)^2/H

  PW[1,i]=pchisq(chiT, 1, ncp=ncpA, lower.tail = F)
  PW[2,i]=pchisq(chiT, 1, ncp=ncpD, lower.tail = F)
}
colnames(PW)=n
barplot(PW, beside = T, border = F)
abline(h=0.85, lty=2, col="grey")
legend("topleft", legend=c("Add", "Dom"), pch=15, col=c("black", "grey"), bty='n')
