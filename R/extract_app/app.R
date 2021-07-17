library(shiny)
library(shinydashboard)
library(shinycssloaders)


source(file = 'scripts/read_data_t0.R')
source(file = 'scripts/read_data_t1.R')
source(file = 'scripts/read_data_t2.R')
source(file = 'scripts/read_data_t3.R')
source(file = 'scripts/read_data_t4.R')
source(file = 'scripts/read_data_t5.R')
source(file = 'scripts/read_data_t6.R')
source(file = 'scripts/read_data_t8.R')
source(file = 'scripts/read_data_t9.R')
source(file = 'scripts/read_data_t10.R')
source(file = 'scripts/read_data_t13.R')
source(file = 'scripts/combined.R')

# Define UI for application 
ui <- dashboardPage(title = "Extract csv", skin = 'yellow',
    dashboardHeader(title = 'Extract .csv app'),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("home")),
            menuItem("Sheets", startExpanded = TRUE, icon = icon("align-left"),
                     menuSubItem("T0", tabName = "t0", icon = icon("list")),
                     menuSubItem("T1", tabName = "t1", icon = icon("list")),
                     menuSubItem("T2", tabName = "t2", icon = icon("list")),
                     menuSubItem("T3", tabName = "t3", icon = icon("list")),
                     menuSubItem("T4", tabName = "t4", icon = icon("list")),
                     menuSubItem("T5", tabName = "t5", icon = icon("list")),
                     menuSubItem("T6", tabName = "t6", icon = icon("list")),
                     menuSubItem("T8", tabName = "t8", icon = icon("list")),
                     menuSubItem("T9", tabName = "t9", icon = icon("list")),
                     menuSubItem("T10", tabName = "t10", icon = icon("list")),
                     menuSubItem("T13", tabName = "t13", icon = icon("list"))
                     ),
            menuItem("Combined", tabName = "combined", icon = icon("battery-full"))
        )
    ),
    # dashboardSidebar(
    #     sidebarUserPanel("User Name",
    #                      subtitle = a(href = "#", icon("circle", class = "text-success"), "Online"),
    #                      # Image file should be in www/ subdir
    #                      image = "userimage.png"
    #     ),
    #     sidebarSearchForm(label = "Enter a number", "searchText", "searchButton"),
    #     sidebarMenu(
    #         # Setting id makes input$tabs give the tabName of currently-selected tab
    #         id = "tabs",
    #         menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    #         menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
    #                  badgeColor = "green"),
    #         menuItem("Charts", icon = icon("bar-chart-o"),
    #                  menuItem("One more", icon = icon("bar-chart-o"),
    #                             menuSubItem("Sub-item 3", tabName = "subitem3")
    #                           ),
    #                  menuSubItem("Sub-item 1", tabName = "subitem1"),
    #                  menuSubItem("Sub-item 2", tabName = "subitem2")
    #         )
    #     )
    # ),
    dashboardBody(
        tabItems(
            tabItem("dashboard",
                    div(p("Dashboard tab content")),
                    tags$hr(),
                    
                    # Input: Select a file ----
                    fileInput("inputfile", "Choose XLSX File",
                              multiple = FALSE,
                              accept = c("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                         ".xlsx")
                              ),
                    tableOutput("files")
                    
            ),
            tabItem("t0",
                    "t0 tab content",
                    tabsetPanel(
                        tabPanel("Fig.2", 
                                 tags$hr(),
                                 downloadButton("downloadDataT0fig2", "Download Fig.2 from T0"),
                                 tableOutput("filetable_fig2"),
                                 uiOutput('nofig2T0')
                                 ),
                        tabPanel("Fig.3", 
                                 tags$hr(),
                                 downloadButton("downloadDataT0fig3", "Download Fig.3 from T0"),
                                 tableOutput("filetable_fig3"),
                                 uiOutput('nofig3T0')
                                 ),
                        tabPanel("Fig.5", 
                                 tags$hr(),
                                 downloadButton("downloadDataT0fig5", "Download Fig.5 from T0"),
                                 tableOutput("filetable_fig5"),
                                 uiOutput('noT0')
                                 )
                    )
            ),
            tabItem("t1",
                    div(p("t1 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT1table1", "Download Table from T1"),
                    tableOutput("filetable_table1")
                    
            ),
            tabItem("t2",
                    "t2 tab content",
                    tabsetPanel(
                        tabPanel("Table 1", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table1", "Download Table 1 from T2"),
                                 tableOutput("filetable_t2table1")
                        ),
                        tabPanel("Table 2", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table2", "Download Table 2 from T2"),
                                 tableOutput("filetable_t2table2")
                        ),
                        tabPanel("Table 3", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table3", "Download Table 3 from T2"),
                                 tableOutput("filetable_t2table3")
                        ),
                        tabPanel("Table 4", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table4", "Download Table 4 from T2"),
                                 tableOutput("filetable_t2table4")
                        ),
                        tabPanel("Table 5", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table5", "Download Table 5 from T2"),
                                 tableOutput("filetable_t2table5")
                        ),
                        tabPanel("Table 6",
                                 tags$hr(),
                                 downloadButton("downloadDataT2table6", "Download Table 6 from T2"),
                                 tableOutput("filetable_t2table6")
                        ),
                        tabPanel("Table 7", 
                                 tags$hr(),
                                 downloadButton("downloadDataT2table7", "Download Table 7 from T2"),
                                 tableOutput("filetable_t2table7")
                        ),
                        tabPanel("Table 8", 
                                 tags$hr(), 
                                 downloadButton("downloadDataT2table8", "Download Table 8 from T2"),
                                 tableOutput("filetable_t2table8")
                        )
                    )
            ),
            tabItem("t3",
                    div(p("t3 tab content")),
                    tags$hr(),
                    tabsetPanel(
                        tabPanel("Fig.3", 
                                 tags$hr(),
                                 downloadButton("downloadDataT3table3", "Download Table (Fig.3) from T3"),
                                 tableOutput("filetable_table3")
                        ),
                        tabPanel("Fig.13", 
                                 tags$hr(),
                                 downloadButton("downloadDataT3table3_fig13", "Download Table (Fig.13) from T3"),
                                 tableOutput("filetable_table3_fig13")
                        )
                    )
                    
            ),
            tabItem("t4",
                    div(p("t4 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT4table4", "Download Table from T4"),
                    tableOutput("filetable_table4")
                    
            ),
            tabItem("t5",
                    div(p("t5 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT5table5", "Download Table from T5"),
                    tableOutput("filetable_table5")
                    
            ),
            tabItem("t6",
                    div(p("t6 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT6table6", "Download Table from T6"),
                    tableOutput("filetable_table6")
                    
            ),
            tabItem("t8",
                    div(p("t8 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT8table8", "Download Table from T8"),
                    tableOutput("filetable_table8")
                    
            ),
            tabItem("t9",
                    div(p("t9 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT9table9", "Download Table from T9"),
                    tableOutput("filetable_table9")
                    
            ),
            tabItem("t10",
                    div(p("t10 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT10table", "Download Table from T10"),
                    tableOutput("filetable_table10")
                    
            ),
            tabItem("t13",
                    div(p("t13 tab content")),
                    tags$hr(),
                    downloadButton("downloadDataT13table", "Download Table from T13"),
                    tableOutput("filetable_table13")
                    
            ),
            tabItem("combined",
                    div(p("Combined tab content")),
                    tags$hr(),
                    downloadButton("downloadCombinedData", "Download Combined Data"),
                    tableOutput("filetable_table_combined") %>% shinycssloaders::withSpinner(type = 8, color = "#f39c12")
                    
                    
            )

            
        )
    )
)


# Define server logic 
server <- function(input, output, session) {
    
    # Main page file path table
    output$files <- renderTable(input$inputfile)
    
    #### T0 Fig.2
    
    fig2t0 <- reactive({
        req(input$inputfile$datapath)
        fig2 <- extract_t0_fig2(excel_file_path = input$inputfile$datapath)
        return(fig2)
    })
    
    
    # Observe if T0 exists
    observe({
        # req(fig2t0())
        req(input$inputfile)
        
        if("T0" %in% excel_sheets(input$inputfile$datapath)){
            if(ncol(read_excel(input$inputfile$datapath, sheet = 'T0')) > 0){
                output$filetable_fig2 <- renderTable({
                    fig2t0()
                }, digits = 4)
                
                output$downloadDataT0fig2 <- downloadHandler(
                    filename = function() {
                        paste0('Figure_6_Final', ".csv")
                    },
                    content = function(file) {
                        write.csv(fig2t0(), file)
                    }
                )
            } else {
                output$nofig2T0 <- renderUI({
                    tagList(
                        tags$p(str_glue("No data detected in the T0 sheet!"))
                    )
                })
            }
        } else {
            
            output$nofig2T0 <- renderUI({
                tagList(
                    tags$p(str_glue("The {input$inputfile$name} file doesn't consist the T0 sheet!"))
                )
            })
            
        }
    })
    
    
    #### T0 Fig.3
    
    fig3t0 <- reactive({
        req(input$inputfile$datapath)
        fig3 <- extract_t0_fig3(excel_file_path = input$inputfile$datapath)
        return(fig3)
    })
    
    
    # Observe if T0 exists
    observe({
        # req(fig3t0())
        req(input$inputfile)
        
        if("T0" %in% excel_sheets(input$inputfile$datapath)){
            if(ncol(read_excel(input$inputfile$datapath, sheet = 'T0')) > 0){
                output$filetable_fig3 <- renderTable({
                    fig3t0()
                }, digits = 4)
                
                output$downloadDataT0fig3 <- downloadHandler(
                    filename = function() {
                        paste0('Figure_13_14_Final', ".csv")
                    },
                    content = function(file) {
                        write.csv(fig3t0(), file)
                    }
                )
            } else {
                output$nofig3T0 <- renderUI({
                    tagList(
                        tags$p(str_glue("No data detected in the T0 sheet!"))
                    )
                })
            }
        } else {
            
            output$nofig3T0 <- renderUI({
                tagList(
                    tags$p(str_glue("The {input$inputfile$name} file doesn't consist the T0 sheet!"))
                )
            })
            
        }
    })
    
    
    #### T0 Fig.5
    
    fig5t0 <- reactive({
        req(input$inputfile$datapath)
        fig5 <- extract_t0_fig5(excel_file_path = input$inputfile$datapath)
        return(fig5)
    })
    
    # Observe if T0 exists
    observe({
        # req(fig5t0())
        req(input$inputfile)
        
        if("T0" %in% excel_sheets(input$inputfile$datapath)){
            if(ncol(read_excel(input$inputfile$datapath, sheet = 'T0')) > 0){
            output$filetable_fig5 <- renderTable({
                fig5t0()
            }, digits = 4)
            
            output$BTNfig5 <- renderUI({
                tagList(
                    downloadButton("downloadDataT0fig5", "Download Fig.5 from T0")
                )
            })
            
            output$downloadDataT0fig5 <- downloadHandler(
                filename = function() {
                    paste0('Figure_21_Final', ".csv")
                },
                content = function(file) {
                    write.csv(fig5t0(), file)
                }
            )
            } else {
                output$noT0 <- renderUI({
                    tagList(
                        tags$p(str_glue("No data detected in the T0 sheet!"))
                    )
                })
            }
        } else {
        
            output$noT0 <- renderUI({
                tagList(
                    tags$p(str_glue("The {input$inputfile$name} file doesn't consist the T0 sheet!"))
                )
            })
        
        }
    })
    
    #### T1 table
    
    tablet1 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t1(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table1 <- renderTable({
        req(tablet1())
        req(input$inputfile)
        tablet1()
    }, digits = 3)
    
    output$downloadDataT1table1 <- downloadHandler(
        filename = function() {
            paste0('Figure_26_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet1(), file)
        }
    )
    
    
    #### T2 Table 1
    
    tablet2t_1 <- reactive({
        req(input$inputfile$datapath)
        t2table1 <- extract_table_one_t2(excel_file_path = input$inputfile$datapath)
        return(t2table1)
    })
    
    output$filetable_t2table1 <- renderTable({
        req(tablet2t_1())
        req(input$inputfile)
        tablet2t_1()$df
    }, digits = 3)
    
    output$downloadDataT2table1 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_1()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_1()$df, file)
        }
    )
    
    
    #### T2 Table 2
    
    tablet2t_2 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_two_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table2 <- renderTable({
        req(tablet2t_2())
        req(input$inputfile)
        tablet2t_2()$df
    }, digits = 3)
    
    output$downloadDataT2table2 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_2()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_2()$df, file)
        }
    )
    
    
    #### T2 Table 3
    
    tablet2t_3 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_three_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table3 <- renderTable({
        req(tablet2t_3())
        req(input$inputfile)
        tablet2t_3()$df
    }, digits = 3)
    
    output$downloadDataT2table3 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_3()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_3()$df, file)
        }
    )
    
    
    #### T2 Table 4
    
    tablet2t_4 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_four_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table4 <- renderTable({
        req(tablet2t_4())
        req(input$inputfile)
        tablet2t_4()$df
    }, digits = 3)
    
    output$downloadDataT2table4 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_4()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_4()$df, file)
        }
    )
    
    
    #### T2 Table 5
    
    tablet2t_5 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_five_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table5 <- renderTable({
        req(tablet2t_5())
        req(input$inputfile)
        tablet2t_5()$df
    }, digits = 3)
    
    output$downloadDataT2table5 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_5()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_5()$df, file)
        }
    )
    
    
    #### T2 Table 6
    
    tablet2t_6 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_six_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table6 <- renderTable({
        req(tablet2t_6())
        req(input$inputfile)
        tablet2t_6()$df
    }, digits = 3)
    
    output$downloadDataT2table6 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_6()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_6()$df, file)
        }
    )
    
    
    #### T2 Table 7
    
    tablet2t_7 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_seven_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table7 <- renderTable({
        req(tablet2t_7())
        req(input$inputfile)
        tablet2t_7()$df
    }, digits = 3)
    
    output$downloadDataT2table7 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_7()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_7()$df, file)
        }
    )
    
    
    #### T2 Table 8
    
    tablet2t_8 <- reactive({
        req(input$inputfile$datapath)
        t2table <- extract_table_eight_t2(excel_file_path = input$inputfile$datapath)
        return(t2table)
    })
    
    output$filetable_t2table8 <- renderTable({
        req(tablet2t_8())
        req(input$inputfile)
        tablet2t_8()$df
    }, digits = 3)
    
    output$downloadDataT2table8 <- downloadHandler(
        filename = function() {
            paste0(tablet2t_8()$title, ".csv")
        },
        content = function(file) {
            write.csv(tablet2t_8()$df, file)
        }
    )
    
    
    #### T3 table (fig.3)
    
    tablet3 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t3(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table3 <- renderTable({
        req(tablet3())
        req(input$inputfile)
        tablet3()
    }, digits = 2)
    
    output$downloadDataT3table3 <- downloadHandler(
        filename = function() {
            paste0('T3_Figure_3_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet3(), file)
        }
    )
    
    #### T3 table (fig.13)
    
    tablet3_fig13 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t3_fig13(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table3_fig13 <- renderTable({
        req(tablet3_fig13())
        req(input$inputfile)
        tablet3_fig13()
    }, digits = 2)
    
    output$downloadDataT3table3_fig13 <- downloadHandler(
        filename = function() {
            paste0('T3_Figure_13_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet3_fig13(), file)
        }
    )
    
    #### T4 table
    
    tablet4 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t4(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table4 <- renderTable({
        req(tablet4())
        req(input$inputfile)
        tablet4()
    }, digits = 2)
    
    output$downloadDataT4table4 <- downloadHandler(
        filename = function() {
            paste0('T4_Figure_14_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet4(), file)
        }
    )
    
    
    #### T5 table
    
    tablet5 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t5(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table5 <- renderTable({
        req(tablet5())
        req(input$inputfile)
        tablet5()
    }, digits = 2)
    
    output$downloadDataT5table5 <- downloadHandler(
        filename = function() {
            paste0('T5_Figure_4_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet5(), file)
        }
    )
    
    
    #### T6 table
    
    tablet6 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t6(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table6 <- renderTable({
        req(tablet6())
        req(input$inputfile)
        tablet6()
    }, digits = 2)
    
    output$downloadDataT6table6 <- downloadHandler(
        filename = function() {
            paste0('T6_Figure_16_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet6(), file)
        }
    )
    
    
    #### T8 table
    
    tablet8 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t8(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table8 <- renderTable({
        req(tablet8())
        req(input$inputfile)
        tablet8()
    }, digits = 2)
    
    output$downloadDataT8table8 <- downloadHandler(
        filename = function() {
            paste0('T8_Figure_20_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet8(), file)
        }
    )
    
    
    #### T9 table
    
    tablet9 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t9(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table9 <- renderTable({
        req(tablet9())
        req(input$inputfile)
        tablet9()
    }, digits = 2)
    
    output$downloadDataT9table9 <- downloadHandler(
        filename = function() {
            paste0('T9_Figure_21_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet9(), file)
        }
    )
    
    
    #### T10 table
    
    tablet10 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t10(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table10 <- renderTable({
        req(tablet10())
        req(input$inputfile)
        tablet10()
    }, digits = 3)
    
    output$downloadDataT10table <- downloadHandler(
        filename = function() {
            paste0('T10_Figure_15_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet10(), file)
        }
    )
    
    
    #### T13 table
    
    tablet13 <- reactive({
        req(input$inputfile$datapath)
        table1 <- extract_t13(excel_file_path = input$inputfile$datapath)
        return(table1)
    })
    
    output$filetable_table13 <- renderTable({
        req(tablet13())
        req(input$inputfile)
        tablet13()
    }, digits = 3)
    
    output$downloadDataT13table <- downloadHandler(
        filename = function() {
            paste0('T13_Figure_22_and_24_Final', ".csv")
        },
        content = function(file) {
            write.csv(tablet13(), file)
        }
    )
    
    #### Combined by country table
    table_combined_by_country <- reactive({
        req(input$inputfile$datapath)
        combined_table <- combine_data_by_country(xls_path = input$inputfile$datapath, file_name = input$inputfile$name)
        return(combined_table)
    })
    
    output$filetable_table_combined <- renderTable({
        req(table_combined_by_country())
        req(input$inputfile)
        table_combined_by_country()
    }, digits = 3)
    
    output$downloadCombinedData <- downloadHandler(
        filename = function() {
            paste0(str_glue('{substr(input$inputfile$name, start = 1, stop = 3)}_Combined'), ".csv")
        },
        content = function(file) {
            write.csv(table_combined_by_country(), file)
        }
    )
    
}

# Run the application 
shinyApp(ui = ui, server = server)
