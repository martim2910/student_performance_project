#Open the dataset in R studio
library(readr)
dados <- read.csv("C:/Users/marti/Downloads/life_expectancy_project/student_performance_analysis/StudentsPerformance.csv")




#Checking if the dataset is clean and is ready to use
library(dplyr)
#Visualize the structure of the dataset
glimpse(dados)
#Check for missing values
colSums(is.na(dados))
#Check unique values of categorical columns
unique(dados$gender)
unique(dados$parental.level.of.education)
unique(dados$test.preparation.course)


#Does parental education level affect students' academic performance?
#Order the education ranking from lowest to highest
dados$parental.level.of.education <- factor(
  dados$parental.level.of.education,
  levels = c(
    "some high school",
    "high school",
    "some college",
    "associate's degree",
    "bachelor's degree",
    "master's degree"
  ),
  ordered = TRUE)
#Calculate the mean scores by parental education level
resumo <- dados %>%
  group_by(parental.level.of.education) %>%
  summarise(
    mean_math = mean(math.score),
    mean_reading = mean(reading.score),
    mean_writing = mean(writing.score)
  )

print(resumo)

#Perform ANOVA for math scores
anova_math <- aov(math.score ~ parental.level.of.education, data = dados)
summary(anova_math)

# Perform Tukey HSD for math scores
tukey_math <- TukeyHSD(anova_math)
tukey_math

#Make a box-plot for visualization
library(ggplot2)
ggplot(dados, aes(x = parental.level.of.education, y = math.score)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Math Score by Parental Education Level",
       x = "Parental Education Level",
       y = "Math Score")

#Perform ANOVA for reading scores
anova_reading <- aov(reading.score ~ parental.level.of.education, data = dados)
summary(anova_reading)

#Perform Tukey HSD for reading scores
tukey_reading <- TukeyHSD(anova_reading)
tukey_reading

#Box-plot for visualization
ggplot(dados, aes(x = parental.level.of.education, y = reading.score)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Reading Score by Parental Education Level",
       x = "Parental Education Level",
       y = "Reading Score")

#Perform ANOVA for writing scores
anova_writing <- aov(writing.score ~ parental.level.of.education, data = dados)
summary(anova_writing)

#Perform Tukey HSD for writing scores
tukey_writing <- TukeyHSD(anova_writing)
tukey_writing

#Box-plot for visualization
ggplot(dados, aes(x = parental.level.of.education, y = writing.score)) +
  geom_boxplot(fill = "green", color = "black") +
  theme_minimal() +
  labs(title = "Writing Score by Parental Education Level",
       x = "Parental Education Level",
       y = "Writing Score")
