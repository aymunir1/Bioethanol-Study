
# Load library
library(agricolae)
library(ggplot2)

# Create dataset
ethanol_data <- data.frame(
  Ethanol = factor(rep(c("5%", "10%", "15%", "20%"), each = 12)),
  Time = factor(rep(rep(c("48h", "72h", "96h", "120h"), each = 3), times = 4),
                levels = c("48h", "72h", "96h", "120h")),
  Absorbance = c(
    # 5%
    1.69,1.69,1.69, 1.77,1.76,1.76, 1.47,1.47,1.47, 1.41,1.39,1.40,
    # 10%
    1.49,1.48,1.40, 1.58,1.59,1.59, 1.42,1.43,1.41, 1.37,1.36,1.37,
    # 15%
    1.20,1.20,1.19, 1.34,1.32,1.53, 1.30,1.31,1.29, 1.29,1.23,1.26,
    # 20%
    0.94,0.95,0.96, 1.42,1.42,1.41, 1.35,1.36,1.36, 1.25,1.20,1.19
  )
)

# Two-way ANOVA
anova_ethanol <- aov(Absorbance ~ Ethanol * Time, data = ethanol_data)
summary(anova_ethanol)

# Tukey HSD for interaction (Ethanol × Time)
ethanol_data$Ethanol_Time <- interaction(ethanol_data$Ethanol, ethanol_data$Time)
anova_interaction <- aov(Absorbance ~ Ethanol_Time, data = ethanol_data)
tukey_ethanol <- HSD.test(anova_interaction, "Ethanol_Time", group = TRUE)
print(tukey_ethanol)



# Summarize (mean ± sd)
ethanol_summary <- ethanol_data %>%
  group_by(Ethanol, Time) %>%
  summarise(
    mean_abs = mean(Absorbance),
    sd_abs = sd(Absorbance),
    .groups = "drop"
  )

# Plot
p <- ggplot(ethanol_summary, aes(x = Time, y = mean_abs, 
                                 color = Ethanol, group = Ethanol)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = mean_abs - sd_abs, ymax = mean_abs + sd_abs), 
                width = 0.2, size = 0.8) +
  labs(
    title = "Effect Ethanol Concentrations Per Time",
    x = "Time (hours)",
    y = "Absorbance (OD)"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 18),
    legend.title = element_text(size = 14),
    legend.text = element_text(size = 12)
  )

# Show plot
print(p)

# Save in HD quality
ggsave("ethanol_stress_tolerance.png", plot = p, width = 10, height = 6, dpi = 300)