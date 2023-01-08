import yfinance as yf
btc = yf.Ticker("BTC-USD")
eth = yf.Ticker("ETH-USD")

hist = [x.history(period = "max") for x in [btc, eth]]



