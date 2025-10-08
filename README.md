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
