library(dplyr)

theoph = read.csv("theoph.csv")

head(theoph)
str(theoph)

theoph$Subject = factor(theoph$Subject)

# 1. Using `select()` make a new data frame containing only the subject ID, the Time and conc variables

theoph %>% 
  select(Subject, Time, conc)

# 2. Using a combination of `select()` and `distinct()` make a new data frame 
# containing a single row for each subject with the subject ID, their weight and the dose

theoph %>% 
  select(Subject, Wt, Dose) %>%
  distinct()

# 3. Using `filter()` make a new data frame containing only the first subject
theoph %>% 
  filter(Subject == 1)

# 4. Using `filter()` make a new data frame containing only the *four* subjects
theoph %>% 
  filter(Subject %in% c(1,2,3,4))

# 5. Using `group_by()`, calculate the average concentration per subject (across all times)
theoph %>% 
  group_by(Subject) %>%
  summarise(mean_conc = mean(conc),
            mean_wt = mean(Wt))

# 6. Using `filter()` make a new data frame containing only the first subject 
# *and* pipe this to ggplot to make a line plot with `Time` on the x-axis and `conc` on the y-axis
theoph %>% 
  filter(Subject == 1) %>%
  ggplot(aes(x = Time, y = conc)) + geom_line() + ggtitle("Subject 1")

# 7. Using `select()` to extract just the `Subject`, `Time`` and `conc` variables
# *and* pipe this to ggplot to make a line plot with `Time` on the x-axis, `conc` on the y-axis
# and the lines colored by subject
theoph %>% 
  select(Subject, Time, conc) %>%
  ggplot(aes(x = Time, y = conc, col = Subject)) + geom_line()

# 8. Using `select()` to extract just the `Subject`, `Time`` and `conc` variables
# *and* pipe this to ggplot to make a line plot with `Time` on the x-axis, `conc` on the y-axis
# and faceted by the subject ID
theoph %>% 
  select(Subject, Time, conc) %>%
  ggplot(aes(x = Time, y = conc)) + geom_line() + facet_wrap(~ Subject)
