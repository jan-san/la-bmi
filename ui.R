shinyUI(pageWithSidebar(
    headerPanel( 'Latitude-adjusted Body Mass Index (LA-BMI) Calculator' )
    , sidebarPanel(
        h3( 'Your input')
        , numericInput('weight', 'Your weight (in kg)',  80, min =  1, max = 200 , step =  0.000001)
        , numericInput('height', 'Your height (in cm)',  180, min =  1, max = 300 , step =  0.000001)
        , numericInput('lat', 'Latitude of your current location (in °, between 0 (Equator) and 90 (Pole))',  0, min =  0, max = 90 , step =  0.0000001)
    )
    , mainPanel(
        h4('About the calculator')
        , p('This application allows you to calculate your actual Body Mass Index anywhere in the world, adjusting for the weight difference introduced by the variation of Earth\'s gravity between the Equator and the Poles (see ', a(href='http://en.wikipedia.org/wiki/Gravity_of_Earth#Latitude', 'this article'), 'for details).')
        , p('The adjusted BMI is based on your weight under standard gravity, i.e. the Earth\'s average gravity.')
        , p('This can be useful for somewhat pedantic control freaks on a rigorous diet who frequently travel around the world and are forced to rely on scales not adjusted to the local gravity to determine their weight (huge market!).')
        , p('Please note that the calculations assume that the weight was measured at sea level, and that the scale was calibrated for standard gravity.
             Other factors influencing your local weight (such as buoyoncy influenced by ambient air pressure and your body\'s density as well as the position of sun and moon) are not considered in the calculation.')
        , h4('Usage')
        , p('Enter your weight, height and latitude into the input fields on the left. To obtain your current latitude, you can left click on your position in ',
            a(href='http://maps.google.com', 'Google Maps'),
            'or use a GPS tracker.')
        
        , h3( 'Unadjusted BMI')
        , p(strong('BMI: '), textOutput( "bmi", inline=T ))
        , p(strong('Category: '), textOutput( "cat", inline=T ))
        , h3( 'LA-BMI')
        , p(strong('Adjusted weight (under standard gravity): '), textOutput( "weight_std", inline=T ))
        , p(strong('LA-BMI: '), textOutput( "bmi_lat", inline=T ))
        , p(strong('Category: '), textOutput( "cat_lat", inline=T ))
    )
))