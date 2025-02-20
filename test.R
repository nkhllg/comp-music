
library(plotly)
library(ggplot2)
library(tidyverse)

aisc2024 <- read_csv('aisc2024.csv')

ggplot(aisc2024, aes(x=danceability, y=valence)) +
  geom_point(alpha=0.7, color="blue") +  
  geom_smooth(method="lm", color="red", se=FALSE) +  
  theme_minimal() +
  labs(title="Danceability vs. Valence",
       x="Danceability",
       y="Valence")

ggplot(aisc2024, aes(x = tempo, y = loudness, color = valence)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_minimal() +
  scale_color_manual(values = c("Low" = "blue", "Medium" = "orange", "High" = "red")) +
  labs(title = "Loudness vs. Tempo (Colored by Valence)",
       x = "Tempo (BPM)",
       y = "Loudness (dB)")


aisc2024$valence <- cut(aisc2024$valence, 
                          breaks = c(0, 0.33, 0.66, 1), 
                          labels = c("Low", "Medium", "High"))

# Box plot: Danceability across Valence levels, colored by Instrumentalness
ggplot(aisc2024, aes(x = valence, y = danceability, fill = valence)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  geom_jitter(aes(color = instrumentalness), width = 0.2, alpha = 0.6) +  # Show instrumentalness in jitter points
  scale_fill_manual(values = c("Low" = "blue", "Medium" = "orange", "High" = "red")) +
  scale_color_gradient(low = "black", high = "white") +  # Instrumentalness scale
  theme_minimal() +
  labs(title = "Danceability Across Valence Levels (Instrumentalness in Points)",
       x = "Valence Category",
       y = "Danceability",
       color = "Instrumentalness") +
  theme(legend.position = "right")
