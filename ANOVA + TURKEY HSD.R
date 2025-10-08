#---------------------------------------------------------------------------------------------------
# ------------------- Proximate Statistical Analysis ------------------------------------
#-----------------------------------------------------------------------------------------------------


# -----------------------------
# Step 0: Install & load required packages
# -----------------------------


install.packages(c("dplyr", "tibble", "agricolae", "tidyr"))
library(dplyr)
library(tibble)
library(agricolae)
library(tidyr)

# -----------------------------
# Step 1: Your dataset (3 replicates per substrate)
# -----------------------------
data <- data.frame(
  Substrate = rep(c("Cornsilk", "Corncob", "MangoBlossom"), each = 3),
  Ash = c(2.40, 2.45, 2.41, 4.20, 4.28, 4.30, 5.80, 5.85, 5.87),
  Moisture = c(5.2, 5.3, 5.15, 5.6, 5.5, 5.62, 5.9, 6.0, 6.0),
  Fibre = c(9.9, 10.0, 10.1, 11.7, 11.8, 11.9, 3.4, 3.5, 3.5),
  Fat = c(4.4, 4.5, 4.4, 4.7, 4.8, 4.6, 4.6, 4.7, 4.6),
  Protein = c(4.2, 4.3, 4.1, 3.8, 3.9, 3.7, 1.3, 1.4, 1.35),
  Carbohydrates = c(73.7, 73.8, 73.6, 69.8, 69.9, 70.0, 78.7, 78.8, 78.6)
)

# -----------------------------
# Step 2: List of parameters
# -----------------------------
params <- colnames(data)[2:ncol(data)]

# -----------------------------
# Step 3: Initialize final results
# -----------------------------
final_results <- data.frame()

# -----------------------------
# Step 4: Loop through each parameter to compute Mean ± SD + Tukey letters
# -----------------------------
for (p in params) {
  
  # Run ANOVA
model <- aov(as.formula(paste(p, "~ Substrate")), data = data)
model  

  # Tukey HSD letters
tukey <- HSD.test(model, "Substrate", group = TRUE, console = FALSE)
tukey$groups <- tibble::rownames_to_column(tukey$groups, var = "Substrate")
  
  # Compute Mean ± SD
summary_data <- data %>%
  group_by(Substrate) %>%
  summarise(
      Mean = mean(.data[[p]]),
      SD = sd(.data[[p]])
    ) %>%
    left_join(tukey$groups, by = "Substrate") %>%
    mutate(
      # Format Mean ± SD with superscript letters
      Mean_SD_Letter = paste0(round(Mean, 2), " ± ", round(SD, 2), groups)
    ) %>%
select(Parameter = p, Substrate, Mean_SD_Letter)
  
  # Append to final results
final_results <- rbind(final_results, summary_data)
}

# -----------------------------
# Step 5: Reshape to wide table (Parameters as rows, Substrates as columns)
# -----------------------------
polished_table <- final_results %>%
  pivot_wider(
    names_from = Substrate,
    values_from = Mean_SD_Letter
  ) %>%
  arrange(Parameter)

# -----------------------------
# Step 6: View polished table
# -----------------------------
print(polished_table)


# Save 
write.csv(polished_table, "Proximate_Analysis_Polished_Table.csv", row.names = FALSE)



