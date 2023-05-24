#app/view/plotHist.R
box::use(
  plotly[layout, renderPlotly, plot_ly, plotlyOutput],
  shiny[moduleServer, NS]
)
#' @export
ui <- function(id) {
  ns <- NS(id)
  plotlyOutput(ns("hist_plot"), height = "300")
}
#' @export
server = function(id, data, name) {
  moduleServer(id, function(input, output, session) {
    output$hist_plot <- renderPlotly({
      data[data == 0] = NA
      plot_ly(
        x = data[, c("cellValue")], type = "histogram",
      ) |>
        layout(
          autosize = TRUE,
          margin = list(l = 10, r = 10, b = 100, t = 50),
          title = list(
            text = paste("Histogram plot of<br>",name,"area", sep=" "),
            font = list(size = 14)
          ),
          xaxis = list(
            title = "Tick occurence probability (%)",
            font = list(size = 12)#, range = list(0, 101)
          ),
          yaxis = list(
            title = "Frequency", font = list(size = 12)
          )
        )
    })
  })
}
