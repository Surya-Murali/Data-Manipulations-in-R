x=c(1,0,2,0)

sum(x==0)

length(which(x==0))

hist(x)
rep(1:2,times=10, each=2)

m=matrix(1:12,nrow=3,ncol=4,byrow=T)
m
m[1,]

type<-c(rep("drug",2),"placebo",rep("drug",2),rep("placobo",3))
score<-c(8,10,5,9,9,7,6,6)

clinic<-data.frame(type,score)
clinic

mean(clinic$score[clinic$type=='drug'])

mean(clinic$score[which(clinic$type=='drug')])

Lst <- list(name="Fred", wife="Mary",  
            no.children=3, child.ages=c(4,7,9))
Lst
Lst[[4]]

model = lm(data=clinic, type~score)
install.packages("asbio")
library(asbio)
see.regression.tck()
