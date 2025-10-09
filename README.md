 **Project Overview**

This repository contains R scripts and analyses exploring the **bioethanol production potential** of different agro-waste substrates and *Saccharomyces cerevisiae* performance under stress conditions, which includes
1. Proximate composition analysis
2. Stress tolerance assessment
3. Correlation studies


1. **Proximate Statistical Analysis** [R Script](https://github.com/aymunir1/Bioethanol-Study/blob/main/ANOVA%20%2B%20TURKEY%20HSD.R)
This section conduct **statistical analysis** of proximate composition (_Ash, Moisture, Fibre, Fat, Protein, and Carbohydrates_)  
across Cornsilk, Corncob, and Mango Blossom substrates.
Evaluates substrates potential for bioethanol production.

I. ANOVA Test — Determines if significant differences exist among substrates for each parameter.  
II. Tukey HSD Test — Identifies which substrate pairs differ significantly.  
III. Summary Statistics — Computes Mean ± SD values per substrate.  
IV. Result Formatting — Combines mean, SD, and Tukey group letters into a polished summary table.  

2. **Stress Tolerance of _Saccharomyces cerevisiae_**

This section evaluates the **stress tolerance** of *Saccharomyces cerevisiae* under various environmental and fermentation stress conditions.  
It aims to understand how key stress factors influence yeast growth, fermentation efficiency, and ethanol yield critical parameters in bioethanol production.

I. Temperature Tolerance — [R Script]() - Assesses yeast performance across different fermentation temperatures to determine optimal thermal conditions for ethanol yield.
II. pH Tolerance — [R Script]() - Examines yeast growth and metabolic activity under varying pH levels to identify the optimal pH for efficient fermentation.
III. Ethanol Tolerance — [R Script]() - Investigates how increasing ethanol concentrations affect yeast survival and productivity, providing insight into stress adaptation mechanisms.

3. **Correlation Analysis** [R Script](https://github.com/aymunir1/Bioethanol-Study/blob/main/Correlation%20and%20Heatmap%20(Temperature%20%26%20pH).R)
This section performs correlation analysis among key fermentation variables (*temperature, pH, residual sugar, specific gravity, ethanol yield, absorbance, and purity) to identify relationships that influence bioethanol production efficiency.

I. **Temperature Study** — Examines how fermentation temperature affects ethanol yield and related process parameters.  
II. **pH Study** — Explores how pH variation influences fermentation performance and product purity.

