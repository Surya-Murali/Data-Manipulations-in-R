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

which(letters == "a")
which(letters == "z")

x <- c(1,5,8,4,6)
x
which(x == 5)
which(x != 5)

datasets::npk
which(npk$yield == 62)
which((npk$yield == 48.8) & (npk$N == 1))

which(npk$yield == max(npk$yield))

x <- matrix(1:16,4,4)
which.min(x)
which.max(x)
which(x %% 2 == 0)
