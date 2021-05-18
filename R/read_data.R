#' Read data
#'
#' Read a standard format MS Excel workbook into a list
#' @param input_file A path to an excel file 
#' @return a list
#' @import readxl
#' @import dplyr
#' @export

read_data <- function(input_file){
  # Prepare an "out" object for returning
  out <- list()
  # Capture the country from the file name
  iso <- unlist(strsplit(input_file, '_Appendix_tables.xlsx'))
  iso <- substr(iso, (nchar(iso)-2), nchar(iso))
  # Read in data
  suppressMessages({
    fig1 <- readxl::read_excel(input_file, sheet = 2, skip = 2)
  })
  # Subset to only columns / rows of relevance
  fig1 <- fig1[1:6, 1:7]
  # Define name for the first column
  names(fig1)[1] <- 'quintile'
  # Transform from character to numeric
  for(j in 2:ncol(fig1)){
    fig1[,j] <- as.numeric(unlist(fig1[,j]))
  }
  # Transform from wide to long
  fig1 <- fig1 %>%
    tidyr::gather(year, value, names(fig1)[2]:names(fig1)[ncol(fig1)])
  # Relevel quintile
  fig1$quintile <- factor(fig1$quintile, levels = c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'))
  
  # Add in the country
  fig1$iso <- iso
  # Add the indicator
  fig1$indicator <- 'Out-of-pocket payments for health care as a share of household consumption by quintile'
  out$fig1 <- fig1
  
  # Figure 2
  suppressMessages({
    fig2 <- readxl::read_excel(input_file, sheet = 2, skip = 12, n_max = 7)
  })
  # Change name of first column
  names(fig2)[1] <- 'grp'
  # Transform from character to numeric
  for(j in 2:ncol(fig2)){
    fig2[,j] <- as.numeric(unlist(fig2[,j]))
  }
  # Tidy up names
  q_part <- rep(c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'), 6)
  y_part <- rep(c(2005, 2010, 2015, 2016, 2017, 2018), each = 6)
  new_names <- paste0(q_part, '_', y_part)
  names(fig2)[2:ncol(fig2)] <- new_names
  # Transform from wide to long
  fig2 <- fig2 %>%
    tidyr::gather(year, value, names(fig2)[2]:names(fig2)[ncol(fig2)])
  # Split the "year" column into its respective parts
  fig2 <- fig2 %>%
    mutate(quintile = unlist(lapply(strsplit(year, split = '_'), function(x){x[1]}))) %>%
    mutate(year = unlist(lapply(strsplit(year, split = '_'), function(x){x[2]})))
  # Relevel quintile
  fig2$quintile <- factor(fig2$quintile, levels = c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'))
  fig2$iso <- iso
  fig2$indicator <- 'Breakdown of out-of-pocket spending by type of health care and consumption quintile'
  out$fig2 <- fig2
  
  # Figure 3
  suppressMessages({
    fig3 <- readxl::read_excel(input_file, sheet = 2, skip = 21, n_max = 7)
  })
  # Modify first name
  names(fig3)[1] <- 'grp'
  # Transform from character to numeric
  for(j in 2:ncol(fig3)){
    fig3[,j] <- as.numeric(unlist(fig3[,j]))
  }
  # Transform from wide to long
  fig3 <- fig3 %>%
    tidyr::gather(year, value, names(fig3)[2]:names(fig3)[ncol(fig3)])
  fig3$indicator <- 'Share of households at risk of impoverishment after out-of-pocket payments and Share of households with catastrophic out-of-pocket payments (%)'
  fig3$iso <- iso
  out$fig3 <- fig3
  
  # Figure 3 absolute
  suppressMessages({
    fig3a <- readxl::read_excel(input_file, sheet = 2, skip = 31, n_max = 7)
  })
  # Modify first name
  names(fig3a)[1] <- 'grp'
  # Transform from character to numeric
  for(j in 2:ncol(fig3a)){
    fig3a[,j] <- as.numeric(unlist(fig3a[,j]))
  }
  # Transform from wide to long
  fig3a <- fig3a %>%
    tidyr::gather(year, value, names(fig3a)[2]:names(fig3a)[ncol(fig3a)])
  fig3a$indicator <- 'Households at risk of impoverishment after out-of-pocket payments - Absolute levels'
  fig3a$iso <- iso
  out$fig3a <- fig3a
  
  # Figure 4
  # Read in data
  suppressMessages({
    fig4 <- readxl::read_excel(input_file, sheet = 2, skip = 40, n_max = 6)
  })
  # Define name for the first column
  names(fig4)[1] <- 'quintile'
  # Transform from character to numeric
  for(j in 2:ncol(fig4)){
    fig4[,j] <- as.numeric(unlist(fig4[,j]))
  }
  # Transform from wide to long
  fig4 <- fig4 %>%
    tidyr::gather(year, value, names(fig4)[2]:names(fig4)[ncol(fig4)])
  # Relevel quintile
  fig4$quintile <- factor(fig4$quintile, levels = c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'))
  # Add in the country
  fig4$iso <- iso
  # Add the indicator
  fig4$indicator <- 'Share of households with catastrophic spending by consumption quintile'
  out$fig4 <- fig4
  
  # Fig 5
  suppressMessages({
    fig5 <- readxl::read_excel(input_file, sheet = 2, skip = 57, n_max = 7)
  })
  # Change name of first column
  names(fig5)[1] <- 'grp'
  # Transform from character to numeric
  for(j in 2:ncol(fig5)){
    fig5[,j] <- as.numeric(unlist(fig5[,j]))
  }
  # Tidy up names
  q_part <- rep(c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'), 6)
  y_part <- rep(c(2005, 2010, 2015, 2016, 2017, 2018), each = 6)
  new_names <- paste0(q_part, '_', y_part)
  names(fig5)[2:ncol(fig5)] <- new_names
  # Transform from wide to long
  fig5 <- fig5 %>%
    tidyr::gather(year, value, names(fig5)[2]:names(fig5)[ncol(fig5)])
  # Split the "year" column into its respective parts
  fig5 <- fig5 %>%
    mutate(quintile = unlist(lapply(strsplit(year, split = '_'), function(x){x[1]}))) %>%
    mutate(year = unlist(lapply(strsplit(year, split = '_'), function(x){x[2]})))
  # Relevel quintile
  fig5$quintile <- factor(fig5$quintile, levels = c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total'))
  fig5$iso <- iso
  fig5$indicator <- 'Breakdown of catastrophic spending by type of health care by quintile, all years'
  out$fig5 <- fig5
  
  # Read T2 ################################
  
  # Mean annual per capita OOP by income quintile
  suppressMessages({
    t2a <- readxl::read_excel(input_file, sheet = 4, skip = 2, n_max = 7)
    # Fix column names
    names(t2a) <- c('quintile', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    t2a <- t2a %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    t2a$indicator <- 'Mean annual per capita OOP by income quintile'
  })
  out$t2a <- t2a
  
  # Mean annual per capita OOP by structure
  suppressMessages({
    t2b <- readxl::read_excel(input_file, sheet = 4, skip = 10, n_max = 7)
    # Fix column names
    names(t2b) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    t2b <- t2b %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    t2b$indicator <- 'Mean annual per capita OOP by structure'
  })
  out$t2b <- t2b
  
  # Additional (quintile data, lines 19 onwards)
  quintile_data <- list()
  # Share of total OOP spending by structure
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 18, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- 'Total population'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 26, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- 'Poorest'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 34, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- '2nd'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 42, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- '3rd'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 50, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- '4th'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  
  suppressMessages({
    tx <- readxl::read_excel(input_file, sheet = 4, skip = 58, n_max = 7)
    # Fix column names
    names(tx) <- c('grp', '2005', '2010', '2015', '2016', '2017', '2018')
    # Transform from wide to long
    tx <- tx %>%
      tidyr::gather(year, value, `2005`:`2018`)
    # Add the indicator
    tx$indicator <- 'Mean annual per capita OOP by structure'
    # Add the quintile
    tx$quintile <- 'Richest'
  })
  quintile_data[[length(quintile_data) + 1]] <- tx
  
  # Bind together quintile data
  t2c <- bind_rows(quintile_data)
  
  # Relevel quintile
  t2c$quintile <- factor(t2c$quintile, levels = c('Poorest', '2nd', '3rd', '4th', 'Richest', 'Total population'))
  
  
  # Pop into list
  out$t2c <- t2c
  
  # Spit back processed data
  return(out)
}
