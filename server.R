library(data.table)

cats <- data.table(flr=c(0, 15, 16, 18.5, 25, 30, 35, 40)
                   , cat=c('Very severely underweight'
                           , 'Severely underweight'
                           , 'Underweight'
                           , 'Normal (healthy weight)'
                           , 'Overweight'
                           , 'Obese Class I (Moderately obese)'
                           , 'Obese Class II (Severely obese)'
                           , 'Obese Class III (Very severely obese)'
                   )
)

calcBmi <- function(weight, height) {
    weight/(height/100)^2
}

bmiCat <- function(bmi) {
    cats[flr==max(cats[flr<=bmi]$flr)]$cat    
}

g_std <- 9.80665 # standard gravity (average gravity on Earth's surface)
# Constants for calculating gravity by latitude (based on WGS84)
# See http://geophysics.ou.edu/solid_earth/notes/potential/igf.htm for details.
g_eq <- 9.7803267714 # normal gravity
k <- 0.00193185138639 # gravity flattening 
e_sqr <- 0.00669437999013

# Calculate the latitude-adjusted gravity
g_lat <- function(lat) {
    g_eq * (1 + k * sin(lat / 180 * pi) ^ 2) / sqrt(1 - e_sqr * sin(lat / 180 * pi) ^ 2)
}


shinyServer(
    function(input, output) {
        #bmi <- calcBmi(input$weight, input$height)
        output$bmi  <- renderText ({calcBmi(input$weight, input$height)})
        output$cat  <- renderText ({bmiCat(calcBmi(input$weight, input$height))} )

        output$weight_std <- renderText ({input$weight * g_lat(input$lat)/g_std} )
        output$bmi_lat  <- renderText ({calcBmi(input$weight * g_lat(input$lat)/g_std, input$height)})
        output$cat_lat  <- renderText ({bmiCat(calcBmi(input$weight * g_lat(input$lat)/g_std, input$height))} )
    }
)

