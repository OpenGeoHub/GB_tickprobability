# app/logic/get_vector.R

box::use(
  sf[read_sf, st_transform],
  here[here],
  sp[CRS],
)
get_vector <- function(file_path) {
  shapefile <- read_sf(paste0(here(), file_path))
  shapefile <- st_transform(shapefile, CRS("+init=epsg:4326"))

  return(shapefile)
}

