library(shiny)
library(shinydashboard)

shinyUI(dashboardPage(
    dashboardHeader(title = "My Dashboard"),
    dashboardSidebar(
       width = 150,
        sidebarUserPanel("NYC DSA",
                         image = "https://yt3.ggpht.com/-04uuTMHfDz4/AAAAAAAAAAI/AAAAAAAAAAA/Kjeupp-eNNg/s100-c-k-no-rj-c0xffffff/photo.jpg"),
        sidebarMenu(
            menuItem("Plot_General", tabName = "plot", icon = icon("line-chart")),
            menuItem("Map_General", tabName = "map", icon = icon("map"))
        ),
       
        
        br(),
        sidebarMenu(
          menuItem("Plot_Renewable", tabName = "plot1", icon = icon("line-chart")),
          menuItem("Map_Renewable", tabName = "map1", icon = icon("map"))
        ),
       
        br(),
        sidebarMenu(
          menuItem("Plot_Units", tabName = "plot2", icon = icon("line-chart"))
        )
    ),
    
    dashboardBody(
      #######
      
      ########
        tabItems(
            
            tabItem(tabName = "plot",
                 
                     fluidRow(selectizeInput("selected",
                                             "Select Source to Display",
                                             choice, selected='Total Generation', multiple=TRUE),
                              box(htmlOutput("plot_1"), height = 500),
                              box(htmlOutput("plot_2"), height = 500))
                  
                    ),
            #####
            tabItem(tabName = "map",
                 
                    fluidRow(box(selectizeInput(
                               "selected2",
                               "Select Source to Display",
                               choice),
                               htmlOutput("plot_3"), height = 500),
                             box(selectizeInput("selected3",
                                                "Select Source to Display",
                                                choice3),
                                 htmlOutput("plot_8"), height = 500)
                             ) 
            ),
            #######
          #  tabItem(tabName = "data",
          #          fluidRow(box(DT::dataTableOutput("table"), width = 12))),
           #########
             tabItem(tabName = "plot1",
                  
                    fluidRow(selectizeInput("selected1",
                                            "Select Renewable Source to Display",
                                            choice1,selected='Total Generation', multiple=TRUE),
                             box(htmlOutput("plot_4"), height = 500),
                             box(htmlOutput("plot_5"), height = 500))
                    
            ),
            #####
           
          ######
            tabItem(tabName = "map1",

                    fluidRow(
                             box(selectizeInput("selected5",
                                                "Select Renewable Source to Display",
                                                choice1),
                                 htmlOutput("plot_6"), height = 500),
                              box(selectizeInput("selected4",
                                                "Select Source to Display",
                                                choice4),
                                 htmlOutput("plot_9"), height = 500)
                             )      
            ),
            #######
            tabItem(tabName = "plot2",
                    fluidRow(box(htmlOutput("plot_7"), height = 600, width = 800))
            )
        )
    )
))