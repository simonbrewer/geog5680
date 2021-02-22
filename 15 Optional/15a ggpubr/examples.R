## ggpubr examples

library(ggpubr)
library(dplyr)

gap = read.csv("gapminderData5.csv")

gap07 = gap %>% 
  filter(year == 2007 & continent != "Oceania")

ggscatter(gap07, x = "gdpPercap", y = "lifeExp")

ggscatter(gap07, x = "gdpPercap", y = "lifeExp") + xscale("log10", .format = TRUE)

ggscatter(gap07, x = "gdpPercap", y = "lifeExp", col = "continent") + 
  xscale("log10", .format = TRUE)

gghistogram(gap07, x = "lifeExp", main = "GapMinder Life Expectancy")

gghistogram(gap07, x = "lifeExp", fill = "continent", 
            main = "GapMinder Life Expectancy")

gghistogram(gap07, x = "lifeExp", fill = "continent", 
            main = "GapMinder Life Expectancy", palette = "npg")

gghistogram(gap07, x = "lifeExp", fill = "continent", 
            main = "GapMinder Life Expectancy", palette = "jco")

ggdensity(gap07, x = "lifeExp", fill = "continent", 
          main = "GapMinder Life Expectancy", palette = "jco")

ggdensity(gap07, x = "lifeExp", fill = "continent", 
          main = "GapMinder Life Expectancy", palette = "jco",
          facet.by = "continent")

ggdensity(gap07, x = "lifeExp", fill = "continent", 
          main = "GapMinder Life Expectancy", palette = "jco",
          facet.by = "continent",
          add = "median", rug = TRUE)

ggviolin(gap07, x = "continent", y = "lifeExp")

ggviolin(gap07, x = "continent", y = "lifeExp", 
         fill = "continent", palette = "jco",
         add = c("boxplot", "jitter"),
         ylab = "Life expectancy (yrs)")

ggviolin(gap07, x = "continent", y = "lifeExp", 
         fill = "continent", palette = "jco",
         add = c("boxplot", "jitter"),
         ylab = "Life expectancy (yrs)",
         rotate = TRUE)

ggbarplot(gap07,
          x = "country",
          y = "lifeExp",
          fill = "continent",
          palette = "jco",
          x.text.angle = 90,
          ylab = "Life expectancy (yrs)",
          xlab = "Country") +
  font("x.text", size = 4)

ggbarplot(gap07,
          x = "country",
          y = "lifeExp",
          fill = "continent",
          palette = "jco",
          sort.val = "desc",
          sort.by.groups = F,
          x.text.angle = 90,
          ylab = "Life expectancy (yrs)",
          xlab = "Country") +
  font("x.text", size = 4)

## Alternative to barplot
ggdotchart(gap07,
           x = "country",
           y = "lifeExp",
           color = "continent",
           palette = "jco",
           sorting = "descending",
           rotate = T,
           group = "continent",
           add = "segments",
           ylab = "Life expectancy (yrs)",
           xlab = "Country") +
  font("y.text", size = 4)

ggboxplot(gap07, x = "continent", y = "lifeExp")

ggboxplot(gap07, x = "continent", y = "lifeExp",
          fill = "continent", palette = "simpsons")


gap_sub = gap %>% 
  filter(continent %in% c("Asia", "Africa"),
         year %in% c(1957, 1982, 2007))

ggboxplot(gap_sub, x = "continent", y = "lifeExp", 
          ylab = "Years", col = "continent", add = "jitter")

ggboxplot(gap_sub, x = "continent", y = "lifeExp", 
          ylab = "Years", col = "continent", add = "jitter") + 
  stat_compare_means(label.y = 90)

ggboxplot(gap_sub, x = "continent", y = "lifeExp", 
          ylab = "Years", col = "continent", add = "jitter") + 
  stat_compare_means(method = "t.test", label.y = 90)

ggboxplot(gap_sub, x = "continent", y = "lifeExp", 
          ylab = "Years", col = "continent", add = "jitter", facet.by = "year") + 
  stat_compare_means(method = "t.test", label.y = 90)


ggboxplot(gap_sub, x = "year", y = "lifeExp",
          col = "year", add = "jitter")

ggboxplot(gap_sub, x = "year", y = "lifeExp") + 
  stat_compare_means(label.y = 80, method = "anova")

comps = list( c('1957', '1982'), 
              c('1957', '2007'), 
              c('1982', '2007'))

ggboxplot(gap_sub, x = "year", y = "lifeExp") + 
  stat_compare_means(method = "t.test", comparisons = comps, 
                     bracket.size = .6, size = 4)

ggboxplot(gap_sub, x = "year", y = "lifeExp") + 
  stat_compare_means(method = "t.test", comparisons = comps, 
                     bracket.size = .6, size = 4) + 
  stat_compare_means(label.y = 110, method = "anova")

ggboxplot(gap_sub, x = "year", y = "lifeExp", facet.by = "continent") + 
  stat_compare_means(method = "t.test", comparisons = comps, 
                     bracket.size = .6, size = 4) + 
  stat_compare_means(label.y = 110, method = "anova")

ggboxplot(gap_sub, x = "year", y = "lifeExp", facet.by = "continent") + 
  stat_compare_means(label = "p.signif", method = "t.test",
                     ref.group = "1957") + 
  stat_compare_means(label.y = 110, method = "anova")
