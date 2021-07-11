library(tidyverse)
library(dplyr)

source('scripts/precombined_list.R')


combine_data_by_country <- function(xls_path, file_name) {
  
precombined_figures_full_list <- precombined_figures_full_list_func(xls_path = xls_path)

# Initialization 
t2 <- precombined_figures_full_list$extract_t2_table_1_precombined_val %>%
        full_join(precombined_figures_full_list$extract_t2_table_2_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_3_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_4_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_5_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_6_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_7_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service')) %>% 
        full_join(precombined_figures_full_list$extract_t2_table_8_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'service' = 'service'))
t13 <- precombined_figures_full_list$extract_t13_precombined_val %>%
  drop_na(values) %>%
  mutate(Year = as.character(Year))
t10 <- precombined_figures_full_list$extract_t10_precombined_val %>% mutate(Year = as.character(Year))


# Create a merged data frame
merged_data <- precombined_figures_full_list$extract_t1_precombined_val %>%
    full_join(t2, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label')) %>%
    full_join(precombined_figures_full_list$extract_t3_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator')) %>% 
    full_join(precombined_figures_full_list$extract_t5_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator', 'quintile' = 'Income Quintile')) %>%
    full_join(precombined_figures_full_list$extract_t6_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator', 'quintile' = 'Income Quintile')) %>%
    full_join(precombined_figures_full_list$extract_t8_precombined_val, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator', 'service' = 'Service')) %>%
    full_join(t10, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator')) %>%
    full_join(t13, by = c('Year' = 'Year', 'values' = 'values', 'label' = 'label', 'Indicator' = 'Indicator')) %>%
    select(Year, quintile, Indicator, service, values, label) %>%
    mutate(country = substr(file_name, start = 1, stop = 3)) %>%
    mutate(real_value = NA) %>%
    mutate(currency = NA) %>%
    mutate(conv_year = NA)


return(merged_data)

}
