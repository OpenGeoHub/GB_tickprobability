box::use(
  shiny[a, absolutePanel, bootstrapPage, div, p, br, fluidPage, moduleServer, NS, observeEvent, sidebarPanel, reactiveVal, shinyUI],
  leaflet[addPolygons, clearPopups, leaflet, leafletProxy,renderLeaflet, leafletOutput, leafletOptions,   removeShape, clearMarkers],
  waiter[use_waiter],
  shiny.semantic[semanticPage]
)


box::use(
  app/view/slider,
  app/view/basemap,
  app/view/addRaster,
  app/view/addShapeFile,
  app/view/popup,
  app/view/plotTS,
  app/view/plotHist,
  app/view/dataSum,
  app/view/geoRaster,
  app/view/colorscale
)

box::use(
  app/logic/get_value[get_rasterValue, get_stackValue],
  app/logic/get_colorscale[get_colorscale],
  app/logic/click_convert[click_convert],
  app/logic/get_histData[get_histData],
  app/logic/get_rasters[get_raster],
  app/logic/get_info[get_info],
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  semanticPage(

    div(class="main-container",
        div(class = "sidebar-panel",
            div(class = "info-slider",
                get_info(),
                div(class = "slider-panel", slider$ui(ns("slider")))
                ),
            div( class = "plot-area", plotTS$ui(ns("ts_plot"))),
            div( class = "plot-area", plotHist$ui(ns("hist"))),
            div( class = "plot-area", dataSum$ui(ns("table"))),
            ),
        div(class = "map-panel", leafletOutput(ns("map"), height = "100%"),
          
          )
    )
  )
}


#' @export
server <- function(id) {

  new_rasters <- get_raster()
  color_scale <- get_colorscale()

  moduleServer(id, function(input, output, session) {
    # setting up the map
    output$map <- renderLeaflet({
      leaflet()
    })
    map_proxy <- leafletProxy("map", session) # generate map proxy to pass updates
    basemap$server("map", map_proxy) # adding basemap
    addShapeFile$server("map", map_proxy) # adding shapefile
    colorscale$server("map", color_scale, map_proxy)


    curent_raster <- reactiveVal()
    observeEvent(slider$server("slider"), {
      raster_position <- slider$server("slider")
      curent_raster <- curent_raster(
        new_rasters[[slider$server("slider")]]
      )
      map_proxy |> clearPopups()
      addRaster$server("map",
               curent_raster(),
               color_scale, map_proxy)

    })

    stackData <- reactiveVal()
    # manage map click events
    observeEvent(input$map_click, {
      click <- input$map_click
      coor <- click_convert(input$map_click$lng, input$map_click$lat) #async
      raster_val <- get_rasterValue(curent_raster(), coor)[,2] #async

      popup$server("map", click, raster_val, map_proxy)
      map_proxy |> clearMarkers()


      #plotting time series
      stack_data <- get_stackValue(new_rasters, coor)
      stackData(stack_data)
      plotTS$server("ts_plot", stackData())

      #plotting histogram
      hist_data <- get_histData(click, curent_raster())
      plotHist$server("hist", hist_data$histData, hist_data$name )

      table <- hist_data$histData
      dataSum$server("table", table)
      print(hist_data$name)
    })
  })

}
