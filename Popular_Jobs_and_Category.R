install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)



#Popular Job Category
View(googleJobs.df)
Pop_cat.df<-arrange(as.data.frame(table(googleJobs.df$Category)),desc(Freq))
colnames(Pop_cat.df) <- c("Category", "Freq")
Pop_cat.df
Pop_cat<- ggplot(data =Pop_cat.df, aes(Category, Freq, fill = Category)) +geom_bar(stat = "identity") +geom_text(aes(label=Freq), color="black", size=3) +ggtitle("Popular Job Categories") + guides(fill=FALSE) +coord_flip()
Pop_cat
#Google's Looking for?
Position.df<-separate(googleJobs.df,col=Title,into=c("Position","Sub"),sep=",")
View(Position.df)
options(repr.plot.width=7, repr.plot.height=4)
title <- arrange(as.data.frame(table(Position.df$Position)), desc(Freq))
colnames(title) <- c("Title", "Freq")
Roles<- ggplot(data = head(title, 10), aes(Title, Freq, fill = Title)) +geom_bar(stat = "identity") +geom_text(aes(label=Freq), color="black", size=3) +ggtitle("Popular Roles") + guides(fill=FALSE) +coord_flip()
Roles


