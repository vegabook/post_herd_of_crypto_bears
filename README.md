# post_herd_of_crypto_bears
Code to recreate the chart from this [LinkedIn Post](https://www.linkedin.com/feed/update/urn:li:activity:7017956554112917504?utm_source=share&utm_medium=member_desktop)

Install R, `source("main.r")` in the root directory of the repo. It'll tell you a bunch of times that it can't find some library. Simply `install.packages(x)` for each one of those x libraries until they're all installed, and the chart will magically pop up. 

Please note that is is code for a LINUX operating system. To run this on Windows, you want to change the entry where it says `X11`, to `Cairo` or `cairo` (can't remember but it's one of those two). For Mac, I think X11 will work fine but not sure.  
