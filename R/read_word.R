sample_data <- read_docx("../../../../Desktop/NULP/3_Third_course | Term5/Соціальна діагностика/lab2/lab_2 — копия.docx")

content <- docx_summary(sample_data)

content %>% filter(content_type == "table cell")


table_cells <- content %>% filter(content_type == "table cell")
table_data <- table_cells %>% filter(!is_header) %>% select(row_id, cell_id, text)

# split data into individual columns
splits <- split(table_data, table_data$cell_id)
splits <- lapply(splits, function(x) x$text)

# combine columns back together in wide format
table_result <- bind_cols(splits)

# get table headers
cols <- table_cells %>% filter(is_header)
names(table_result) <- cols$text
