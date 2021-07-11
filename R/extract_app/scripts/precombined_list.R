library(tidyverse)
library(dplyr)
library(readxl)

source("scripts/precombined_data.R")


precombined_figures_full_list_func <- function(xls_path){
  precombined_figures <- list(
    extract_t1_precombined_val = extract_t1_precombined(
                                    extract_t1(xls_path)
                                  ),
    extract_t2_table_1_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_one_t2(xls_path),
                                            "T2 Table 1"
                                          ),
    extract_t2_table_2_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_two_t2(xls_path),
                                            "T2 Table 2"
                                          ),
    extract_t2_table_3_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_three_t2(xls_path),
                                            "T2 Table 3"
                                          ), 
    extract_t2_table_4_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_four_t2(xls_path),
                                            "T2 Table 4"
                                          ),
    extract_t2_table_5_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_five_t2(xls_path),
                                            "T2 Table 5"
                                          ),
    extract_t2_table_6_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_six_t2(xls_path),
                                            "T2 Table 6"
                                          ),
    extract_t2_table_7_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_seven_t2(xls_path),
                                            "T2 Table 7"
                                          ),
    extract_t2_table_8_precombined_val = extract_t2_table_n_precombined(
                                            extract_table_eight_t2(xls_path),
                                            "T2 Table 8"
                                          ),
    extract_t3_precombined_val = extract_t3_precombined(
                                    extract_t3(xls_path)
                                  ),
    extract_t5_precombined_val = extract_t5_precombined(
                                    extract_t5(xls_path)
                                  ),
    extract_t6_precombined_val = extract_t6_precombined(
                                    extract_t6(xls_path)
                                  ),
    extract_t8_precombined_val = extract_t8_precombined(
                                    extract_t8(xls_path)
                                  ),
    extract_t10_precombined_val = extract_t10_precombined(
                                      extract_t10(xls_path)
                                    ),
    extract_t13_precombined_val = extract_t13_precombined(
                                      extract_t13(xls_path)
                                    )
  
  )
  
  return(precombined_figures)
  
}
