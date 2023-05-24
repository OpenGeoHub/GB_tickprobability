#app/view/addShapeFile.R

box::use(
  leaflet[addPolygons,highlightOptions],
  shiny[moduleServer],
)
box::use(
  app/logic/get_vector[get_vector]
)
file_path <- "/app/static/data/nuts3GB.shp"
myFile <- get_vector(file_path)

#' @export
server <- function(id, proxyMap) {
  moduleServer(id, function(input, output, session) {
    proxyMap |>
      addPolygons(
        data = myFile,
        weight = 1,
        color = "gray",
        fillColor = "#00000000",
        highlightOptions = highlightOptions(color = "orange", weight = 5, bringToFront = TRUE)
      )
  })
}

