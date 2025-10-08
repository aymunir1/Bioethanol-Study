library(ggplot2)
library(dplyr)

# Create the dataset
data <- data.frame(
  pH = rep(c("ph4", "ph6", "ph9"), each = 12),   # 3 pH groups, 12 measurements each (3 reps x 4 times)
  Time = rep(rep(c("48hrs", "72hrs", "96hrs", "120hrs"), each = 3), times = 3),
  Value = c(
    # ph4 (3 reps x 4 times)
    1.77, 1.79, 1.81,
    1.67, 1.66, 1.68,
    1.57, 1.54, 1.57,
    1.42, 1.42, 1.42,
    
    # ph6
    1.69, 1.70, 1.68,
    1.56, 1.63, 1.64,
    1.50, 1.51, 1.51,
    1.42, 1.40, 1.40,
    
    # ph9
    0.99, 0.89, 0.81,
    0.50, 0.49, 0.49,
    0.57, 0.56, 0.57,
    0.49, 0.49, 0.49
  )
)

# Convert Time to factor with ordered levels
data$Time <- factor(data$Time, levels = c("48hrs", "72hrs", "96hrs", "120hrs"))

# Two-way ANOVA (pH and Time as factors)
anova_model <- aov(Value ~ pH * Time, data = data)
summary(anova_model)

# Post-hoc test (Tukey HSD)
TukeyHSD(anova_model)

# Plot mean ± SE
library(ggplot2)
ggplot(data, aes(x = Time, y = Value, color = pH, group = pH)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  theme_minimal() +
  labs(title = "Effect of pH and Time on Values", y = "Mean ± SE")


# Calculate summary stats (mean ± SE)
summary_stats <- data %>%
  group_by(pH, Time) %>%
  summarise(
    mean = mean(Value),
    se = sd(Value) / sqrt(n()),
    .groups = "drop"
  )

# Line plot with error bars
ggplot(summary_stats, aes(x = Time, y = mean, color = pH, group = pH)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se), width = 0.15) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Effect of pH per Time",
    x = "Incubation Time (hrs)",
    y = "Mean ± SE"
  ) +
  scale_color_manual(values = c("ph4" = "red", "ph6" = "blue", "ph9" = "green"))


# Line plot with error bars and centered title
ggplot(summary_stats, aes(x = Time, y = mean, color = pH, group = pH)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se), width = 0.15) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Effect of pH Per Time",
    x = "Incubation Time (hrs)",
    y = "Absorbance (OD)"
  ) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16)) +
  scale_color_manual(values = c("ph4" = "red", "ph6" = "blue", "ph9" = "green"))



# Boxplot visualization
ggplot(data, aes(x = Time, y = Value, fill = pH)) +
  geom_boxplot(alpha = 0.7) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Distribution of Values Across pH and Incubation Time",
    x = "Incubation Time (hrs)",
    y = "Observed Values"
  )

show()
