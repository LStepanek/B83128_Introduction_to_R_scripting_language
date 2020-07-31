###############################################################################
###############################################################################
###############################################################################

## working directory ----------------------------------------------------------

# to get where my current working directory is
getwd()

# what my current working directory includes
dir()

# setting to a new working directory by a code
setwd("C:/.../my_working_directory")

# setting to a new working directory by a pop-up window
setwd(choose.dir())


## ----------------------------------------------------------------------------

## import and export of a plain text ------------------------------------------

browseURL(
    "https://ubi.lf1.cuni.cz/en/introduction-to-r"
)

my_html <- readLines(  # webscraping of a web page
    con = "https://ubi.lf1.cuni.cz/en/introduction-to-r",
    encoding = "UTF-8"
)

head(my_html, 20)


# saving and loading of a plain text format
writeLines(         # I am saving to a file
    text = paste(
        "One R to rule them all",
        "one R to find them",
        "one R to bring them all",
        "and in the darkness bind them",
        sep = "\n"  # a new-line separator
    ),
    con = "my_text.txt"
)

my_loaded_text <- readLines(
    con = "my_text.txt",
    encoding = "UTF-8"
)                   # I am loading from a file


## import and export of a tabular format --------------------------------------

write.table(            # I am saving a data.frame
    x = mtcars,
    sep = ";",
    row.names = FALSE,
    file = "mtcars.csv" # or "mtcars.txt"
)
  
my_mtcars <- read.table(
    file = "mtcars.csv",
    sep = ";",
    header = TRUE
)                       # I am loading as a data.frame


# or
write.table(x = iris,
            file = "iris.txt")

my_iris <- read.table(
    file = "iris.txt",
    sep = " ",
    header = TRUE,
    stringsAsFactors = FALSE,
    check.names = FALSE,
             # stops to check whether variables'
             # names are valid
    colClasses = "character"
             # coerces all variables to character
             # data type
)


## ----------------------------------------------------------------------------

## import and export of MS Excel files ----------------------------------------

# install.packages(
    # "openxlsx",
    # dependencies = TRUE,
    # repos = "http://cran.us.r-project.org"
# )

library("openxlsx")

#### I am setting the handling with .zip files
#### !!! it is necessary to install a tool Rtools following the links
#### https://cran.r-project.org/bin/windows/Rtools/
#### or
#### https://cran.r-project.org/bin/macosx/tools/
Sys.setenv(R_ZIPCMD = "C:/Rtools/bin/zip")

## I am creating a workbook
my_workbook <- createWorkbook()

## my data as mtcars
my_table <- mtcars

## I am creating a sheet in my workbook
addWorksheet(
    wb = my_workbook,
    sheetName = "my first sheet"
)

## I am populating my sheet by my data
writeData(
    wb = my_workbook,
    sheet = "my first sheet",
    rowNames = FALSE,
    colNames = TRUE,
    x = my_table
)


## OPTIONAL -------------------------------------------------------------------

## automatic width of excel cells
setColWidths(
    wb = my_workbook,
    sheet = "my first sheet",
    cols = 1:dim(my_table)[2],
    widths = "auto"
)

## cell styles -- bold font and right horizonal alignment
my_bold_style <- createStyle(textDecoration = "bold")
right_halign_cells <- createStyle(halign = "right")

addStyle(
    wb = my_workbook,
    sheet = "my first sheet",
    style = my_bold_style,
    rows = rep(1, dim(my_table)[2]),
    cols = 1:dim(my_table)[2]
)

addStyle(
    wb = my_workbook,
    sheet = "my first sheet",
    style = right_halign_cells,
    rows = 1:(dim(my_table)[1]),
    cols = 2:(dim(my_table)[2] + 1),
    gridExpand = TRUE
)

## /OPTIONAL ------------------------------------------------------------------

## I am saving my workbool
saveWorkbook(
    wb = my_workbook,
    file = "my_table.xlsx",
    overwrite = TRUE
)

## I am reading my workbook
my_data <- read.xlsx(
  xlsxFile = "my_table.xlsx",
  sheet = 1,   # or a sheet name
  colNames = TRUE
)


## export of a console output to a file ---------------------------------------

(males <- rnorm(100, mean = 175, sd = 10))
(females <- rnorm(100, mean = 160, sd = 10))

t.test(males, females)

# console output to a file
capture.output(t.test(males, females),
               file = "t_test.txt")

# or similarly
sink("this_is_also_a_t_test.txt")
t.test(males, females)
sink()


## Export a feasible R object to a TeX code -----------------------------------

library("xtable")
      
my_linear_model <- lm(mpg ~ hp + cyl,
                      mtcars)

