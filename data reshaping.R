# 1. Transpose a matrix

# Create a matrix with elements 1 to 9 arranged in 3 rows
a <- matrix(c(1:9), byrow = TRUE, nrow = 3)
# Print the matrix
print(a)
# Transpose the matrix
b <- t(a)
# Print the transposed matrix
print(b)

# 2. Join rows and columns of data

# Create vectors of city, state, and zip codes
city <- c("A", "B", "C")
state <- c("AA", "BB", "CC")
zip <- c(1, 2, 3)

# Bind the vectors into a matrix (data.frame)
a <- cbind(city, state, zip)
# Print the matrix
print(a)

# Create another row of data
n <- data.frame(
  city = c("D"),
  state = c("DD"),
  zip = c(4),
  stringsAsFactors = FALSE
)

# Bind the new row to the existing matrix
aa <- rbind(a, n)
# Print the resulting matrix
print(aa)

# 3. Merge data frames

# Create two data frames with a single column
a <- data.frame(a = c("aaaa"))
b <- data.frame(a = c("bbbb"))

# Merge the data frames
x <- merge(a, b, all = TRUE)
# Print the resulting data frame
print(x)
