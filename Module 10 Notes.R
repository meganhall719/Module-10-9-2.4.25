library(tidyverse)
f<-"https://raw.githubusercontent.com/difiore/ada-datasets/refs/heads/main/KamilarAndCooperData.csv"
d <- read_csv(f, col_names = TRUE)
head(d)

#selecting Rows
s<- filter(d, Family == "hominidae" & Mass_Dimorphism > 2)
head(s)

#selecting specific columns
s<- select(d, Family, Genus, Body_mass_male_mean)
head(s)

#reordering a data frame by a set of variables
s<-arrange(d, Family, Genus, Body_mass_male_mean)
head(s)

#desc() can be used to reverse the order
s<- arrange(d, desc(Family), Genus, Species, desc(Body_mass_male_mean))
head(s)

#renaming columns
s<-rename(d, Female_Mass = Body_mass_female_mean)
head(s$Female_Mass)

#The mutate() function allows us to add new columns to a data frame
s<- mutate(d, Binomial = paste(Genus, Species, sep = ""))
head(s$Binomial)

#Summarize data using functions the n() function returns the number of rows in the data frame
s <- summarize(d, n_cases = n(),
               avgF = mean(Body_mass_female_mean, na.rm = TRUE),
               avgM = mean(Body_mass_male_mean, na.rm = TRUE))
     s         
# The group_by function allows us to construcct summary variables for sets of obsercations defined by a categorical environment
by_family <- group_by(d, Family)
s<-summarise(by_family, n_cases=n(), 
             avgF=mean(Body_mass_female_mean, na.rm = TRUE),
              avgM= mean(Body_mass_male_mean, na.rm = TRUE))
s

# 10 .4 other useful {dplyr} Functions
