#---------------------------------------------------------------------------------------
# ------------------- CORRELATION HEATMAP FOR TEMPERATURE OPTIMIZATION------------------
#---------------------------------------------------------------------------------------



# Install corrplot 
install.packages("corrplot")
install.packages("RColorBrewer")
install.packages("reshape2")
install.packages("Hmisc")   # has rcorr function





# Load libraries
library(corrplot)
library(RColorBrewer)
library(reshape2)
library(Hmisc)
library(ggplot2)




# Your dataset
data <- data.frame(
  Substrate = c("CC","CC","CC","CS","CS","CS"),
  Temperature = c(25,30,35,25,30,35),
  Residual_Sugar = c(0.178,0.578,0.949,0.292,0.663,0.806),
  Specific_Gravity = c(0.732,0.821,0.893,0.638,0.783,0.871),
  Ethanol_Yield = c(21.3,12.5,7.2,17.8,11.3,5.1),
  Absorbance = c(0.289,0.265,0.252,0.261,0.287,0.205),
  Purity = c(77,70,66,69,76,52)
)

# Select only numeric columns
numeric_data <- data[, c("Temperature", "Residual_Sugar", 
                         "Specific_Gravity", "Ethanol_Yield", 
                         "Absorbance", "Purity")]

# Run correlation test
correlation_Temp <- rcorr(as.matrix(numeric_data), type = "pearson")

# Extract correlation and p-values
cor_matrix <- correlation_Temp$r
p_matrix <- correlation_Temp$P

# Replace NA p-values with 0 (for diagonal)
p_matrix[is.na(p_matrix)] <- 0



# Plot correlation heatmap (show all values, no blanks)
corrplot(cor_matrix,
         method = "color",
         col = colorRampPalette(c("red", "blue", "green"))(200),
         type = "upper",
         addCoef.col = "black",   # add correlation values
         number.cex = 0.7,        # size of numbers
         tl.col = "black",        # label color
         tl.srt = 45,             # rotate labels
         title = "Correlation Heatmap of Fermentation Variables (Temperature Study)",
         mar = c(0,0,2,0))

# plot number enlargement

corrplot(cor_matrix,
         method = "color",
         col = colorRampPalette(c("red", "blue", "green"))(200),
         type = "upper",
         addCoef.col = "black",
         number.cex = 1.2,        # enlarge numbers (default ~0.7)
         tl.cex = 1.2,            # enlarge variable labels
         tl.col = "black",
         tl.srt = 45,
         title = "Correlation Heatmap of Fermentation Variables (Temperature Study)",
         mar = c(0,0,3,0))        # extra margin for title





# Save enlarged heatmap as PNG (6x6 inches, 300 dpi)
png("temperature_heatmap.png", width = 6, height = 6, units = "in", res = 300)

corrplot(cor_matrix,
         method = "color",
         col = colorRampPalette(c("red", "blue", "green"))(200),
         type = "upper",
         addCoef.col = "black",
         number.cex = 1.2,
         tl.cex = 1.2,
         tl.col = "black",
         tl.srt = 45,
         title = "Correlation Heatmap of Fermentation Variables (Temperature Study)",
         mar = c(0,0,3,0))




###############################################################################
#               CORRELATION
###############################################################################
#                            TEMPERATURE


library(corrplot)
library(RColorBrewer)
library(reshape2)
library(Hmisc)


# dataset
data <- data.frame(
  Substrate = c("CC","CC","CC","CS","CS","CS"),
  Temperature = c(25,30,35,25,30,35),
  Residual_Sugar = c(0.178,0.578,0.949,0.292,0.663,0.806),
  Specific_Gravity = c(0.732,0.821,0.893,0.638,0.783,0.871),
  Ethanol_Yield = c(21.3,12.5,7.2,17.8,11.3,5.1),
  Absorbance = c(0.289,0.265,0.252,0.261,0.287,0.205),
  Purity = c(77,70,66,69,76,52)
)



# Select only numeric columns
numeric_data <- data[, c("Temperature", "Residual_Sugar", 
                         "Specific_Gravity", "Ethanol_Yield", 
                         "Absorbance", "Purity")]

# Rename variables for readability
colnames(numeric_data) <- c("Temperature (°C)", 
                            "Residual Sugar (g/L)", 
                            "Specific Gravity", 
                            "Ethanol Yield (%)", 
                            "Absorbance (nm)", 
                            "Purity (%)")


