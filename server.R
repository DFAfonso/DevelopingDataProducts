#server.R


source("sieve.R")
sum_p <- readRDS("data/sum_p.rds")




shinyServer(
        function(input,output){
        

                output$primes <- renderPlot({
                        n <- input$slider1
                        s_primes <- sieve(n)
                        m_dim <- floor(sqrt(n))
                        junk <- rep(0,m_dim^2)
                        for (i in 1: length(s_primes)) junk[s_primes[i]] = 1
                        image(matrix(junk,m_dim,m_dim), axes = FALSE,xaxs = NULL, yaxs=NULL, col = heat.colors(2))
                })       
                output$data <- renderText({                        
                        n <- input$slider1
                        s_primes <- sieve(n)
                        length(s_primes)
                        
                })
                
                output$tens <- renderText({                        
                        n <- input$slider1
                        s_primes <- sieve(n)
                        s_primes[(length(s_primes)-9) : length(s_primes)]
                })
                
                output$given <- renderText({                        
                        n <- input$slider1
                        as.integer(n)
                })        
                
                output$sums <- renderText({                        
                        n <- input$slider1
                        s_primes <- sieve(n)
                        sum_p[length(s_primes)]
                })   
                        
                
        
        
}

)