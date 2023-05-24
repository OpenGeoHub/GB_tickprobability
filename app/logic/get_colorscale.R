#app/logic/get_colorscale.R
box::use(
  leaflet[colorBin, colorFactor]
)

viridis = c("#fde725", "#5ec962", "#21918c", "#3b528b", "#440154")
cblind_fr = c('#63acbe', '#ee4427', '#601a4a' )

get_colorscale <- function() {
  my_palette <- colorBin(
    pal = viridis,#cblind_fr,
    #pal = c('#33736F','#F09135','#EB4426','#C62A1C','#290B26'),
    bins = c(1, 5, 10, 20, 50, 100),
    na.color = "#00000000"
  )

  return(my_palette)
  }
