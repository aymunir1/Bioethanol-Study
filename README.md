

📊 P**roximate Statistical Analysis** [R Script](https://github.com/aymunir1/Bioethanol-Study/blob/main/ANOVA%20%2B%20TURKEY%20HSD.R)

This section performs a statistical analysis of proximate composition —
including Ash, Moisture, Fibre, Fat, Protein, and Carbohydrates —
across three substrates: Cornsilk, Corncob, and Mango Blossom,
to assess their nutritional potential for bioethanol production.

1️⃣ ANOVA Test — Determines if there are significant differences among substrates for each parameter.
2️⃣ Tukey HSD Test — Identifies which substrate pairs differ significantly.
3️⃣ Summary Statistics — Computes Mean ± SD values for each substrate.
4️⃣ Result Formatting — Merges mean, SD, and Tukey group letters into a polished summary table.



## 🧪 Correlation Heatmap for Temperature and pH Optimization [R Script](https://github.com/aymunir1/Bioethanol-Study/blob/main/Correlation%20and%20Heatmap%20(Temperature%20%26%20pH).R)

This section performs a **correlation analysis** among key fermentation variables —  
including *temperature, pH, residual sugar, specific gravity, ethanol yield, absorbance, and purity —  
to identify relationships that influence bioethanol production efficiency.

#### 🔍 Method Overview
The analysis uses **Pearson’s correlation coefficients** and visualizes them using heatmaps generated with the **`corrplot`** package in R.

#### 📊 Studies Conducted
1. **Temperature Study** — Examines how fermentation temperature affects ethanol yield and related process parameters.  
2. **pH Study** — Explores how pH variation influences fermentation performance and product purity.

#### 🎨 Visualization
The correlation heatmaps apply **custom color gradients**:
- 🟢 **Positive correlations** — Indicate strong synergistic relationships between variables.  
- 🔴 **Negative correlations** — Highlight inverse relationships that may reduce process efficiency.
