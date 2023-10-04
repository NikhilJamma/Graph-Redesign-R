##LIBRARIES
library(micromapST)
library(tidyverse)
install.packages("ggiraph")
library(ggiraph)
install.packages("patchwork")
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
library(patchwork)

#IMPORTING BAD GRAPH
badgraph <- read.csv("dataset.csv")

head(badgraph)

## REFINING DATASET
badgraph<-badgraph %>% 
  arrange(badgraph$State)

badgraph <- badgraph %>% mutate( stateabb =as.factor(c("AL", "AK", "AR", "AZ", "CA", "CO", "CT","DE","DC", "FL", "GA",
                                                       "HI","ID", "IL", "IN", "IA","KS", "KY", "LA", "ME", "MD", "MA",
                                                       "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM",
                                                       "NY","NC", "ND", "OH", "OK","OR", "PA", "RI", "SC", "SD", "TN",
                                                       "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")))

badgraph$X2019 <- badgraph$X2019/1000 #Simplifying the values for representation
badgraph$X2020 <- badgraph$X2020/1000

head(badgraph)

## END OF REFINING

## SCATTER PLOT BEGIN
point1<-ggplot(badgraph)+
  geom_point(aes(x=X2019, y=stateabb),pch=21,size=2, fill="blue")+
  theme_minimal()+
  theme(axis.text = element_text(size=6))+
  labs(x= "2019 Balance in thousands",
       y= "US States")

point2<-ggplot(badgraph)+
  geom_point(aes(x=X2020, y=stateabb),pch=21,size=2, fill="red")+
  theme_minimal()+
  theme(axis.text = element_text(size=6),axis.text.y  = element_blank(),axis.title.y = element_blank())+
  labs(x= "2020 Balance in thousands")


grid.arrange(point1,point2,ncol=2, top="Decrease in US States Credit Card Balance from year 2019 to 2020")

## SCATTER PLOT END


#MICROMAP BEGIN
type = c('mapcum','id','dot','arrow')
lab1=c(" "," ","Rate of","Change in Debt amount from")
lab2=c(" "," ",'Change in Debt','2019-2020')
lab3=c(" ", " ", "Percentage", "in Thousands")

col1=c(NA,NA,'Change','X2019')
col2=c(NA,NA,NA,'X2020')

panelDesc<-data.frame(type,lab1,lab2,lab3,col1,col2)

fNamey="Oupu1txx.pdf"
pdf(file = fNamey, width = 9.5, height = 15)

micromapST(badgraph, panelDesc,
           rowNamesCol = 'State',
           rowNames = "full", plotNames = "full", 
           sortVar = "Change", ascend=TRUE,
           title = "Statewise Credit Card Debt of USA from year 2019 to 2020",
           ignoreNoMatches = TRUE)
dev.off()

##MICROMAP END

## INTERACTIVE BAR PLOT BEGIN
badgraph$X2019 <- badgraph$X2019*1000 
badgraph$X2020 <- badgraph$X2020*1000
badgraph <- badgraph %>%
  mutate(tooltip_text = paste0( "State: ", State, "\n",
                                "Change: ",(Change),"%",
                                "\n","2019 Debt: ", X2019,"$",
                                "\n","2020 Debt: ", X2020,"$"))##TOOLTIP FOR INTERACTION



bplot1<-ggplot(badgraph, 
           mapping= aes(x=X2019, y=reorder(stateabb, -Change),
                        tooltip=tooltip_text, data_id=State))+
    geom_col_interactive(fill="pink")+
    theme_minimal()+
    theme(axis.text = element_text(size=6), legend.position = "none")+
    labs(x="Balance in 2019", y= "States",title =
           label_interactive(
             "Change in Credit Card Balance from 2019 to 2020 in US States",
             data_id = "title",
             onclick = "alert(\"Change in Credit Card Balance from 2019 to 2020 in US States\")",
             tooltip = "Change in Credit Card Balance from 2019 to 2020 in US States" ))+
  theme(plot.title = element_text_interactive())
      
bplot2<-ggplot(badgraph,
               mapping= aes(x=X2020, y=reorder(stateabb, -Change),
                            tooltip=tooltip_text, data_id=State))+
    geom_col_interactive(fill="grey")+
    theme_minimal()+
    theme(axis.text.y  = element_blank(), axis.title.y = element_blank())+
  labs(x="Balance in 2020", y= "States")

girafe(print(bplot1+bplot2), width_svg = 8, height_svg = 5) %>% 
  girafe_options(opts_hover("fill:orange;"))
## INTERACTIVE BAR PLOT END