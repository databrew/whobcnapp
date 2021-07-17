library(readxl)
library(tidyverse)
library(stringr)
library(dplyr)
library(purrr)

fig4 <- readxl::read_excel(path = '../WHO_extract_excel/Ukraine Template.xlsx', 
                           sheet = "PopEntitlement_Changes", skip = 2) 

fig4 <- fig4 %>% select(-Notes)

write.csv(fig4, "fig4.csv")


fig7 <- readxl::read_excel(path = '../WHO_extract_excel/Ukraine Template.xlsx', 
                           sheet = "Population Entitelment", skip = 4, n_max = 1)

fig7$Residence <-  fig7$Residence %>% str_remove_all(pattern = '\r|\n')
fig7$Citizenship <-  fig7$Citizenship %>% str_remove_all(pattern = '\r|\n')

fig7 <- fig7 %>% select(-c(ncol(.))) 

write_csv(fig7, "fig7.csv")



fig10 <- readxl::read_excel(path = '../WHO_extract_excel/Ukraine Template.xlsx', 
                           sheet = "UC_Changes", skip = 2)


write.csv(fig10, "fig10.csv")


fig13 <- readxl::read_excel(path = '../WHO_extract_excel/Ukraine Template.xlsx', 
                           sheet = "User Charges", skip = 2) %>% select(1:10)

fig13_names <- c('Service', 
                 'Service Category', 
                 'User Charge Type None', 
                 'User Charge Type Full price',
                 'User Charge Type FC',
                 'User Charge Type PC',
                 'User Charge Type RP',
                 'User Charge Type DE',
                 'User Charge Type BB',
                 'User Charge Type EB')

names(fig13) <- fig13_names
write.csv(fig13, "fig13.csv")

