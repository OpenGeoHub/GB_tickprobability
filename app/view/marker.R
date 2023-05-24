# app/logic/marker.R
box::use(
  leaflet[addMarkers, addAwesomeMarkers, awesomeIcons],
  shiny[moduleServer, NS, textOutput,verbatimTextOutput,renderText]
)

icons <- awesomeIcons(icon='ios-close', iconColor='black', library='ion', markerColor = '#982c9e')


#' @export
ui <- function(id) {
  ns <- NS(id)
  textOutput(ns("prob_text"))

}
#' @export
server <- function(id, coordinates, value, map_proxy) {
  moduleServer(id, function(input, output, session) {
    output$prob_text = renderText({value})
    print(paste('should see something like ', value))
    map_proxy |>
      addAwesomeMarkers(
        lng = coordinates$lng,
        lat = coordinates$lat,
        icon=icons
      )
    
  })
}




# clearPopups() |>
#   addPopups(
#     coordinates$lng,
#     coordinates$lat,
#     popup = paste0("Tick probability (%): ", value)
#   )
