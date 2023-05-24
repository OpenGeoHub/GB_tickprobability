# app/logic/click_convert.R

box::use(
  data.table[as.data.table],
  sp[CRS],
)

#' @export
click_convert <- function(x, y) {
  given_coordinates <- as.data.table(list(X = x, Y = y))
  sp::coordinates(given_coordinates) <- c("X", "Y")
  sp::proj4string(given_coordinates) <- CRS("+init=EPSG:4326")
  result_coordinate <- sp::spTransform(given_coordinates, CRS("+init=EPSG:3857")) #PSMERC
  return(result_coordinate)
}
