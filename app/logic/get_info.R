# app/logic/get_info.R

box::use(
  shiny[a, br, div, p]
)
get_info = function() {
  return(div( class = "info-card",
       a(href = "https://doi.org/10.21203/rs.3.rs-2625013/v1", "Article"),
       a(href = "https://doi.org/10.5281/zenodo.7625174", "Data", style = "float:right"),
       br(),
       p('Arsevska E., Hengl T., Singleton D.A., Noble P.J.M., Caminade C., Eneanya O., Jones P.H., Medlock J., Hansford K., Bonannella C., and Radford A.D. (2023)', class = "authors"),
       p("Risk factors for tick attachment in companion animals in
        Great Britain: a spatiotemporal analysis covering 2014-2021.",
         class = "article")
  ))
}
