library(ggplot2)
install.packages("plotly")
library(plotly)
library(dplyr)
install.packages("shiny")
library(shiny)
install.packages("scales")
library(scales)
install.packages("data.table")
library(data.table)
library(ggrepel)

setwd("~/PhD stuff/Courses and learning/6003 Intermediate R/Tasks/IntermediateR/Day 7")

# Plot 1
data_plot1 <- read.csv("data_plot1.csv")
View(data_plot1)
ggplot(data_plot1, aes(x=myaxis, y=value, fill=myaxis)) + geom_violin(width=1.4, show.legend=F) + geom_boxplot(width=0.1, show.legend=F) + theme_bw() + labs(y="Value", x="", title="Boxplot + Violin")

# Plot 2
data_plot2 <- read.csv("data_plot2.csv")
data_plot2_dt <- as.data.table(data_plot2)
View(data_plot2)
ggplot(data_plot2_dt[poptotal<500000&area<0.1], aes(x=area, y=poptotal)) + geom_point(aes(size=popdensity, color=state)) + scale_size(range = c(1.8, 5)) + geom_smooth(se=FALSE) + theme_bw() + labs(y="Population", x="Area", subtitle="Area vs Population", title="Scatterplot") + coord_cartesian(ylim = c(0, 500000), xlim=c(0,0.1)) + scale_y_continuous(labels=label_number())
#This basically works. If I subset the dataset, the dots and the line is correct but the popdensity does not show the right numbers. If I don't subset, popdensity numbers are correct. 
ggplot(data_plot2_dt, aes(x=area, y=poptotal)) + geom_point(aes(size=popdensity, color=state)) + scale_size(range = c(1.8, 7)) + geom_smooth(se=FALSE) + theme_bw() + labs(y="Population", x="Area", subtitle="Area vs Population", title="Scatterplot") + scale_y_continuous(limits=c(0, 500000),labels=label_number())
#This was how Alen did it.

# Plot 3
data_plot3 <- read.csv("data_plot3.csv")
data_plot3_dt <- as.data.table(data_plot3)
View(data_plot3_dt)
ggplot(data_plot3_dt, aes(x=cty, y=hwy)) + geom_count(color="darkred", show.legend=F) + theme_bw() + labs(subtitle="mpg: city vs highway mileage", title="Counts plot")
#I used a slightly different red color, but it works. 

# Plot 4 - This one is annoying because I need to calculate z somehow. 
data_plot4 <- read.csv("data_plot4.csv")
data_plot4_dt <- as.data.table(data_plot4)
View(data_plot4_dt)
ggplot(data_plot4_dt, aes(x=car_name, y=mpg, fill=mpg)) + geom_bar(stat="identity") + coord_flip() + theme_bw() + labs(y="MPG (Z score)", x=" Car Name")

# Plot 5
data_plot5 <- read.csv("data_plot5.csv")
data_plot5_dt <- as.data.table(data_plot5)
View(data_plot5_dt)
ggplot(data_plot5_dt, aes(x = reorder(manufacturer, mileage), y = mileage)) +
  geom_segment(aes(x = manufacturer, xend = manufacturer, y = 0, yend = mileage)) +
  geom_point(size=4, color="orange") + theme_minimal() + theme(panel.grid.major.x = element_blank()) + labs(y="Avg. Mileage", x="", subtitle="Average city mileage bu manufacturer", title="Lollipop Chart")

# Plot 6
data_plot6 <- read.csv("data_plot6.csv")
data_plot6_dt <- as.data.table(data_plot6)
data_plot6_dt[,DE:=0]
data_plot6_dt[pvalue<0.01&log2FoldChange<(-0.5),DE:=-1]
data_plot6_dt[pvalue<0.01&log2FoldChange>0.5,DE:=1]
View(data_plot6_dt)
ggplot(data_plot6_dt, aes(x = log2FoldChange, y = -log10(pvalue), color=factor(DE, levels=c(1,0,-1)))) +
  geom_point(show.legend=F, size=2) + scale_color_manual(values=structure(c("#0077BB", "black", "#CC3311"), names=c("-1", "0", "1"))) +
  geom_label_repel(data = data_plot6_dt[DE!=0], aes(label=gene_symbol), label.size = NA, fill=NA,  color="black", max.overlaps = 15) +
  theme_classic() + theme(plot.title = element_text(hjust = 0.5), panel.background = element_rect(fill="lightgray"), legend.position="none") + labs(y="-log10(P-value)", x="log2FC", title="Volcano plot")
                                                                                                                                                            