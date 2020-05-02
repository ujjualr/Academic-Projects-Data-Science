#https://usersnap.com/blog/programming-languages-2018/
library(ggplot2)
library(stringr)
install.packages("stringi")
library(stringi)
Demand.df<-read.csv("GoogleJobs.csv")
language<-c("python","c++","c#","javascript","java ","java.","java,","java/"," sql","ruby","php","perl","swift")
frequency<-c()
Demand.df$Preferred.Qualifications<-tolower(Demand.df$Preferred.Qualifications)
for(i in language){
  Demand.df$Dummy<-stri_count_fixed(Demand.df$Preferred.Qualifications,i)
  frequency<-c(frequency,sum(Demand.df$Dummy))
}
DemandT<-data.frame(cbind(language,frequency))
colnames(DemandT)<-c("Language","Freq")
DemandT$Freq<-as.character(DemandT$Freq)
DemandT$Freq<-as.numeric(DemandT$Freq)
sumT<-sum(DemandT$Freq[5:8])
View(DemandT)

T1<-as.data.frame(DemandT$Language[1:4])
colnames(T1)<-c("Language")
T2<-as.data.frame(DemandT$Language[9:13])
colnames(T2)<-c("Language")
T3<-as.data.frame("java")
colnames(T3)<-c("Language")
newL<-rbind(T1,T2,T3)


F1<-as.data.frame(DemandT$Freq[1:4])
colnames(F1)<-c("Freq")
F2<-as.data.frame(DemandT$Freq[9:13])
colnames(F2)<-c("Freq")
F3<-as.data.frame(sumT)
colnames(F3)<-c("Freq")
newf<-rbind(F1,F2,F3)

newT<-cbind(newL,newf)
View(newT)

langp<-ggplot(data = newT, aes(Language, Freq, fill = Language)) +geom_bar(stat = "identity") +geom_text(aes(label=Freq), color="black", size=3) +ggtitle("Popular languages Preferred by Languages ") + guides(fill=FALSE) +coord_flip() 
langp
