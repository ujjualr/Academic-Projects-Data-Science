install.packages("ggplot2")
library(ggplot2)
install.packages("ggpubr")
library(ggpubr)
#What are most popular job Categories?
googleJobs.df<-read.csv("GoogleJobs.csv")
View(googleJobs.df)
x<-ggplot(googleJobs.df)+geom_bar(aes(x=googleJobs.df$Category))
x + ggpubr::rotate_x_text()





  