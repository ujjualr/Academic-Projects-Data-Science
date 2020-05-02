install.packages("stringr")
library(stringr)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)

View(googleJobs.df)
#Where do Google need Employees??
loc1 <- as.data.frame(table(googleJobs.df$Location))
colnames(loc1) <- c("Location", "Freq")
loc1 <- arrange(loc1, desc(Freq))
Toploc.df<-head(loc1)
str(Toploc.df)
options(repr.plot.width=5, repr.plot.height=3)
Pop <- ggplot(data = head(loc1, 10), aes(Location, Freq,fill=Location)) +geom_bar(stat = "identity") +geom_text(aes(label=Freq), color="black", size=3) +ggtitle("Top 10 Popular Job Locations") + coord_flip() 
Pop
