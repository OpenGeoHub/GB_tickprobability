# shiny-geovisualization
Proof of concept application for geo-visualization in R lang with Leaflet and Shiny

This geo-visualization application is prepared to comply with the following requirements.

- Visualize Cloud Optimized GeoTIFF (COG) files with a color scale.
- Display the color scale and level used to style the COGs.
- The visualization of the COGs should be dynamic by using a slider. 
- Ensure point query events from COGs and represent them as Popup.
- Visualise the zonal statistics of the intersected area that is selected from the Polygon layer on a click event and COGs.
- Display the stats of the selected area in table format.

* To be able to run the project, you need to run the following command from R Console;

  **shiny::runApp()**






## Underlying research article and the dataset

  Elena Arsevska, Tomislav Hengl, David A. Singleton et al. Risk factors for tick attachment in companion animals in Great Britain: a spatiotemporal analysis covering 2014-2021, 20 March 2023, PREPRINT (Version 1) available at Research Square https://doi.org/10.21203/rs.3.rs-2625013/v1
 
  Hengl, T., Arsevska, E., & Bonannella, C. (2023). Predicted occurrence probability for ticks in Great Britain (2014 to 2021) at 1 km spatial resolution (Version v1) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.7625175


### Sample view of the application

![screenshot](https://github.com/OpenGeoHub/GB_tickprobability/assets/34002197/a5364733-e1f3-4105-ae78-746fff28063c)
