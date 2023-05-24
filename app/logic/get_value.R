#app/logic/get_value.R

box::use(
  terra,
  tibble[tibble]
)

get_rasterValue <- function(raster, coordinate) {
  return(terra$extract(raster, data.frame(lon = coordinate$X, lat = coordinate$Y)))
}

get_stackValue <- function(rasterStack, coordinate) {
  point = array(
    c(c(coordinate$X, coordinate$Y)),
    dim = c(1, 2),
    dimnames = list(c(1), c("x", "y"))
  )
  data <- terra$extract(rasterStack, point)
  values <- names(data)
  values=gsub("_", "/", values)
  names(data) <- NULL
  data <- as.data.frame(t(data))
  data <- tibble(values,data)
  names(data) <- c("Dates", "Prob")
  return(data)
}
