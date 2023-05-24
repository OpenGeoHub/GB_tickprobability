# app/view/plotTS.R
box::use(
  shiny[moduleServer, NS],
  plotly[renderPlotly, plot_ly, layout, plotlyOutput],
)
#' @export
ui <- function(id) {
  ns <- NS(id)
  plotlyOutput(ns("trend_plot"), height = "300")
}
#' @export
server <- function(id, data) {
  #require(data)
  moduleServer(id, function(input, output, session) {
    output$trend_plot <- renderPlotly({
      plot_ly(
        data, x = ~Dates, y = ~Prob,
        type = "scatter", mode = "lines"
      ) |>
        layout(
          margin = list(l = 10, r = 10, b = 50, t = 50),
          autosize = TRUE,
          title = list(
            text = "Trend plot of selected point",
            font = list(size = 14)
          ),
          xaxis = list(
            title = "Date",
            font = list(size = 12), tickangle = -60
          ),
          yaxis = list(
            title = "Tick occurence probability (%)",
            font = list(size = 12)#, range = list(0, 101)
          )
        )
    })
  })
}
