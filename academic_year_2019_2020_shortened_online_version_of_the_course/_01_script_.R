###############################################################################
###############################################################################
###############################################################################

## hello world ----------------------------------------------------------------

print("hello world")


## ----------------------------------------------------------------------------

###############################################################################

## an usage of help -----------------------------------------------------------

help(print)
?print
???print  # fulltext searching through the help files


## a real number value --------------------------------------------------------

5; -13.8; 4.5578e15
is.numeric(-13.8)   # TRUE
class(-13.8)        # "numeric"
class(Inf)          # "numeric"


## an integer -----------------------------------------------------------------

5L; 13L; -5L
is.integer(-13L)   # TRUE
class(-13L)        # "integer"
is.integer(-13)    # FALSE
class(-13)         # "numeric"

x <- 5L
class(x)           # "integer"
x <- as.numeric(x)
class(x)           # "numeric"


## a logical value ------------------------------------------------------------

TRUE; FALSE; T; F
is.logical(TRUE)     # TRUE
class(FALSE)         # "logical"
class("TRUE")        # "character"
class(T)             # "logical"
class(F)             # "logical"


## a string -------------------------------------------------------------------

"hello"; 'xweiwogw23425ng'; ""
is.character("ahoj")  # TRUE
class("blah blah")      # "character"
class("123")          # "character"
class(123)            # "numeric"
is.numeric(Inf)       # TRUE
is.numeric("Inf")     # FALSE

x <- 123
class(x)              # "numeric"
x <- as.character(x)
class(x)              # "character"


## NA, NULL, Not a Number -----------------------------------------------------

log(-1)          # NaN
is.na(NaN)       # TRUE
is.nan(NA)       # FALSE
is.nan(1 / 0)    # FALSE
1 / 0            # Inf


## values assigning -----------------------------------------------------------

x = 5

# or
x <- 5
5 -> x     # the same as above

# or
assign("x", 5)  # equivalent to x <- 5 or x = 5


## ----------------------------------------------------------------------------

###############################################################################

## vectors --------------------------------------------------------------------

###############################################################################

## vector initialization and basic commands -----------------------------------

c()          # an empty vector
length(c())  # 0
c(3, 1, 2)   # a vector of length 3 and values 3, 1, 2
c("a", "d")  # a vector of length 2 and values "a", "d"
c(c(3, 1, 2), 4) # a vector of values 3, 1, 2, 4
c(3, 1, 2, 4)    # the same as above


x <- c(3, 1, 2)
length(x)       # 3
y <- 1
z <- c(2)
w <- c(5, 7)
x <- c(x, y)    # a vector x extended
                  # by a value y
w <- c(w, z)    # a vector w extended
                # by a vector z
c <- c(1, 2, 3)
c               # both a vector
                # and a function
                # could have the same name "c"
                # in one R session


## vectors of characters ------------------------------------------------------

x <- c(3, 1, 2)
y <- c("a", "b", "c")
names(x) <- y    # values of vector x
                   # are named using y
x
unname(x)        # names of the vector x
                 # are deleted
setNames(x, y)   # again, values of the vector x
                 # are named using y

## subvectors, indexing, addressing -------------------------------------------

x <- c(4, 2, 6, -3)
x[1]            # 4
x[1:2]          # c(4, 2)
x[5]            # NA
x[length(x)]    # -3
x[c(1, 3, 4)]   # c(4, 6, -3)
x[length(x):1]  # c(-3, 6, 2, 4)
rev(x)          # the same as above,
                # c(-3, 6, 2, 4)


x <- c(4, 2, 6, -3)
x[1]            # 4
x[1:2]          # c(4, 2)
x[5]            # NA
x[length(x)]    # -3
x[c(1, 3, 4)]   # c(4, 6, -3)
x[length(x):1]  # c(-3, 6, 2, 4)
rev(x)          # the same as above,
                # c(-3, 6, 2, 4)


## logical vectors ------------------------------------------------------------

y <- c(TRUE, TRUE, FALSE, TRUE) # logical
                                # vector
x <- c(3, 1, 2, 5)
x[y]                 # (sub)vector c(3, 1)
x[c(F, T, F, T)]     # subvector c(1, 5)

z <- c("R", "G", "E", "F", "I")
z[c(T, F)]    # it picks only values
              # with even indices,
              # i. e. "R", "E", "I"
              # or in other words, a vector of
              # c("R", "E", "I")


