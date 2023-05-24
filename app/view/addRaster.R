#/app/view/addRaster.R

box::use(
  leaflet[addRasterImage],
  shiny[moduleServer, NS],
  raster[brick]
)


#' @export
server <- function(id, raster_file, color_palette, proxy_map) {
  moduleServer(id, function(input, output, session) {
    proxy_map |>
      addRasterImage(
        x = brick(raster_file),
        color = color_palette,
        opacity = 1,
        project = FALSE,
        layerId = "rasterLayer"
      )
  })
}

