
# Comments in R start with a '#'

# 1. Variables and Data Types
# Assign values to variables
x <- 5  # Numeric
y <- "Hello, R!"  # Character
z <- TRUE  # Logical (Boolean)

# Print variables
print(x)
print(y)
print(z)

# 2. Basic Operations
a <- 10
b <- 3

# Arithmetic operations
addition <- a + b
subtraction <- a - b
multiplication <- a * b
division <- a / b
remainder <- a %% b  # Modulo

# Print the results
print("Addition: ")
print(addition)
print("Subtraction: ")
print(subtraction)
print("Multiplication: ")
print(multiplication)
print("Division: ")
print(division)
print("Modulo: ")
print(remainder)

# 3. Functions
# Define a function
square <- function(x) {
  return(x^2)
}

# Call the function
result <- square(5)
print("Square of 5: ")
print(result)

# 4. Data Structures
# Vector
my_vector <- c(1, 2, 3, 4, 5)

# List
my_list <- list(1, "apple", TRUE)

# Data Frame
data <- data.frame(Name = c("Alice", "Bob", "Charlie"),
                  Age = c(25, 30, 22))

# Access elements
print("Vector:")
print(my_vector)
print("List:")
print(my_list)
print("Data Frame:")
print(data)

# 5. Conditional Statements
# If-else statement
if (x > 0) {
  print("x is positive")
} else {
  print("x is non-positive")
}

# 6. Loops
# For loop
for (i in 1:5) {
  print(paste("Iteration", i))
}

# While loop
j <- 1
while (j <= 5) {
  print(paste("While iteration", j))
  j <- j + 1
}

# 7. Data Visualization
# Install and load a plotting library (e.g., ggplot2)
# install.packages("ggplot2")
library(ggplot2)

# Create a simple scatter plot
data_plot <- data.frame(x = 1:5, y = c(2, 4, 1, 3, 5))
ggplot(data = data_plot, aes(x = x, y = y)) +
  geom_point()

# 8. Packages and Libraries
# Install and load additional packages as needed for your specific tasks

# For more advanced data analysis, explore packages like dplyr, tidyr, and more.

# 9. File I/O
# Read and write data from/to files using functions like read.csv and write.csv.

# 10. Error Handling
# Use try-catch blocks for error handling.

# 11. More Advanced Concepts
# Explore advanced topics like data manipulation, statistical analysis, and machine learning with R.

