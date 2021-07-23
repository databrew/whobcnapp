library(readxl)
library(tidyverse)
library(stringr)
library(dplyr)


# =============================================================================================
# ********************************** Table from User Charges **********************************
# =============================================================================================


extract_uc <- function(excel_file_path){ 
  
  table <- readxl::read_excel(path = excel_file_path, sheet = "PopEntitlement_Changes", skip = 2)
  table$Year <- as.integer(table$Year)
  return(table)
  
}


# ====================================================================================
# USAGE: extract_uc() function example
# ====================================================================================

# extract_uc('../../../WHO_extract_excel/data_qualitative/Poland Template.xlsx')
