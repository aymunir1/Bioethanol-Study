

#####################################################################################################################
# ------------------- EFFECT OF TEMPERATURE ON YEAST GROWTH (stastical analysis and visualization) --------------------------
#####################################################################################################################




# -----------------------------
# 1. Load libraries
# -----------------------------

library(tidyverse)   # For data manipulation and plotting
library(agricolae)   # For Tukey HSD


# -----------------------------
# 2. Enter data
# -----------------------------
data <- data.frame(
  Temperature = rep(c("25C","30C","35C","40C"), each = 3*4),
  Time = rep(c("48h","72h","96h","120h"), times = 4*3),
  Absorbance = c(
    # 25C
    0.98,1.59,1.46,1.45, 0.99,1.54,1.48,1.45, 1.01,1.55,1.48,1.44,
    # 30C
    1.06,1.26,1.06,1.13, 1.04,1.23,1.05,1.17, 1.00,1.21,1.06,1.16,
    # 35C
    1.60,1.84,1.66,1.60, 1.65,1.85,1.68,1.62, 1.64,1.87,1.67,1.61,
    # 40C
    0.85,0.95,0.66,0.22, 0.83,0.95,0.66,0.23, 0.86,0.95,0.67,0.24
  )
)

# -----------------------------
# 3. Convert variables to factors
# -----------------------------
data$Temperature <- factor(data$Temperature)
data$Time <- factor(data$Time, levels = c("48h","72h","96h","120h"), ordered = TRUE)

# -----------------------------
# 4. Descriptive statistics
# -----------------------------
summary_stats <- data %>%
  group_by(Temperature, Time) %>%
  summarise(
    Mean = mean(Absorbance),
    SD = sd(Absorbance)
  )
print(summary_stats)

# -----------------------------
# 5. Two-way ANOVA
# -----------------------------
anova_result <- aov(Absorbance ~ Temperature * Time, data = data)
summary(anova_result)

# -----------------------------
# 6. Check ANOVA assumptions
# -----------------------------
# Normality of residuals
shapiro.test(residuals(anova_result))


# -----------------------------
# 7. Tukey HSD post-hoc (optional)
# -----------------------------
tukey_result <- HSD.test(anova_result, "Temperature:Time", group = TRUE)
print(tukey_result)

# -----------------------------
# 8. Plot growth curves
# -----------------------------
p <- ggplot(data, aes(x=Time, y=Absorbance, color=Temperature, group=Temperature)) +
  stat_summary(fun=mean, geom="line", size=1.2) +
  stat_summary(fun.data=mean_se, geom="errorbar", width=0.2) +
  stat_summary(fun=mean, geom="point", size=3) +
  theme_minimal() +
  labs(title="Yeast Stress Tolerance at Different Temperatures",
       x="Time (hours)",
       y="Absorbance (OD)") +
  scale_color_brewer(palette="Set1") +
  theme(plot.title = element_text(hjust = 0.5, size = 16, face="bold"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.title = element_text(size = 13),
        legend.text = element_text(size = 12))

# Display the plot
print(p)