# Run correlation test
correlaion_Temp <- rcorr(as.matrix(numeric_data), type="pearson")

# Correlation matrix
correlaion_Temp$r

# P-value matrix
correlaion_Temp$P




# Extract correlation matrix
cor_matrix_1 <- correlaion_Temp$r

# Plot heatmap
corrplot(cor_matrix_1, method = "color",
         col = colorRampPalette(brewer.pal(8, "RdBu"))(200),
         type = "upper",          # show upper triangle
         addCoef.col = "black",   # add correlation values
         number.cex = 0.7,        # size of numbers
         tl.col = "black",        # label color
         tl.srt = 45)             # rotate labels


# Define red–white–green color palette
fancy_colors <- colorRampPalette(c("red", "yellow", "green"))(200)

# Plot correlation heatmap
corrplot(cor_matrix_1, 
         method = "color",
         type = "upper",
         addCoef.col = "black",
         number.cex = 0.7,
         tl.col = "black",
         tl.srt = 45,
         col = fancy_colors,
         is.corr = TRUE,
         diag = FALSE,
         title = "Correlation Heatmap of Fermentation Variables (Temperature Study)",
         mar = c(0,0,2,0))


#########################################################################

#                      PH



# Create dataframe
data2 <- data.frame(
  Substrate = c("CC","CC","CC","CS","CS","CS"),
  pH = c(4,6,9,4,6,9),
  Residual_Sugar = c(0.381,0.786,1.295,0.535,0.752,0.878),
  Specific_Gravity = c(0.834,0.815,0.885,0.875,0.864,0.817),
  Ethanol_Yield = c(17.4,9.1,5.3,12.1,7.8,5.5),
  Absorbance = c(0.263,0.224,0.201,0.223,0.248,0.241),
  Purity = c(69,58,51,57,66,63)
)

# Check the dataset
print(data2)




numeric_data2 <- data2[, c("pH","Residual_Sugar","Specific_Gravity",
                           "Ethanol_Yield","Absorbance","Purity")]

# Run correlation
correlation_pH <- rcorr(as.matrix(numeric_data2), type="pearson")

# Custom color palette: weak = red, medium = blue, strong = green
my_colors <- colorRampPalette(c("red", "blue", "green"))(200)

# Plot correlation heatmap
corrplot(correlation_pH$r,
         method = "color",
         type = "upper",
         addCoef.col = "black",   # show correlation values
         tl.col = "black",        # text color
         tl.srt = 45,             # text rotation
         number.cex = 0.8,        # coefficient size
         col = my_colors,
         title = "Correlation Heatmap of Fermentation Variables (pH Study)",
         mar = c(0,0,2,0))



# Custom color palette: negative = red, weak = white, positive = green
my_colors <- colorRampPalette(c("red", "white", "green"))(200)

# Plot correlation heatmap with clear color meaning
corrplot(correlation_pH$r,
         method = "color",
         type = "upper",
         addCoef.col = "black",   # show correlation values
         tl.col = "black",        # variable names color
         tl.srt = 45,             # text rotation
         number.cex = 0.8,        # coefficient size
         col = my_colors,
         is.corr = TRUE,          # interpret -1 to +1 correctly
         title = "Correlation Heatmap of Fermentation Variables (pH Study)",
         mar = c(0,0,2,0),
         cl.cex = 0.8,            # legend text size
         cl.align.text = "c")     # center legend text




# Rename variables for readability (only numeric ones)
colnames(numeric_data2) <- c("pH",
                             "Residual Sugar (g/L)", 
                             "Specific Gravity", 
                             "Ethanol Yield (g/L)", 
                             "Absorbance (nm)", 
                             "Purity (%)")

# Recompute correlation with new names
correlation_pH <- rcorr(as.matrix(numeric_data2), type="pearson")

# Plot heatmap with new labels
corrplot(correlation_pH$r,
         method = "color",
         type = "upper",
         addCoef.col = "black",
         number.cex = 0.9,
         tl.col = "black",
         tl.cex = 0.9,
         tl.srt = 45,
         col = fancy_colors,
         is.corr = TRUE,
         title = "Correlation Heatmap of Fermentation Variables (pH Study)
#-------------------------------------------------------------------