#app/view/slider.R
box::use(
  shiny[animationOptions, moduleServer, NS, reactive],
  shinyWidgets[sliderTextInput],
)

# this should be stationed somewhere else
counter <- 1
values <- c()
for (year in 2014:2021) {
  for (month in 1:12) {
    values[counter] <- sprintf("%1d/%02d", year, month)
    counter <- counter + 1
  }
}
# up to here
#' @export
ui <- function(id) {
  # assign namespace
  ns <- NS(id)
  # build ui in here
  sliderTextInput(
    inputId = ns("slider"),
    label = "Date: ",
    choices = values,
    animate = animationOptions(
      interval = 700,
      playButton = "Play",
      pauseButton = "Pause")
  )
}


#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # build functionality in here for slider
    # this returns raster position
    return(which(values == input$slider))
  })
}
