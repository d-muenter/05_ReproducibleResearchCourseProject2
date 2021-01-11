data <- read.csv("repdata_data_StormData.csv.bz2")

fatal_plot <- ggplot(healthdata, aes(EVTYPE, FATALITIES)) + 
    geom_col(aes(fill=EVTYPE)) + guides(fill=FALSE) + 
    theme(axis.text.x=element_text(angle=45, hjust=1)) + 
    labs(x=NULL, y="Fatalities")
injur_plot <- ggplot(healthdata, aes(EVTYPE, INJURIES)) + 
    geom_col(aes(fill=EVTYPE)) + guides(fill=FALSE) + 
    theme(axis.text.x=element_text(angle=45, hjust=1)) + 
    labs(x="Event Type", y="Injuries")
library("gridExtra")
grid.arrange(fatal_plot, injur_plot, nrow=2)


plotdata <- healthdata[,c(4:6)]
plotdata$id <- seq(nrow(plotdata))
library(reshape2)
finalplotdata <- melt(plotdata, id=c("id", "EVTYPE"), measure.vars=c("FATALITIES", "INJURIES"))
ggplot(finalplotdata, aes(EVTYPE, value)) + geom_col(aes(fill=variable), position="dodge") + 
    theme(axis.text.x=element_text(angle=45, hjust=1)) + labs(x="Event Type", y="Fatalities") 
    
##    scale_y_continuous(sec.axis=sec_axis(trans=~.*10))

