#app/view/geoRaster.R

box::use(
  viridisLite,
  leaflet[addTiles],
  shiny[addResourcePath,moduleServer, NS],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
}

#' @export
server <- function(id, map_proxy, raster_name) {
  moduleServer(id, function(input, output, session) {
    givenresource <- paste0("./app/static/data/color_cog_tiles/", raster_name)
    addResourcePath("mytiles", givenresource)
    print(givenresource)
    map_proxy |>
      addTiles(
        urlTemplate = paste0("mytiles/{z}/{x}/{y}.png")
      )
  })
}