xtable(my_linear_model)
xtable(my_linear_model, digits = 4)

# or a more complex TeX code
print(xtable(my_linear_model,
             digits = 4),
      floating = FALSE,
      tabular.environment = "tabular",
      hline.after = NULL,
      include.rownames = TRUE,
      include.colnames = TRUE)


## the output could be directly typeset on https://tex.mendelu.cz/new/


## import of "exotic" files to \textsf{R} session -----------------------------

library("foreign")

# import of SPSS data
my_data <- read.spss(    
    file = "a_file_from_SPSS.sav",
    to.data.frame = TRUE
)


## ----------------------------------------------------------------------------

###############################################################################

## a conditional if -----------------------------------------------------------

x = 1

if(x == 1){
    print("x is equal to 1")
}      

# or
x = 2

if(x == 1){
    print(""x is equal to 1"")
}else{
    print(""x is not equal to 1"")
}


## for loop -------------------------------------------------------------------

for(i in 1:5){
    
    print(i)
    
}

# or
for(my_letter in letters){
    
    print(
        paste(my_letter, "is fine", sep = " ")
    )
    
}


## while loop -----------------------------------------------------------------

i <- 1
while(i <= 5){      
    print(i)
    i <- i + 1        
}
  
# or
my_letters <- letters
while(length(my_letters) > 0){
    
    print(
        paste(my_letters[1], "is fine", sep = " ")
    )
    my_letters <- my_letters[-1]
    
}


## repeat-until loop ----------------------------------------------------------

i <- 1
while(TRUE){    
    if(i == 6){break}
    print(i)
    i <- i + 1
}
  
# or
my_letters <- letters
while(TRUE){      
    if(length(my_letters) == 0){break}    
    print(
        paste(my_letters[1], "is fine", sep = " ")
    )
    my_letters <- my_letters[-1]
}


## warnings -------------------------------------------------------------------

log(-5) # NaN; In log(-5) : NaNs produced

getMyLog <- function(x){      
    # it returns a natural logarithm of "x"
    if(x <= 0){
        cat(
            "x is non-positive, NaN will be output\n"
        )
    }      
    return(suppressWarnings(log(x)))      
}

getMyLog(-5) # NaN;x is non-positive, NaN will be output


## errors ---------------------------------------------------------------------

"1" + "1" # Error: non-numeric argument to binary
           # operator

sumUpTheSquares <- function(a, b){
    # it returns a sum of squares of "a" and "b"
    if(!is.numeric(a)){stop("a must be a number!")}
    if(!is.numeric(b)){stop("b must be a number!")}
    return(a ^ 2 + b ^ 2)        
}

sumUpTheSquares(1, 2)   # 5
sumUpTheSquares(1, "2") # Error: b must be a number!


## ----------------------------------------------------------------------------

###############################################################################

## *apply() family ------------------------------------------------------------

# returns means for each column of "mtcars" data.frame
x <- apply(mtcars, 2, mean)
  
# the same as above but not so elegant
x <- NULL
for(i in 1:dim(mtcars)[2]){
    x <- c(x, mean(mtcars[, i]))
}
names(x) <- colnames(mtcars)


## apply() function -----------------------------------------------------------

apply(mtcars, 2, mean)
  
my_start <- Sys.time()
(x <- apply(mtcars, 2, mean))
my_stop <- Sys.time()
my_stop - my_start # 0.019s
    
my_start <- Sys.time()
x <- NULL
for(i in 1:dim(mtcars)[2]){
    x <- c(x, mean(mtcars[, i]))
    names(x)[length(x)] <- colnames(mtcars)[i]
}
x
my_stop <- Sys.time()
my_stop - my_start # 0.039s


## lapply() function ----------------------------------------------------------

set.seed(1)
my_long_list <- lapply(
    sample(c(80:120), 100, TRUE),
    function(x) sample(
        c(50:150), x, replace = TRUE
    )
)   # a list of vectors of a random length
    # consisting of random numbers

lapply(my_long_list, "[[", 14)
    # the 14-th value of each list slot
    # is returned


## a replacement of for() loop by a lapply() function -------------------------

# for loop
my_start <- Sys.time()

for_x <- NULL 
for(i in 1:100000){for_x <- c(for_x, i ^ 5)}
head(for_x)

my_stop <- Sys.time()
my_stop - my_start # 18.45s

# lapply
my_start <- Sys.time()

lapply_x <- unlist(
    lapply(
        1:100000, function(i) i ^ 5
    )
)
head(lapply_x)

my_stop <- Sys.time()
my_stop - my_start # 0.10s


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





