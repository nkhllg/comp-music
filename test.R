library(tidyverse)
library(flexdashboard)
library(plotly)
library(shiny)
source("compmus.R")

### Deep dive into the music {.tabset}  


selectInput("track", "Choose a Track:", 
            choices = c("Track 1" = "features/nora-k-1.json", 
                        "Track 2" = "features/nora-k-2.json"),
            selected = 'features/nora-k-1.json')

##### Chroma - Track 1

renderPlot({
  input$track |>                           # Change the track
    compmus_chroma(norm = "identity") |>                 # Change the norm
    ggplot(aes(x = time, y = pc, fill = value)) + 
    geom_raster() +
    scale_y_continuous(
      breaks = 0:11,
      minor_breaks = NULL,
      labels = c(
        "C", "C#|Db", "D", "D#|Eb",
        "E", "F", "F#|Gb", "G",
        "G#|Ab", "A", "A#|Bb", "B"
      )
    ) +
    scale_fill_viridis_c(guide = "none") +               # Change the colours?
    labs(x = "Time (s)", y = NULL, fill = NULL) +
    theme_classic()                                      # Change the theme? 
}, height = 400, width = 600)


renderText({
  if (input$track == 'features/nora-k-1.json'){
    "The R&B song uses overall only 2 pitchclasses, while in the middle part it almost uses every chord."
  } else {
    "This song shows a sustained activity across all pitch classes. It shows that this song is more intricate and has a complexer harmonic progression"
  }
})


##### self-similarity track 1  {.tabset}
renderPlot({
  input$track |>                           # Change the track
    compmus_chroma(norm = "identity") |>                 # Change the norm
    compmus_self_similarity(
      feature = pc,
      distance = "euclidean"                             # Change the distance
    ) |>   
    ggplot(aes(x = xtime, y = ytime, fill = d)) + 
    geom_raster() +
    scale_fill_viridis_c(guide = "none") +               # Change the colours?
    labs(x = "Time (s)", y = NULL, fill = NULL) +
    theme_classic()
}, height = 400, width = 600)


renderText({
  if (input$track == 'features/nora-k-1.json'){
    "It can be seen that the R&B track has a lot more similar parts in the song, as there are a lot of little black squares. This is because the clap and the synths are coming back with a repeated interval."
  } else {
    "The latin track seems different but also the same, because it seems that the green lines are almost woven, this is because the beat is very similar but it has a sort of distortion above it."
  }
})


##### tibre based similarity track 1

renderPlot({
  input$track |>                           # Change the track
    compmus_mfccs(norm = "identity") |>                  # Change the norm
    compmus_self_similarity(
      feature = mfcc,
      distance = "euclidean"                             # Change the distance
    ) |>   
    ggplot(aes(x = xtime, y = ytime, fill = d)) + 
    geom_raster() +
    scale_fill_viridis_c(guide = "none") +               # Change the colours?
    labs(x = "Time (s)", y = NULL, fill = NULL) +
    theme_classic()   
}, height = 400, width = 600)


renderText({
  if (input$track == 'features/nora-k-1.json'){
    "The fist part of the song is in terms of similarity 
super similar untill the chorus, and after its again very similar but there are also a bit more changes.
"
  } else {
    "In the intro of this song it doesnt change much, but it does differ a lot from the rest of the song, the rest of the song has big chunks that are also simila except for the outro and a small part around 110 seconds."
  }
})
