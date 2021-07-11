library(tidyverse)
library(dplyr)
library(readxl)

source(file = 'scripts/read_data_t1.R')
source(file = 'scripts/read_data_t2.R')
source(file = 'scripts/read_data_t3.R')
source(file = 'scripts/read_data_t5.R')
source(file = 'scripts/read_data_t6.R')
source(file = 'scripts/read_data_t8.R')
source(file = 'scripts/read_data_t10.R')
source(file = 'scripts/read_data_t13.R')

# T1
# extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')

extract_t1_precombined <- function(extracted_t1_sheet) {
  
  extracted_t1_sheet <- extracted_t1_sheet %>% pivot_longer(cols = 2:4, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T1")
  
  return(extracted_t1_sheet)
}

# USAGE:
# extract_t1_precombined(extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))


# T2
# TODO extract_t2_table8_precombined_N merge into one function: UPDATE: DONE!

extract_t2_table_n_precombined <- function(extract_t2_table_sheet, label_title) {
  # extract_t2_table8_sheet <- extract_table_eight_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
  extract_t2_table_sheet <- extract_t2_table_sheet$df
  
  extract_t2_table_sheet <- extract_t2_table_sheet %>% pivot_longer(cols = 2:length(extract_t2_table_sheet), names_to = "Year", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = label_title)
  
  
  return(extract_t2_table_sheet)
}

# USAGE:
# extract_t2_table_n_precombined(
#   extract_table_eight_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'),
#   "T2 Table 8"
# )



# T3
# extract_t3('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')

extract_t3_precombined <- function(extracted_t3_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t3_sheet <- extracted_t3_sheet %>% pivot_longer(cols = 2, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T3")
  
  return(extracted_t3_sheet)
}

# extract_t3_precombined(extract_t3('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))


# T5
# extract_t5('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')

extract_t5_precombined <- function(extracted_t5_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t5_sheet <- extracted_t5_sheet %>% pivot_longer(cols = 3, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T5")
  
  return(extracted_t5_sheet)
}

# extract_t5_precombined(
#   extract_t5('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
# )


# T6
# extract_t6('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx') 

extract_t6_precombined <- function(extracted_t6_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t6_sheet <- extracted_t6_sheet %>% pivot_longer(cols = 3, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T6")
  
  return(extracted_t6_sheet)
}

# extract_t6_precombined(
#   extract_t6('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
# )

#T8
# extract_t8('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx') 

extract_t8_precombined <- function(extracted_t8_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t8_sheet <- extracted_t8_sheet %>% pivot_longer(cols = 3, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T8")
  
  return(extracted_t8_sheet)
}

# extract_t8_precombined(
#   extract_t8('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
# )

# T10 
# extract_t10('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx') 

extract_t10_precombined <- function(extracted_t10_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t10_sheet <- extracted_t10_sheet %>% pivot_longer(cols = 2:5, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T10")
  
  return(extracted_t10_sheet)
}

# extract_t10_precombined(
#   extract_t10('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
# )


# T13
# extract_t13('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx') 

extract_t13_precombined <- function(extracted_t13_sheet) {
  # extracted_t1_sheet <- extract_t1('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
  
  extracted_t13_sheet <- extracted_t13_sheet %>% pivot_longer(cols = 2:3, names_to = "Indicator", values_to = "values") %>%
    mutate(values = round(as.numeric(values), 3)) %>% 
    mutate(label = "T13")
  
  return(extracted_t13_sheet)
}

# extract_t13_precombined(
#   extract_t13('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx')
# )

# ===================================================================================================
# table 1
# extract_table_one_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table1_precombined <- function(extract_t2_table1_sheet) {
#   # extract_t2_table1_sheet <- extract_table_one_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table1_sheet <- extract_t2_table1_sheet$df
#   
#   extract_t2_table1_sheet <- extract_t2_table1_sheet %>% pivot_longer(cols = 2:length(extract_t2_table1_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 1")
#   
#   return(extract_t2_table1_sheet)
# }
# 
# # USAGE:
# extract_t2_table1_precombined(extract_table_one_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# # table 2
# extract_table_two_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table2_precombined <- function(extract_t2_table2_sheet) {
#   # extract_t2_table2_sheet <- extract_table_two_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table2_sheet <- extract_t2_table2_sheet$df
#   
#   extract_t2_table2_sheet <- extract_t2_table2_sheet %>% pivot_longer(cols = 2:length(extract_t2_table2_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 2")
#   
#   return(extract_t2_table2_sheet)
# }
# 
# # USAGE:
# extract_t2_table2_precombined(extract_table_two_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# 
# # table 3
# extract_table_three_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table3_precombined <- function(extract_t2_table3_sheet) {
#   # extract_t2_table3_sheet <- extract_table_three_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table3_sheet <- extract_t2_table3_sheet$df
#   
#   extract_t2_table3_sheet <- extract_t2_table3_sheet %>% pivot_longer(cols = 2:length(extract_t2_table3_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 3")
#   
#   return(extract_t2_table3_sheet)
# }
# 
# # USAGE:
# extract_t2_table3_precombined(extract_table_three_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# # table 4
# extract_table_four_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table4_precombined <- function(extract_t2_table4_sheet) {
#   # extract_t2_table4_sheet <- extract_table_four_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table4_sheet <- extract_t2_table4_sheet$df
#   
#   extract_t2_table4_sheet <- extract_t2_table4_sheet %>% pivot_longer(cols = 2:length(extract_t2_table4_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 4")
#   
#   return(extract_t2_table4_sheet)
# }
# 
# # USAGE:
# extract_t2_table4_precombined(extract_table_four_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# # table 5
# extract_table_five_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table5_precombined <- function(extract_t2_table5_sheet) {
#   # extract_t2_table5_sheet <- extract_table_five_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table5_sheet <- extract_t2_table5_sheet$df
#   
#   extract_t2_table5_sheet <- extract_t2_table5_sheet %>% pivot_longer(cols = 2:length(extract_t2_table5_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 5")
#   
#   return(extract_t2_table5_sheet)
# }
# 
# # USAGE:
# extract_t2_table5_precombined(extract_table_five_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# 
# # table 6
# extract_table_six_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table6_precombined <- function(extract_t2_table6_sheet) {
#   # extract_t2_table6_sheet <- extract_table_six_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table6_sheet <- extract_t2_table6_sheet$df
#   
#   extract_t2_table6_sheet <- extract_t2_table6_sheet %>% pivot_longer(cols = 2:length(extract_t2_table6_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 6")
#   
#   return(extract_t2_table6_sheet)
# }
# 
# # USAGE:
# extract_t2_table6_precombined(extract_table_six_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# # table 7
# extract_table_seven_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table7_precombined <- function(extract_t2_table7_sheet) {
#   # extract_t2_table7_sheet <- extract_table_seven_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table7_sheet <- extract_t2_table7_sheet$df
#   
#   extract_t2_table7_sheet <- extract_t2_table7_sheet %>% pivot_longer(cols = 2:length(extract_t2_table7_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 7")
#   
#   return(extract_t2_table7_sheet)
# }
# 
# # USAGE:
# extract_t2_table7_precombined(extract_table_seven_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 
# 
# # table 8
# extract_table_eight_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
# 
# extract_t2_table8_precombined <- function(extract_t2_table8_sheet) {
#   # extract_t2_table8_sheet <- extract_table_eight_t2(excel_file_path = "../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx")
#   extract_t2_table8_sheet <- extract_t2_table8_sheet$df
#   
#   extract_t2_table8_sheet <- extract_t2_table8_sheet %>% pivot_longer(cols = 2:length(extract_t2_table8_sheet), names_to = "Year", values_to = "values") %>%
#     mutate(values = round(as.numeric(values), 3)) %>% 
#     mutate(label = "T2 Table 8") %>%
#     rename(
#       `service` = `indicator`
#     )
#     
#   
#   return(extract_t2_table8_sheet)
# }
# 
# # USAGE:
# extract_t2_table8_precombined(extract_table_eight_t2('../../../WHO_extract_excel/OneDrive_1_07.06.2021/Quantitative files/appendix tables/LVA_Appendix_tables_Aug 2020.xlsx'))
# 

