#  Project 2 — Effect of Parental Education on Student Academic Performance

##  Overview
This project analyzes the relationship between **parental education level** and **students’ academic performance** across three subjects — **Math**, **Reading**, and **Writing** — using a public dataset of student exam scores.

The goal is to determine whether students whose parents have higher educational levels tend to perform better academically, and in which subjects this difference is most significant.

---

##  Objective
To evaluate whether **parental education level** has a statistically significant impact on student performance in **Math**, **Reading**, and **Writing**.

---

##  Dataset
**Source:** [StudentsPerformance.csv](https://www.kaggle.com/datasets/spscientist/students-performance-in-exams)  
Data from 1,000 students, containing 8 different variables.

**Variables used:**
- `test.preparation.course`
- `gender`
- `parental.level.of.education`
- `math.score`
- `reading.score`
- `writing.score`

---

##  Descriptive Statistics

| Parental Education Level   | Mean Math | Mean Reading | Mean Writing |
|-----------------------------|-----------|---------------|---------------|
| some high school            | 63.50     | 66.30         | 64.10         |
| high school                 | 66.20     | 69.10         | 67.80         |
| some college                | 69.90     | 72.60         | 70.90         |
| associate's degree          | 71.10     | 73.90         | 72.60         |
| bachelor's degree           | 75.80     | 77.60         | 76.60         |
| master's degree             | 78.20     | 80.20         | 79.10         |

> *At first glance, students whose parents have higher education levels seem to consistently achieve higher mean scores across all subjects. However, we’ll confirm this statistically.*

---

##  Methodology

1. **Data Preparation**
   - Checked for missing values and inconsistencies.  
   - Converted `parental.level.of.education` into an **ordered factor** (from “some high school” to “master’s degree”).  

2. **Statistical Analysis**
   - Conducted **ANOVA** tests to determine whether there are significant differences in mean scores between education levels.  
   - Defined hypotheses as follows:  
     - **H₀:** All group means are equal.  
     - **H₁:** At least one group mean differs.  
   - We reject **H₀** if *p-value < 0.05*.  
   - When significant differences were detected, we applied **Tukey’s HSD post-hoc test** to identify which specific education levels differ significantly.  

3. **Visualization**
   - Created boxplots to show the distribution of scores for each subject by parental education level.

---

##  ANOVA Results

| Subject | F-Statistic | p-value | Significant (p < 0.05)? |
|----------|-------------|----------|---------------------------|
| Math     | 17.24       | <0.001   |  Yes |
| Reading  | 11.47       | <0.001   |  Yes |
| Writing  | 13.62       | <0.001   |  Yes |

**Interpretation:**  
There are statistically significant differences in student scores across parental education levels for all subjects.

---

##  Tukey HSD Highlights

### **Math Scores**
Significant differences were found between:
- Bachelor’s or Master’s degree vs. all lower education levels  
- Some college / Associate’s degree vs. high school or less  

### **Reading Scores**
Significant differences were found between:
- Bachelor’s / Master’s degrees vs. high school or less  
- Associate’s degree vs. high school  

### **Writing Scores**
Significant differences were found between:
- Bachelor’s / Master’s degrees vs. all lower levels  
- Associate’s degree vs. high school or less  

> *Overall, higher parental education is associated with significantly higher student achievement across all subjects.*

---

## Visualizations and Output
All **graphs**, **ANOVA tables**, and **Tukey HSD results** generated during the analysis are available in the project’s **output**.  
These include:
- Boxplots showing score distributions by parental education level  
- ANOVA summary tables for each subject  
- Tukey HSD post-hoc comparison tables highlighting significant group differences  

---

## Interpretation
Across Math, Reading, and Writing, students whose parents have Bachelor’s or Master’s degrees perform significantly better than those with only high school education or less.  
The results confirm that parental education level has a meaningful effect on academic performance.

---

## Conclusion
This analysis demonstrates a clear positive relationship between parental education level and student performance.  
Students with more educated parents consistently achieve higher academic results, particularly in writing and reading.

---
##  Tools & Libraries
The analysis was performed using **R**, with the following packages:
- `readr`  
- `dplyr`  
- `ggplot2`  

---

## Author
**Martim Luzio**  
martim.05@outlook.com
