library(quantmod)
wilsh <- getSymbols("WILL5000IND", src = "FRED", auto.assign = FALSE)
wilsh <- na.omit(wilsh)
wilsh <- wilsh["1979-12-31/2017-12-31"]
names(wilsh) <- "TR"

head(wilsh, 3)

logret <- diff(log(wilsh$TR))[-1]
round(head(logret, 3),6)

ret <- exp(logret)-1
round(head(ret, 3),6)

plot(ret)
plot(logret)

logret_w <- apply.weekly(wilsh, sum)
round(head(logret_w ,3), 6)

ret_w <- exp(logret_w)-1
head(ret_w)
plot(logret_w)
