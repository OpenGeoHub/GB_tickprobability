#app/view/dataSum.R

box::use(
  shiny[NS, tableOutput, moduleServer, renderTable],
  stats[quantile, median]
)

#' @export
ui = function(id) {
  ns = NS(id)

  tableOutput(ns('local_table'))
}

#' @export
server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    table <- data$cellValue

    output$local_table <- renderTable(
      data.frame(
        minimum = min(table),
        Q1 = quantile(table, 0.25),
        median = median(table),
        mean = mean(table),
        Q3 = quantile(table, 0.75),
        max = max(table)
      ),
      align = "c", width = "100px", spacing = "xs",
    )
  })
}
