library(jsonlite)
library(tidyverse)

odp_json <- "https://data.unhcr.org/api-content/documents.json?API_KEY=d78bdd20-36eb-4a7a-8a69-e009f21f0cf9&order[created]=desc&situation=core&page=1&limit=500"

odp_df <- fromJSON(odp_json)

View(odp_df)

odp_df |> 
    select(title, thumbnailFile, publishDate)
