#' Conformity check
#'
#' Check that the data conforms to the requirements
#' @param input_file A path to an excel file 
#' @return a list
#' @noRd
#' @import readxl
#' @import dplyr
#' @export

conformity_check <- function(input_file){
  
  # Check that the name is formatted as "ISO_Appendix_tables.xlsx"
  ok <- grepl('_Appendix_tables.xlsx', input_file)
  if(!ok){
    stop('The file should be named "ISO_Appendix_tables.xlsx", where "ISO" is the 3 letter ISO code of the country in question.')
  }
  
  # Check that there is an ISO code
  iso <- unlist(strsplit(input_file, '_Appendix_tables.xlsx'))
  iso <- substr(iso, (nchar(iso)-2), nchar(iso))
  ok <- iso == toupper(iso)
  if(!ok){
    stop('The file should be named "ISO_Appendix_tables.xlsx", where "ISO" is the 3 letter ISO code of the country in question. The 3 letter country code must be capitalized.')
  }
  
  # Do random checks on formatting
  suppressMessages({
    fig1 <- readxl::read_excel(input_file, sheet = 2, skip = 0)
  })
  
  
  ok <- as.character(fig1[1,1]) == '*Figure 1:'
  if(!ok){
    stop('Cell 2A should be named "*Figure 1:"')
  }
  
  ok <- as.character(fig1[1,2]) == 'Out-of-pocket payments for health care as a share of household consumption by quintile'
  if(!ok){
    stop('Cell 2B should be named "Out-of-pocket payments for health care as a share of household consumption by quintile"')
  }
  
  # (More checks to come once final formatting is finished)
  
  message('The file conforms. OK to go on.')
  return(TRUE)
}
