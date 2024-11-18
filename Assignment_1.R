# 3. Installing and Initializing Packages

BiocManager::install(c("tidyverse", "renv", "ggplot2", "ggpubr"))
BiocManager::install("ggbeswarm")

library(tidyverse)
library(renv)
library(ggplot2)
library(ggpubr)
library(ggbeswarm)


renv::snapshot()

# 4. Loading and Exploring Data
data(iris)
head(iris)
summary(iris)
str(iris)
View(iris)

# 5. Data Manipulation
iris <- as_tibble(iris)
iris

# 6. Data Visualization with ggplot2
ggplot(iris)+geom_boxplot(aes(x=factor(Species), y=Sepal.Length, fill=Species)) + 
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9")) + theme_classic() +
  labs(x="", y="Sepal Length [mm]")
ggsave("Box_Sepal_Length.svg", w=6, h=7)