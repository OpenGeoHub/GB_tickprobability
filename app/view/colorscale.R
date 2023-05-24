#app/view/colorscale.R

box::use(
  shiny[moduleServer],
  leaflet[addLegend]
)

#' @export
server <- function(id, color_palette, map_proxy) {
  moduleServer(id, function(input, output, session) {
    map_proxy |>
      addLegend(
        pal = color_palette,
        value = 1:100,
        title = "Probability (%)",
        position = "bottomleft",
        opacity = 0.8
      )
  })
}
