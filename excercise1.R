library(quantmod)
gold <- getSymbols("GOLDPMGBD228NLBM", src = "FRED", auto.assign = FALSE)
gold <- na.omit(gold)
gold <- gold["1979-12-31/2017-12-31"]
names(gold) <- "TR"

head(gold, 3)
tail(gold, 3)

logret <- diff(log(gold$TR))[-1]
round(head(logret, 3),6)

ret <- exp(logret)-1
round(tail(ret, 3),6)
plot(ret)
plot(logret)
