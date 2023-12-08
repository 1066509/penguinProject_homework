#Script containing functions to clean data

#Function to clean column names - lower case and no spaces (snake case)
clean_column_names <- function(penguins_data) {
  penguins_data %>%
    clean_names()
}

#Function to shorten the names of the species listed in the penguin data
shorten_species <- function(penguins_data) {
  penguins_data %>%
    mutate(species = case_when(
      species == "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
      species == "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
      species == "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo"
    ))
}

#Function to remove empty columns and rows
remove_empty_columns_rows <- function(penguins_data) {
  penguins_data %>%
    remove_empty(c("rows", "cols"))
}

#Function to subset the listed columns, in data set
subset_columns <- function(penguins_data, column_names) {
  penguins_data %>%
    select(all_of(column_names))
}

#Function to remove NA values from the data set
remove_NA <- function(penguins_data) {
  penguins_data %>%
    na.omit()
}

