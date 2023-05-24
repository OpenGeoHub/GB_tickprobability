#app/logic/raster_value.R

box::use(
  raster[cellFromXY, raster]
   
)

#' @export
get_rasterValue <- function(x, y, raster_data) {
  cell <- cellFromXY(raster(raster_data), c(x, y))
  val <- raster_data[cell]
  return(val)
}