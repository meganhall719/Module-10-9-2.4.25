library(tidyverse)
f<-"https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/KamilarAndCooperData.csv"
d <- read_csv(f, col_names = TRUE)
head(d)

#selecting Rows