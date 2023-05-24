box::use(
  leaflet[addProviderTiles, setView, providers],
  shiny[moduleServer]
)

#' @export
server <- function(id, mapProxy) {
  moduleServer(id, function(input, output, session) {
    mapProxy |>
      setView(lat = 55.15, lng = -3, zoom = 6) |>
      #addProviderTiles(providers$CartoDB.DarkMatterNoLabels)
      addProviderTiles(providers$CartoDB.PositronNoLabels)
    })
}
