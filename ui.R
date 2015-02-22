# ui.R

shinyUI(fluidPage(
        titlePanel("Visualizing the distribution of the primes (up to n=100,000)"),
        mainPanel(
               br(),
                h4("This application uses an image to visualize the distribution of prime numbers."),
                h4("Recall that prime numbers are whole numbers that are only divisible by themselves and the number one.  
                   Composite numbers are whole numbers which are not prime."),
                h4("To calculate the prime numbers, an implementation of the Sieve of Eratosthenes was used.  Further 
                   information on the", tags$a(href="http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes", 
                                               "Sieve of Eratosthenes"), "can be found on Wikipedia."   ),
               h5("Note:  Please see the instructions on the right in order to use the slider.  Some information with 
                  regards to the results will be displayed below the image."),
                plotOutput("primes"),
               strong("The given # is:"), strong(code(textOutput("given"))),
               strong("The number of primes below the given # is:"), strong(code(textOutput("data"))),
               strong("The last 10 primes below the given # are:"), strong(code(textOutput("tens"))),
               strong("The sum of all the primes below the given # is:"),strong(code(textOutput("sums")))
                ),
        sidebarLayout(
                
                sidebarPanel(
                       helpText(strong("Instructions:")),
                        helpText("Please use the slider below to select a number up to 100,000."),
                        helpText("The image on the left will change to represent the distribution of primes up to that number."),
                        helpText("Yellow blocks represent prime numbers, and red blocks represent composite numbers."),
                        sliderInput("slider1", 
                                    label = "Find all the primes below a given #:",
                                    min = 500, max = 100000, value = 20000),
                        img(src = "Eratosthenes.png")),
                        
                mainPanel(
                        )
        )
                        
                
        )
)
