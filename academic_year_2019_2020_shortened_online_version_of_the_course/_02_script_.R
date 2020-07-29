###############################################################################
###############################################################################
###############################################################################

## matrices' initialization and basic commands --------------------------------

A <- matrix(c(1, 2, 3, 4), nrow = 2,
                  ncol = 2)
      B <- matrix(c(1, 3, 2, 4), nrow = 2,
                  ncol = 2)
      B <- matrix(c(1, 2, 3, 4), nrow = 2,
                  ncol = 2, byrow = TRUE)
# only one of the arguments "nrow" and "ncol" is necessary


## manipulation with matrices -------------------------------------------------

C <- matrix(letters[1:12], nrow = 3,
            byrow = T)
          
is.matrix(C)  # TRUE
class(C)      # "matrix"
mode(C)       # "character"; data type of matrix
              # values
str(C)        # chr [1:3, 1:4] "a" "e" "i" ...
dim(C)        # c(3, 4); dimensions of matrix C

colnames(C) <- c("c1", "c2", "c3", "c4")
rownames(C) <- c("r1", "r2", "r3")
        # adds labels to columns and rows
C <- unname(C)
        # deletes the labels of columns
        # and rows
dimnames(C) <- list(
                c("r1", "r2", "r3"),
                c("c1", "c2", "c3", "c4")
               )
        # also adds labels to columns and rows

rbind(C, c("x", "x", "x", "x"))
          # adds a row of c("x", "x", "x", "x")
          # to the matrix C
cbind(C, c("x", "x", "x"))
          # adds a column of c("x", "x", "x")
          # to the matrix C
C[-1, ]   # deletes the 1-st row of the matrix C
C[, -2]   # deletes the 2-nd column
          # of the matrix C


## submatrices, indexing, addressing ------------------------------------------

C <- matrix(letters[1:12],
            nrow = 3,
            byrow = T,
            dimnames = list(
                c("r1", "r2", "r3"),
                c("c1", "c2", "c3", "c4")
            ))

C[2, 3]       # "g"; a value of the 2-nd row
              # and the 3-st column
C["r2", "c3"] # "g"; a value of the 2-nd row
              # and the 3-st column
C[1, ]        # c("a", "b", "c", "d");
              # a vector of the 1-st row of the matrix C
              # with labels

C[, 3]        # c("c", "g", "k");
              # a vector of the 3-rd column
              # of the matrix C with labels
C[c(1, 3), c(2, 4)]
              # matrix(c("b", "j", "d", "l"), 2)
              # a submatrix of the 1-st and 3-rd rows,
              # 2-nd and 4-th column of the matrix C
              # with labels
C["r2", ]     # c("e", "f", "g", "h");
              # a vector of the 2-nd row
              # of the matrix C with labels

C[dim(C)[1], dim(C)[2]]
           # "l"; a general addressing
           # of the right bottom page
C[5]       # "f"; major-column ordering
C[c(8, 9)] # c("g", "k")
C[13]      # NA
diag(C)    # c("a", "f", "k"); main diagonal
diag(C[, dim(C)[2]:1])
          # c("d", "g", "j"); opposite diagonal


## ----------------------------------------------------------------------------

## <OPTIONAL>

## matrix algebra -------------------------------------------------------------

A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

## Hadamard's product
A * B     # matrix(c(5, 12, 21, 32), 2)

## matrix product
A %*% B   # matrix(c(23, 34, 31, 46), 2)

## transposition of a matrix
t(A)      # matrix(c(1, 3, 2, 4), 2)


## </OPTIONAL>


## ----------------------------------------------------------------------------

###############################################################################

## data frames initialization and basic commands ------------------------------

mtcars
str(mtcars)
class(mtcars)          # "data.frame"
mode(mtcars)           # "list"
is.data.frame(mtcars)  # TRUE      
str(iris)
  # 'data.frame': 150 obs. of 5 variables
  # ...
dim(iris)              # c(150, 5)

data <- mtcars
colnames(data)
colnames(data) <- paste("c",
                        1:dim(data)[2],
                        sep = "_")
rownames(data) <- paste("r",
                        1:dim(data)[1],
                        sep = "_")
               # changes labels of rows and commands
head(data)     # prints out the first 6 rows
head(data, 10)
               # prints out the first 10 rows
