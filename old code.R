
data <- reactive({
  # query to database that reacts to the company choosen
  dbGetQuery(con,sqlInterpolate(ANSI(),
                                q_main_kpi,
                                vat = input$company_select)) %>%
    # inline accounts become columns/ become features
    spread(account,value) %>%
    # all NA replace by zero. NA arise from original information everytime a number is no aplicable
    replace(., is.na(.),0) %>%
    # calculate kpi
    mutate(
      kpi0001 = ((A00125 - A00124 - A00119 - A00117) + (A00156 - A00151 - A00149))/-A00001 * 365,
      kpi0005 = A00139/A00127,
      kpi0006 = A00131/A00127,
      kpi0007 = (A00001+A00006)/A00001,
      kpi0008 = A00018/A00001,
      kpi0009 = A00018/(A00126-A00156),
      wc = (A00125 - A00124 - A00119 - A00117) + (A00156 - A00151 - A00149))%>%
    filter(if (input$interim == FALSE) month == 12 else month == month ) %>% 
    filter(year >= min(input$year_slider) & year <= max(input$year_slider)) %>% 
    mutate(date = ymd(paste0(year,"-",month,"-01"))) %>%
    select(-vat_number, -year, -month) %>%
    select(date,everything()) %>%
    arrange(desc(date))
})




