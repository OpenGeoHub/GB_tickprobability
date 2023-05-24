# app/logic/popup.R
box::use(
  leaflet[addPopups, clearPopups],
  shiny[moduleServer]
)
#' @export 
server <- function(id, coordinates, value, map_proxy) {
  moduleServer(id, function(input, output, session) {
    map_proxy |>
      clearPopups() |>
      addPopups(
        coordinates$lng,
        coordinates$lat,
        popup = paste0("Tick probability (%): ", value)
      )
  })
}
