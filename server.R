library(data.table)
library(maps)

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
    lat <- abs(lat)
    g_eq * (1 + k * sin(lat / 180 * pi) ^ 2) / sqrt(1 - e_sqr * sin(lat / 180 * pi) ^ 2)
}


shinyServer(
    function(input, output) {
        
        bmi_re <- reactive({
            calcBmi(input$weight, input$height)
        })
        g_lat_re <- reactive({
            g_lat(input$lat)
        })
        g_factor_re <- reactive({
            g_lat(input$lat)/g_std
        })
        map_plot <- reactive({
            par(mar=rep(0,times=4))
            map('world', fill = TRUE, col = 1)
            abline(h=input$lat, col='red', lwd=2)
            box()
        })
        
        #bmi <- calcBmi(input$weight, input$height)
        output$bmi  <- renderText ({bmi_re()})
        output$cat  <- renderText ({bmiCat(bmi_re())})

        output$lat_weight_change <- renderText ({sprintf('%+.2f%%', (1-g_factor_re())*100)})
        output$weight_std <- renderText ({input$weight * g_factor_re()})
        output$bmi_lat  <- renderText ({bmi_re() * g_factor_re()})
        output$cat_lat  <- renderText ({bmiCat(bmi_re() * g_factor_re())})
        output$map_plot <- renderPlot({map_plot()}, height = 150, width = 250)
    }
)

