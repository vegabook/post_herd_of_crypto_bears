library(ggplot2)
source("tools.r")
library(xts)

trends <- read.csv("multiTimeline.csv", stringsAsFactors = FALSE) 
btc <- read.csv("btc.csv", stringsAsFactors = FALSE)
eth <- read.csv("eth.csv", stringsAsFactors = FALSE)
# eth and bitcoin xts
e <- xts(eth$Close, as.Date(sapply(strsplit(eth$Date, " "), function(x) x[1])))
b <- xts(btc$Close, as.Date(sapply(strsplit(btc$Date, " "), function(x) x[1])))
# trend xts
t <- xts(trends[2:3], order.by = as.Date(paste(trends$Month, "-15", sep = "")))
t <- xts(apply(t, 2, as.numeric), order.by = index(t))
# same dates now as trend
ei <- e[index(t), ]
bi <- b[index(t), ]
ti <- t[index(bi), ]

lti <- logret(ti)
lei <- logret(ei)
lbi <- logret(bi)

x11(width = 10, height = 6)
par(mfrow = c(1, 2))
regress(lei, lti[, 2], legnd = F, hiDays = c(0, 100, 100), xlab = "ETH 1 month return", ylab = "Google trends 'crypto scam' same month return", main = "Price vs 'scam' search trend")
regress(lei[1:(nrow(lei) - 1), ], lti[2:nrow(lti), 2], hiDays = c(100, 100, 100), legnd = F, diagnostics = T, xlab = "ETH 1 month return", ylab = "Google trends 'crypto scam' following month return", main = "...following month hindsight")

dev.new()
regress(lti[1:(nrow(lti) - 1), 2], lei[2:nrow(lei), ], hiDays = c(0, 0, 100), legnd = F, diagnostics = T, ylab = "ETH next month return", xlab = "Google trends 'crypto scam' monthly return", main = "Buy when the bears are hurting")







