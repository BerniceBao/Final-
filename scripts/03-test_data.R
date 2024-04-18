#### Preamble ####
# Purpose: Tests if the simulated data is within the required bounds
# Author: Bernice Bao
# Date: Apr 16 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 00-simulate_data.R

#### Workspace setup ####
library(tidyverse)

#### Test simulated final data ####

data = read_csv("inputs/data/simulated_final_data.csv")

# Test 1: Check if Population values are non-negative
if (all(simulated_final_data$Population >= 0)) {
  print("All population values are non-negative.")
} else {
  print("Some population values are negative!")
}

# Test 2: Check if Median Income values are within a reasonable range
if (all(simulated_final_data$Income >= 0)) {
  print("All median income values are non-negative.")
} else {
  print("Some median income values are negative!")
}

# Test 3: Check if Number of Free Wi-Fi spots are non-negative
if (all(simulated_final_data$Number_of_free_wifi >= 0)) {
  print("All number of free Wi-Fi values are non-negative.")
} else {
  print("Some number of free Wi-Fi values are negative!")
}

# Test 4: Check if all Population values are integers
if (all.equal(simulated_final_data$Population, as.integer(simulated_final_data$Population))) {
  print("All population values are integers.")
} else {
  print("Some population values are not integers!")
}

# Test 5: Check if Median Income values are within a reasonable range (e.g., not exceeding $200,000)
if (all(simulated_final_data$Income <= 200000)) {
  print("All median income values are within a reasonable range.")
} else {
  print("Some median income values exceed the reasonable range!")
}

# Test 6: Check if Ward Numbers are unique
if (length(unique(simulated_final_data$WardNumber)) == nrow(simulated_final_data)) {
  print("Ward numbers are unique.")
} else {
  print("There are duplicate ward numbers!")
}

# Test 7: Check if the range of Number of Free Wi-Fi is reasonable (e.g., between 0 and 50)
if (all(simulated_final_data$Number_of_free_wifi >= 0 & simulated_final_data$Number_of_free_wifi <= 50)) {
  print("Number of free Wi-Fi values are within a reasonable range.")
} else {
  print("Some number of free Wi-Fi values are outside the reasonable range!")
}

# Test 8: Check if Population values are positive (non-zero)
if (all(simulated_final_data$Population > 0)) {
  print("All population values are positive (non-zero).")
} else {
  print("Some population values are zero or negative!")
}

# Test 9: Check if Median Income values are not too small (e.g., above $10,000)
if (all(simulated_final_data$Income > 10000)) {
  print("All median income values are above $10,000.")
} else {
  print("Some median income values are too small!")
}

# Test 10: Check if Ward Numbers start from 1 and are consecutive
if (all(simulated_final_data$WardNumber == 1:nrow(simulated_final_data))) {
  print("Ward numbers start from 1 and are consecutive.")
} else {
  print("Ward numbers are not in the expected sequence!")
}

# Test 11: Check if the median income values are sorted in ascending order
if (identical(simulated_final_data$Income, sort(simulated_final_data$Income))) {
  print("Median income values are sorted in ascending order.")
} else {
  print("Median income values are not sorted in ascending order!")
}

# Test 12: Check if all Population values are non-zero
if (all(simulated_final_data$Population != 0)) {
  print("All population values are non-zero.")
} else {
  print("Some population values are zero!")
}

# Test 13: Check if the range of Number of Free Wi-Fi is reasonable (e.g., not exceeding 100)
if (all(simulated_final_data$Number_of_free_wifi <= 100)) {
  print("Number of free Wi-Fi values are within a reasonable range.")
} else {
  print("Some number of free Wi-Fi values exceed the reasonable range!")
}