tail(data)     # prints out the last 6 rows
tail(data, 10)
               # prints out the last 10 rows

rbind(data, rep(0, dim(data)[2]))
              # adds a row of c(0, 0, ..., 0)
              # to data.frame "data"
cbind(data, rep(0, dim(data)[1]))
              # adds a column of c(0, 0, ..., 0)
              # to data.frame "data"
data.frame(data,
           "hello" = rep(0, dim(data)[1]))
              # adds a row of c(0, 0, ..., 0)
              # with a label "hello" to data.frame
              # "data"
data[-1, ]    # removes the 1-st row of data.frame
              # "data"
data[, -1]    # removes the 1-st column of data.frame
              # "data"


## indexing, addressing -------------------------------------------------------

data[2, 3]    # 160; a value of the 2-nd row,
              # 3-rd column
data["r_2", "c_3"]
              # 160; a value given by the labels
data[1, ]     # c(21, 6, 160, 110, ...);
              # a vector of the 1-st row
              # of data frame "data" with labels
data[, 2]     # c(6, 6, 4, 6, ...);
              # a vector of the 2-nd column
              # of data frame "data" with labels
data$c_5      # c(3.90, 3.90, 3.85, 3.08, ...);
              # a vector of the 5-th column
              # of data frame "data" with labels
data$c_5[1]   # 3.9;
              # the first value of vector
              # of the 5-th column
              # of data frame "data" with labels

data[dim(data)[1], dim(data)[2]]
           # 2; a general way how to address
           # the right bottom values
           # of the data.frame
data[5]    # the 5-th column, not the major-column
           # ordering!


## columns' summaries ---------------------------------------------------------

colSums(data)
         # a vector of sums for each column
apply(data, 2, sum)
         # the same as above
colMeans(data)
         # a vector of means for each column
apply(data, 2, mean)
         # the same as above
data <- rbind(data, rep(NA, dim(data)[2]))
         # adds a row of c(NA, NA, ...)
colMeans(data)
         # c(NA, NA, ...); to avoid non-informative
         # output, we have to add an argument
         # na.rm = TRUE
colMeans(data, na.rm = TRUE)
apply(data, 2, mean, na.rm = TRUE)
         # both commands work now


## ----------------------------------------------------------------------------

###############################################################################

## lists initialization and basic commands ------------------------------------

my_list <- list("a" = c(1:10),
                "b" = mtcars,
                "c" = matrix(1:8, 2),
                "z" = "hello")
str(my_list)
class(my_list)         # "list"
mode(my_list)          # "list"
is.list(my_list)       # TRUE

names(my_list)      
names(my_list) <- LETTERS[
    1:length(my_list)
]           # changing the list's item names
      
my_list[[length(my_list) + 1]] <- c(T, F)
            # adding a vector of c(T, F)
            # to the list "my\_list"
names(my_list)[length(my_list)] <- "XY"
            # and adding a name "XY"
            # to the vector as an item


## indexing, addressing -------------------------------------------------------

my_list[[2]]  # the 2-nd item of the list
my_list[["B"]]
              # an item of the list labeled by "B"
              # of the list
              # it's the data.frame "mtcars"
              # because of the double brackets
my_list["B"]  # an item of the list labeled by "B"
              # it's still a list
              # because of the single brackets
my_list[c(2, 4)]
              # the 2-nd and 4-th item of the list
my_list$C     # an item of the list labeled by "C"
my_list[[1]][2]
              # 2; the 2-nd value of the 1-st item
              # of the list
my_list[[2]][3, 5]
              # 3.85; the 3-nd and 5-th value
              # of the 2-nd item of the list


## indexing, addressing using lapply() funcion --------------------------------

set.seed(1)
my_long_list <- lapply(
    sample(c(80:120), 100, TRUE),
    function(x) sample(
        c(50:150), x, replace = TRUE
    )
)   # a list of vectors of different lengths
    # populated by random numbers
    # from range (80, ..., 100)

lapply(my_long_list, "[[", 14)
    # prints out the 14-th value of each item
    # of the list
    # -- this is handy since otherwise
    # it would require to use a for loop


## items' summaries -----------------------------------------------------------

lapply(my_long_list, mean)
    # printing out a mean of all
    # values for each item of the list

lapply(my_long_list, length)
    # printing out a length
    # for each item of the list


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





