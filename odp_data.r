library(tidyverse)
library(esri2sf)
library(sf)

url <- "https://gis.unhcr.org/arcgis/rest/services/core_v2/wrl_polbnd_int_15m_a_unhcr/FeatureServer/0"

ctry_sf <- esri2sf(url)

active <- c("SDN", "SSD", "ETH", "TCD", "EGY", "CAF")
previous <- c("BFA", "TGO", "CIV", "BEN", "GHA")

actvive_sf <- ctry_sf |> 
    select(iso3, color_code, terr_name)  |> 
    filter(color_code %in% active)

sf::st_write(actvive_sf, "active_core.geojson")

previous_sf <- ctry_sf |> 
    select(iso3, color_code, terr_name)  |> 
    filter(color_code %in% previous)

sf::st_write(previous_sf, "previous_core.geojson")
