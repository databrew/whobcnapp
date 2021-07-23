library(readxl)
library(tidyverse)
library(stringr)
library(dplyr)


# =============================================================================================
# **************************** Table from Population Entitlement ******************************
# =============================================================================================


extract_pe <- function(excel_file_path){ 
  
  table <- readxl::read_excel(path = excel_file_path, sheet = 'Population Entitelment', skip = 4)
  
  names(table)[ncol(table)] <- "Notes"
  
  table$Residence <-  table$Residence %>% str_remove_all(pattern = '\r|\n')
  table$Citizenship <-  table$Citizenship %>% str_remove_all(pattern = '\r|\n')
  table$Notes <-  table$Notes %>% str_remove_all(pattern = '\r|\n')
  
  return(table)
  
}


# ====================================================================================
# USAGE: extract_pe() function example
# ====================================================================================

# extract_pe('../../../WHO_extract_excel/data_qualitative/Ireland Template.xlsx')
