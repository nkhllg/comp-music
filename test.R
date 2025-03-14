---
  title: "My Portfolio for Computational Musicology 2025"
author: "Nora Kahleogullari"
date: "Block 4"
output: 
  flexdashboard::flex_dashboard:
  storyboard: true
---
  
```{r setup, include=FALSE}
library(tidyverse)
library(flexdashboard)
library(plotly)
library(tibble)
#library(shiny)
source("compmus.R")
knitr::opts_chunk$set(echo = TRUE)
```


## Welcome to my dashboard!

Later we'll dive further into the songs, for now here are 2 descriptions of the songs.

The first song has a dark, atmospheric 80s-inspired synthwave beat with smooth R&B elements, like The Weeknd , moody, energetic, downtempo, its made with Udio.ai

The second song is dembow, reggaeton, cumbia, afro-latin fusion, rap, latin trap. It's like summer song that will bring you the back to the summer, made with Suno.ai

### Insights to the whole corpus

#### Tempi

Column {data-width=650}
-----------------------------------------------------------------------------------------
  ```{r echo=FALSE}
df <- read_csv("compmus2025.csv")

ggplot(df, aes(x = tempo)) +
  geom_histogram(bins = 10, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Tempi for Class Corpus",
       x = "Tempo (BPM)",
       y = "Count") +
  theme_minimal()
```



#### My contributions 

```{r echo=FALSE, fig.height=6, fig.width=4}

"features/nora-k-1.json" |>
  compmus_tempogram(window_size = 8, hop_size = 1, cyclic = FALSE) |>
  ggplot(aes(x = time, y = bpm, fill = power)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)") +
  theme_classic()

"features/nora-k-2.json" |>
  compmus_tempogram(window_size = 8, hop_size = 1, cyclic = FALSE) |>
  ggplot(aes(x = time, y = bpm, fill = power)) +
  geom_raster() +
  scale_fill_viridis_c(guide = "none") +
  labs(x = "Time (s)", y = "Tempo (BPM)") +
  theme_classic()
```

-----------------------------------------------------------------------------------------
  
  Column {.sidebar}
------------------------------------------------------------------------------------------
  The songs in the whole corpus are not too fast or slow, as can be seen because there is a wide peak around 100BPM

The first song has 2 drops in tempo around 50 and 90 seconds, and in the outro the tempo also changes up a bit.

The second song's tempo is almost the same till 110s and after 145seconds in the outro 

For more info go to the exclusive insights 

-------------------------------------------------------------------------------------------

