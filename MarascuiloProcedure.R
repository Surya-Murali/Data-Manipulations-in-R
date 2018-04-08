## Set the proportions of interest.
p = c(3/21, 30/180, 50/250, 15/100)
denom = c(21, 180, 250, 100)
p
N = length(p)
N
value = critical.range = c()
value
## Compute critical values.
for (i in 1:(N-1))
{ for (j in (i+1):N)
{
  value = c(value,(abs(p[i]-p[j])))
  critical.range = c(critical.range,
                     sqrt(qchisq(.95,3))*sqrt(p[i]*(1-p[i])/denom[j] + p[j]*(1-p[j])/denom[j]))
}
}

round(cbind(value,critical.range),3)
