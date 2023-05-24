#app/logic/get_histData.R

box::use(
  terra[extract, mask, vect, project],
  terra,
  sp[CRS],
  sf[st_as_sf]
)


box::use(
  app/logic/get_vector[get_vector],
)

get_histData = function(click, localraster) {

  point = array(
    c(c(click$lng, click$lat)),
    dim = c(1,2),
    dimnames = list(c(1),c('x','y'))
  )

  localraster = project(localraster, 'epsg:4326')
  shape = vect(get_vector("/app/static/data/nuts3GB.shp"))

  area_name = terra$extract(shape, point)$NUTS3_NAME # string from dataframe
  sub_area = shape[shape$NUTS3_NAME == area_name] # this returns spatVect
  cliped_rast = mask(localraster, sub_area)
  raster_df = terra$as.data.frame(cliped_rast)
  # setting zero to NA
  #raster_df[raster_df==0] = NA
  names(raster_df) = c('cellValue')
  #print(raster_df)
  return(list(
    histData = raster_df,
    name = area_name,
    sub_shape = st_as_sf(sub_area)
  ))
}
