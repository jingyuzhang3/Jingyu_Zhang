library(DT)
library(shiny)
library(googleVis)

shinyServer(function(input, output){
    # show map using googleVis
    output$plot_1 <- renderGvis({
      # avoid red error 
      validate(need(!is.null(input$selected), "You need to select one input")) 
      
      ########################################
      # col.name <- reactiveValues( 
      #   columns = names(energy_line)
      #   )
      # 
      A = energy_line[, c('Period', input$selected)]
      A = as.data.frame(A)
      
      print(A)
      #colnames(A)[1] = input$selected
      print(A)
      energy_10year <- gvisScatterChart(A, 
                                        options=list(
                                          #    legend="none",
                                          vAxes="[{viewWindowMode:'explicit',
                                          viewWindow:{min:-2000, max:4300000}}]",
                                          hAxes="[{viewWindowMode:'explicit',
                                          viewWindow:{min:2005, max:2016}}]",
                                          lineWidth=2, pointSize=5,
                                          title="Net Electric Power Generation by Source (2006-2015)", 
                                          hAxis="{title:'year'}",
                                          vAxis="{title:'Power ( x 10^9 Watt Hours)'}", 
                                          width=500, height=400))
      
      energy_10year
      ###############################################    
    })
    
    
    output$plot_2 <- renderGvis({
      ##############################################    
      energy_10_vary_ratio <- gvisColumnChart(energy_vary_ratio,yvar=input$selected,
                                              options=list(
                                                #    legend="none",
                                                vAxis='{minValue:-0.2, maxValue:0.2}',
                                                lineWidth = 6,
                                                title="Annual Growth Rate by Source (2006-2015)", 
                                                hAxis="{title:'year'}",
                                                vAxis="{title:'Times'}", 
                                                width=500, height=400))
      energy_10_vary_ratio
      
      ###############################################    
      })
    
    output$plot_3 <- renderGvis({
      ##############################################    
      require(datasets)
      print(length(energy_state$State))
      #print(length(energy_state$))
      GeoStates <- gvisGeoChart(energy_state, "State", input$selected2,
                                options=list(region="US", 
                                             displayMode="regions", 
                                             resolution="provinces",
                                             width=500, height=400))
      GeoStates
      ###############################################    
    })
    
    ##########
      
    
       # state_energy_pie = filter(energy_state, State ==input$selected3)%>% 
       #    melt(., id='State') %>%
       #    select(., -State) %>%
       #    filter(.,variable!="Total.Electric.Power")
    
    
    ##########################################
    output$plot_8 <- renderGvis({
      state_energy_pie = filter(energy_state, State ==input$selected3)%>% 
        melt(., id='State') %>%
        select(., -State) %>%
        filter(.,variable!="Total.Electric.Power")
      Pie <- gvisPieChart(state_energy_pie,
                          options=list(
                            title="Net Electric Power Generation by Source (2015)", 
                            width=500, height=400))
    
      Pie 
    })
    
    #######
    
    output$plot_4 <- renderGvis({
      ##############################################  
    B = re_energy_line[, c('Period', input$selected1)]
    B = as.data.frame(B)
    re_energy_10year <- gvisScatterChart(B, 
                                         options=list(
                                           #    legend="none",
                                           vAxes="[{viewWindowMode:'explicit',
                                           viewWindow:{min:-2000, max:600000}}]",
                                           hAxes="[{viewWindowMode:'explicit',
                                           viewWindow:{min:2006, max:2016}}]",
                                           lineWidth=2, pointSize=5,
                                           title="Net Electric Power Generation by Renewable Source (2006-2015)", hAxis="{title:'year'}",
                                           vAxis="{title:'Power ( x 10^9 Watt Hours)'}", 
                                           width=500, height=400))
    
    re_energy_10year
    ###############################################    
    }) 
    
    
    output$plot_5 <- renderGvis({
    ###############################################
      re_energy_ratio <- gvisColumnChart(re_energy_vary_ratio,yvar=input$selected1,
                                              options=list(
                                                #    legend="none",
                                                vAxis='{minValue:-0.2, maxValue:0.2}',
                                                lineWidth = 6,
                                                title="Annual Growth Rate by Renewable Source (2006-2015)", 
                                                hAxis="{title:'year'}",
                                                vAxis="{title:'Times'}", 
                                                width=500, height=400))
      re_energy_ratio
    ###############################################
    }) 
    
    output$plot_6 <- renderGvis({
      ##############################################    
      require(datasets)
      
      reGeoStates <- gvisGeoChart(re_energy_state, "State", input$selected5,
                                options=list(region="US", 
                                             displayMode="regions", 
                                             resolution="provinces",
                                             width=500, height=400))
      reGeoStates
      ###############################################    
    })
    
    
    output$plot_7 <- renderGvis({
      ##############################################    
      unit1 <- gvisColumnChart(unit_net2,xvar = "Source", yvar = c("Addition","Retirement"),
                                options=list(
                                  #    legend="none",
                                  vAxis='{minValue:-100, maxValue:500}',
                                  series="[{color:'green', targetAxisIndex: 0}, 
                                  {color: 'orange',targetAxisIndex:1}]",
                                  lineWidth = 6,
                                  title="Planned Electric Gererating Units (2016-2023)", 
                                  hAxis="{title:'Source'}",
                                  vAxis="{title:'Unit Count'}", 
                                  width=600, height=500))
      unit1
      ###############################################    
    })
    
    
    ##########################################
    output$plot_9 <- renderGvis({
      re_state_energy_pie = filter(re_energy_state, State ==input$selected4)%>% 
        melt(., id='State') %>%
        select(., -State)
      
      Pie <- gvisPieChart(re_state_energy_pie,
                          options=list(
                            title="Net Electric Power Generation by Renewable Source (2015)", 
                            width=500, height=400))
      
      Pie 
    })
    
    #######
    
    
    
})
    
    