## factors --------------------------------------------------------------------

x <- factor(
    c("male", "female", "male", "male")
)        # an order of the levels (categories)
         # is apriori alphabetical
x <- factor(
    c("male", "female", "male", "male"),
    levels = c("male", "female")
)        # we can manage the order
         # of the levels (categories)

table(x)    # x
            # male  female
            #    3       1


## aritmetické operace --------------------------------------------------------

2 + 3                   # 5
15 + 25 + 35            # 75
c(1, 2) + c(10, 20)     # c(11, 22)

12 * 3                  # 36
35 * 25 * 15            # 13125
c(12, 25) * c(3, 6)     # c(36, 150)

12 / 3                  # 4
45 / 5 / 3              # 3
c(12, 25) / c(3, 5)     # c(4, 5)

2 ^ 3                   # 8
2 ** 3                  # 8; Python-like notace
4 ^ 3 ** 2              # 262144
4 ^ (3 ** 2)            # 262144
(4 ^ 3) ** 2            # 4096
c(25, 36) ^ 0.5         # c(5, 6);
c(5, 3) ^ c(2, 3)       # c(25, 27)
c(5, 3) ** c(2, 3)      # c(25, 27)

12 %% 3                 # 0
10 %% 3                 # 1
10 %% -3                # -2
5 %% 0                  # NaN; division by zero
17 %% 23                # 17

12 %/% 3                   # 4
10 %/% 3                   # 3
10 %/% -3                  # -2
5 %/% 0                    # Inf
17 %/% 23                  # 0
23 %/% 17                  # 1
17 %/% 5                   # 3; 
(17 - 17 %% 5) / 5         # 3; 
(17 %/% 5) * 5 + (17 %% 5) # 17


## logical operations ---------------------------------------------------------

c(FALSE, FALSE, TRUE, TRUE) &
c(FALSE, TRUE, FALSE, TRUE)
    # c(FALSE, FALSE, FALSE, TRUE)

c(FALSE, FALSE, TRUE, TRUE) |
c(FALSE, TRUE, FALSE, TRUE)
    # c(FALSE, TRUE, TRUE, TRUE)

! TRUE              # FALSE
! 2 > 3             # TRUE 

all(c(3 > 2, 7 %% 3 == 1, 1 == 0))  # FALSE
all(c(3 > 2, 7 %% 3 == 1, 1 >= 0))  # TRUE

any(c(3 < 2, 7 %% 3 <= 0, FALSE))   # FALSE
any(c(3 < 2, 7 %% 3 >= 1, FALSE))   # TRUE


## operation of comparation ---------------------------------------------------

2 == 3             # FALSE
all.equal(c(1, 2), c(1, 2 + 1e-13),
          tolerance = 1e-12)
                 # TRUE; it respects
                 # the given numerical tolerance
identical(c(1, 2), c(1, 2 + 1e-13))
                 # FALSE, it returns 
                 # TRUE if and only if
                 # both the objects are
                 # totally the same

2 < 3              # TRUE
"b" <= "a"         # FALSE; it compares
                   # an order within English alphabet
FALSE >= TRUE      # FALSE; it compares
                   # values in boolean algebra
                   # (TRUE := 1, FALSE := 0)
2 != 3             # TRUE     
TRUE != FALSE      # TRUE

c(2, 6) %in% c(1:5)      # c(TRUE, FALSE)
"k" %in% LETTERS         # FALSE
"J" %in% letters         # FALSE
"May" %in% month.name    # TRUE
"a" %in% "alphabet"      # FALSE

is.element(c(2, 6), c(1:5))
                       # c(TRUE, FALSE)
is.element(c(1:5), c(2, 6))
                       # c(FALSE, TRUE,
                       # FALSE, FALSE, FALSE)


## rounding and formatting of numbers -----------------------------------------

round(1.4, digits = 0)     # 1
round(-146.655, 2)         # -146.66

signif(1.458, digits = 1)  # 1
signif(1.458, digits = 2)  # 1.5
signif(1.458, digits = 3)  # 1.46
signif(1.458, digits = 4)  # 1.458

format(1.45, nsmall = 1)   # "1.45"
format(1.45, nsmall = 2)   # "1.45"
format(1.45, nsmall = 3)   # "1.450"


## ----------------------------------------------------------------------------

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
###############################################################################
###############################################################################





