#HW3-1#
install.packages("digest",repos='http://cran.us.r-project.org')
library("digest")
digest("I learn a lot from this class when I am proper listening to the professor","sha256")
digest("I do not learn a lot from this class when i am absent and playing on my Iphone","sha256")


#HW3-4#
install.packages("rjson",repos = "http://cran.us.r-project.org")
library("rjson")
json_file="http://crix.hu-berlin.de/data/crix.json"
json_data=fromJSON(file=json_file)
crix_data_frame=as.data.frame(json_data)

crix_data_frame_t<-t(crix_data_frame)
time<-crix_data_frame_t[seq(1,2350,by=2)]
price<-crix_data_frame_t[seq(2,2350,by=2)]
crix_data_frame<-cbind(time,price)
time_series<-ts(data=price,start =c(2014,7,31),frequency = 365)
plot(time_series)

install.packages("tseries")
library(tseries)
adf.test(time_series)
#Because p-value is greater than printed p-value, we can't reject the hypothesis#


