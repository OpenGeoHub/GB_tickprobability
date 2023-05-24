# app/logic/get_rasters.R
box::use(
    here[here],
    terra[rast],
)
get_raster <- function() {
    raster_path <- list.files(paste0(here(), "/app/static/data/rasters"), full.names = TRUE)
    return(rast(raster_path))
}