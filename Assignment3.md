Assignment # 3
========================================================
Qustion#1
Download the file

```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"

if (!file.exists("Assignment3-data.zip")) {
    download.file(fileUrl, destfile = "Assignment3-data.zip", method = "wget")
}
```


Unzip the file


```r
if (!file.exists("Assignment3-data")) {
    unzip("Assignment3-data.zip", overwrite = TRUE)
}
```


Get current working directory

```r
getwd()
```

```
## [1] "/Users/Vikas/share/rprog"
```



1- Plot the 30-day mortality rates for heart attack

read file

```r
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
```

```
##   Provider.Number                    Hospital.Name
## 1          010001 SOUTHEAST ALABAMA MEDICAL CENTER
## 2          010005    MARSHALL MEDICAL CENTER SOUTH
## 3          010006   ELIZA COFFEE MEMORIAL HOSPITAL
## 4          010007         MIZELL MEMORIAL HOSPITAL
## 5          010008      CRENSHAW COMMUNITY HOSPITAL
## 6          010010    MARSHALL MEDICAL CENTER NORTH
##                    Address.1 Address.2 Address.3         City State
## 1     1108 ROSS CLARK CIRCLE                           DOTHAN    AL
## 2 2505 U S HIGHWAY 431 NORTH                             BOAZ    AL
## 3         205 MARENGO STREET                         FLORENCE    AL
## 4              702 N MAIN ST                              OPP    AL
## 5        101 HOSPITAL CIRCLE                          LUVERNE    AL
## 6    8000 ALABAMA HIGHWAY 69                     GUNTERSVILLE    AL
##   ZIP.Code County.Name Phone.Number
## 1    36301     HOUSTON   3347938701
## 2    35957    MARSHALL   2565938310
## 3    35631  LAUDERDALE   2567688400
## 4    36467   COVINGTON   3344933541
## 5    36049    CRENSHAW   3343353374
## 6    35976    MARSHALL   2565718000
##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                      14.3
## 2                                                      18.5
## 3                                                      18.1
## 4                                             Not Available
## 5                                             Not Available
## 6                                             Not Available
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                No Different than U.S. National Rate
## 2                                                No Different than U.S. National Rate
## 3                                                No Different than U.S. National Rate
## 4                                                           Number of Cases Too Small
## 5                                                           Number of Cases Too Small
## 6                                                           Number of Cases Too Small
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                 12.1
## 2                                                                                 14.7
## 3                                                                                 14.8
## 4                                                                        Not Available
## 5                                                                        Not Available
## 6                                                                        Not Available
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                 17.0
## 2                                                                                 23.0
## 3                                                                                 21.8
## 4                                                                        Not Available
## 5                                                                        Not Available
## 6                                                                        Not Available
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                            666
## 2                                                                             44
## 3                                                                            329
## 4                                                                             14
## 5                                                                              9
## 6                                                                             22
##                                Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                                  
## 2                                                                                                  
## 3                                                                                                  
## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                       11.4
## 2                                                       15.2
## 3                                                       11.3
## 4                                                       13.6
## 5                                                       13.8
## 6                                                       12.5
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                 No Different than U.S. National Rate
## 2                                                        Worse than U.S. National Rate
## 3                                                 No Different than U.S. National Rate
## 4                                                 No Different than U.S. National Rate
## 5                                                 No Different than U.S. National Rate
## 6                                                 No Different than U.S. National Rate
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                                   9.5
## 2                                                                                  12.2
## 3                                                                                   9.1
## 4                                                                                  10.0
## 5                                                                                   9.9
## 6                                                                                   9.9
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                                  13.7
## 2                                                                                  18.8
## 3                                                                                  13.9
## 4                                                                                  18.2
## 5                                                                                  18.7
## 6                                                                                  15.6
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                             741
## 2                                                                             234
## 3                                                                             523
## 4                                                                             113
## 5                                                                              53
## 6                                                                             163
##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                      
## 2                                                                      
## 3                                                                      
## 4                                                                      
## 5                                                                      
## 6                                                                      
##   Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                   10.9
## 2                                                   13.9
## 3                                                   13.4
## 4                                                   14.9
## 5                                                   15.8
## 6                                                    8.7
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                             No Different than U.S. National Rate
## 2                                             No Different than U.S. National Rate
## 3                                             No Different than U.S. National Rate
## 4                                             No Different than U.S. National Rate
## 5                                             No Different than U.S. National Rate
## 6                                                   Better than U.S. National Rate
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                               8.6
## 2                                                                              11.3
## 3                                                                              11.2
## 4                                                                              11.6
## 5                                                                              11.4
## 6                                                                               6.8
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                              13.7
## 2                                                                              17.0
## 3                                                                              15.8
## 4                                                                              19.0
## 5                                                                              21.5
## 6                                                                              11.0
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                         371
## 2                                                                         372
## 3                                                                         836
## 4                                                                         239
## 5                                                                          61
## 6                                                                         315
##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                  
## 2                                                                  
## 3                                                                  
## 4                                                                  
## 5                                                                  
## 6                                                                  
##   Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                19.0
## 2                                       Not Available
## 3                                                17.8
## 4                                       Not Available
## 5                                       Not Available
## 6                                       Not Available
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                          No Different than U.S. National Rate
## 2                                                     Number of Cases Too Small
## 3                                          No Different than U.S. National Rate
## 4                                                     Number of Cases Too Small
## 5                                                     Number of Cases Too Small
## 6                                                     Number of Cases Too Small
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                             16.6
## 2                                                                    Not Available
## 3                                                                             14.9
## 4                                                                    Not Available
## 5                                                                    Not Available
## 6                                                                    Not Available
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                             21.7
## 2                                                                    Not Available
## 3                                                                             21.5
## 4                                                                    Not Available
## 5                                                                    Not Available
## 6                                                                    Not Available
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                      728
## 2                                                                       21
## 3                                                                      342
## 4                                                                        1
## 5                                                                        4
## 6                                                                       13
##                                      Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                                                  
## 2 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 3                                                                                                  
## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
##   Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                 23.7
## 2                                                 22.5
## 3                                                 19.8
## 4                                                 27.1
## 5                                                 24.7
## 6                                                 23.9
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                           No Different than U.S. National Rate
## 2                                           No Different than U.S. National Rate
## 3                                                 Better than U.S. National Rate
## 4                                           No Different than U.S. National Rate
## 5                                           No Different than U.S. National Rate
## 6                                           No Different than U.S. National Rate
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                              21.3
## 2                                                                              19.2
## 3                                                                              17.2
## 4                                                                              22.4
## 5                                                                              19.9
## 6                                                                              20.1
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                              26.5
## 2                                                                              26.1
## 3                                                                              22.9
## 4                                                                              31.9
## 5                                                                              30.2
## 6                                                                              28.2
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                       891
## 2                                                                       264
## 3                                                                       614
## 4                                                                       135
## 5                                                                        59
## 6                                                                       173
##   Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                
## 2                                                                
## 3                                                                
## 4                                                                
## 5                                                                
## 6                                                                
##   Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                             17.1
## 2                                             17.6
## 3                                             16.9
## 4                                             19.4
## 5                                             18.0
## 6                                             18.7
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                       No Different than U.S. National Rate
## 2                                       No Different than U.S. National Rate
## 3                                       No Different than U.S. National Rate
## 4                                       No Different than U.S. National Rate
## 5                                       No Different than U.S. National Rate
## 6                                       No Different than U.S. National Rate
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                          14.4
## 2                                                                          15.0
## 3                                                                          14.7
## 4                                                                          15.9
## 5                                                                          14.0
## 6                                                                          15.7
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                          20.4
## 2                                                                          20.6
## 3                                                                          19.5
## 4                                                                          23.2
## 5                                                                          22.8
## 6                                                                          22.2
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                   400
## 2                                                                   374
## 3                                                                   842
## 4                                                                   254
## 5                                                                    56
## 6                                                                   326
##   Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                            
## 2                                                            
## 3                                                            
## 4                                                            
## 5                                                            
## 6
```


Number of columns 

```r
ncol(outcome)
```

```
## [1] 46
```


Names of columns

```r
names(outcome)
```

```
##  [1] "Provider.Number"                                                                      
##  [2] "Hospital.Name"                                                                        
##  [3] "Address.1"                                                                            
##  [4] "Address.2"                                                                            
##  [5] "Address.3"                                                                            
##  [6] "City"                                                                                 
##  [7] "State"                                                                                
##  [8] "ZIP.Code"                                                                             
##  [9] "County.Name"                                                                          
## [10] "Phone.Number"                                                                         
## [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                            
## [12] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
## [13] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
## [14] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
## [15] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"       
## [16] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                 
## [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                           
## [18] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
## [19] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [20] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [21] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"      
## [22] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                
## [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                               
## [24] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"     
## [25] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
## [26] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
## [27] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"          
## [28] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                    
## [29] "Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                                  
## [30] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"        
## [31] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
## [32] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
## [33] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"             
## [34] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                       
## [35] "Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                                 
## [36] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"       
## [37] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
## [38] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
## [39] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"            
## [40] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                      
## [41] "Hospital.30.Day.Readmission.Rates.from.Pneumonia"                                     
## [42] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"           
## [43] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
## [44] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
## [45] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia"                
## [46] "Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia"
```


Make a simple histogram of the 30-day death rates from heart attack (column 11 in the outcome dataset)

```r
names(outcome)[11]
```

```
## [1] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
```

```r
outcome[, 11] <- as.numeric(outcome[, 11])
```

```
## Warning: NAs introduced by coercion
## You may get a warning about NAs being introduced; that is okay
```


histogram

```r
hist(outcome[, 11])
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 



##2 Finding the best hospital in a state
=================================================
Write a function called best that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. 

The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. 

Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.



```r
best <- function(state, outcome) {
    ## Read outcome data
    df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", 
        Hospital.Name = "character"))
    suppressWarnings(class(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack) <- "numeric")
    suppressWarnings(class(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure) <- "numeric")
    suppressWarnings(class(df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) <- "numeric")
    
    ## Check that state and outome are valid
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(state %in% df$State)) {
        stop("invalid state")
    }
    
    if (!(outcome %in% outcomes)) {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    df1 <- df[df$State == state, ]  # Subset of data for specific state.
    if (outcome == "heart attack") {
        return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == 
            min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
                na.rm = T), 2], na.rm = T))
    } else if (outcome == "heart failure") {
        return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == 
            min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, 
                na.rm = T), 2], na.rm = T))
    } else if (outcome == "pneumonia") {
        return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == 
            min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
                na.rm = T), 2], na.rm = T))
    }
}
```


Unit tests


```r
rm(list = ls())
best("TX", "heart attack")
```

```
## Error: could not find function "best"
```

```r
best("TX", "heart failure")
```

```
## Error: could not find function "best"
```

```r
best("MD", "heart attack")
```

```
## Error: could not find function "best"
```

```r
best("MD", "pneumonia")
```

```
## Error: could not find function "best"
```

```r
best("BB", "heart attack")
```

```
## Error: could not find function "best"
```

```r
best("NY", "hert attack")
```

```
## Error: could not find function "best"
```

```r
best("SC", "heart attack")
```

```
## Error: could not find function "best"
```

```r
best("NY", "pneumonia")  # [1] 'ALBANY MEDICAL CENTER HOSPITAL'  ## Incorrect results
```

```
## Error: could not find function "best"
```

```r
best("NN", "pneumonia")
```

```
## Error: could not find function "best"
```



Submission 

```r
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
submit()
```

```
## Loading required package: bitops
```

```
## Submission login (email): 
## Submission  password: 
## [1] 'best' part 1
## [2] 'best' part 2
## [3] 'best' part 3
## [4] 'rankhospital' part 1
## [5] 'rankhospital' part 2
## [6] 'rankhospital' part 3
## [7] 'rankhospital' part 4
## [8] 'rankall' part 1
## [9] 'rankall' part 2
## [10] 'rankall' part 3
## Which part are you submitting [1-10]?
```

```
## Error: missing value where TRUE/FALSE needed
```




```r
`?`(read.csv)
```




```r
df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", Hospital.Name = "character"))
head(df$State)
```

```
## [1] AL AL AL AL AL AL
## 54 Levels: AK AL AR AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY ... WY
```




```r
class(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[1:10])
```

```
## [1] "character"
```




```r
class(df$State)
```

```
## [1] "factor"
```




```r
"BB" %in% df$State  ## To Check if State is valid.
```

```
## [1] FALSE
```

```r
"AL" %in% df$State
```

```
## [1] TRUE
```




```r
head(df$Hospital.Name)
```

```
## [1] "SOUTHEAST ALABAMA MEDICAL CENTER" "MARSHALL MEDICAL CENTER SOUTH"   
## [3] "ELIZA COFFEE MEMORIAL HOSPITAL"   "MIZELL MEMORIAL HOSPITAL"        
## [5] "CRENSHAW COMMUNITY HOSPITAL"      "MARSHALL MEDICAL CENTER NORTH"
```




```r
outcomes <- c("heart attack", "heart failure", "pneumonia")
"heart attack" %in% outcomes
```

```
## [1] TRUE
```

```r
"hert attack" %in% outcomes
```

```
## [1] FALSE
```



```r
if (!("BB" %in% df$State)) {
    stop("invalid state")
}
```

```
## Error: invalid state
```




```r
if (!("hert attack" %in% outcomes)) {
    stop("invalid outcome")
}
```

```
## Error: invalid outcome
```



```r
df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
```

```
##    [1] "14.3"          "18.5"          "18.1"          "Not Available"
##    [5] "Not Available" "Not Available" "17.7"          "18.0"         
##    [9] "15.9"          "Not Available" "19.6"          "17.3"         
##   [13] "Not Available" "17.8"          "17.5"          "15.4"         
##   [17] "Not Available" "16.3"          "Not Available" "15.0"         
##   [21] "17.1"          "17.1"          "Not Available" "16.4"         
##   [25] "15.2"          "16.7"          "Not Available" "Not Available"
##   [29] "16.7"          "16.9"          "14.5"          "16.6"         
##   [33] "Not Available" "Not Available" "Not Available" "15.8"         
##   [37] "15.2"          "16.2"          "Not Available" "15.6"         
##   [41] "15.0"          "Not Available" "17.1"          "Not Available"
##   [45] "Not Available" "16.7"          "15.6"          "15.0"         
##   [49] "15.8"          "16.8"          "Not Available" "Not Available"
##   [53] "17.0"          "15.2"          "Not Available" "15.8"         
##   [57] "Not Available" "Not Available" "15.7"          "14.7"         
##   [61] "17.3"          "Not Available" "14.9"          "16.8"         
##   [65] "14.6"          "Not Available" "Not Available" "Not Available"
##   [69] "19.3"          "15.3"          "14.7"          "Not Available"
##   [73] "Not Available" "Not Available" "Not Available" "Not Available"
##   [77] "Not Available" "13.3"          "Not Available" "Not Available"
##   [81] "16.5"          "16.0"          "Not Available" "Not Available"
##   [85] "14.2"          "16.1"          "Not Available" "Not Available"
##   [89] "Not Available" "Not Available" "15.2"          "Not Available"
##   [93] "Not Available" "Not Available" "Not Available" "Not Available"
##   [97] "Not Available" "Not Available" "13.4"          "17.7"         
##  [101] "Not Available" "15.5"          "14.5"          "Not Available"
##  [105] "Not Available" "15.7"          "Not Available" "Not Available"
##  [109] "Not Available" "Not Available" "Not Available" "Not Available"
##  [113] "Not Available" "Not Available" "Not Available" "Not Available"
##  [117] "13.6"          "14.1"          "20.0"          "17.2"         
##  [121] "16.5"          "14.3"          "13.7"          "14.7"         
##  [125] "15.4"          "Not Available" "13.6"          "17.0"         
##  [129] "17.3"          "Not Available" "15.4"          "15.5"         
##  [133] "16.6"          "15.8"          "15.7"          "14.7"         
##  [137] "14.2"          "14.2"          "14.0"          "14.2"         
##  [141] "Not Available" "19.1"          "Not Available" "Not Available"
##  [145] "Not Available" "Not Available" "Not Available" "17.2"         
##  [149] "Not Available" "18.3"          "13.9"          "16.0"         
##  [153] "15.9"          "14.9"          "14.6"          "15.9"         
##  [157] "12.2"          "14.1"          "12.0"          "12.8"         
##  [161] "Not Available" "Not Available" "17.1"          "17.0"         
##  [165] "Not Available" "Not Available" "15.0"          "15.8"         
##  [169] "15.9"          "Not Available" "16.1"          "Not Available"
##  [173] "18.0"          "14.7"          "Not Available" "18.9"         
##  [177] "Not Available" "Not Available" "Not Available" "Not Available"
##  [181] "Not Available" "Not Available" "Not Available" "Not Available"
##  [185] "Not Available" "Not Available" "Not Available" "Not Available"
##  [189] "Not Available" "14.4"          "Not Available" "Not Available"
##  [193] "15.6"          "16.9"          "15.2"          "16.9"         
##  [197] "14.8"          "17.3"          "17.5"          "Not Available"
##  [201] "16.5"          "17.2"          "Not Available" "Not Available"
##  [205] "17.7"          "17.3"          "17.4"          "16.4"         
##  [209] "18.9"          "14.4"          "17.1"          "18.8"         
##  [213] "14.4"          "Not Available" "Not Available" "Not Available"
##  [217] "16.7"          "14.9"          "Not Available" "Not Available"
##  [221] "16.8"          "15.7"          "17.1"          "15.8"         
##  [225] "19.1"          "17.3"          "15.7"          "Not Available"
##  [229] "21.9"          "17.3"          "17.1"          "14.5"         
##  [233] "14.7"          "14.5"          "17.6"          "Not Available"
##  [237] "11.9"          "Not Available" "Not Available" "Not Available"
##  [241] "Not Available" "Not Available" "Not Available" "Not Available"
##  [245] "Not Available" "Not Available" "Not Available" "Not Available"
##  [249] "Not Available" "Not Available" "Not Available" "Not Available"
##  [253] "Not Available" "Not Available" "Not Available" "Not Available"
##  [257] "Not Available" "Not Available" "Not Available" "Not Available"
##  [261] "Not Available" "Not Available" "Not Available" "Not Available"
##  [265] "Not Available" "Not Available" "Not Available" "Not Available"
##  [269] "Not Available" "15.3"          "18.6"          "16.0"         
##  [273] "Not Available" "16.1"          "16.6"          "16.0"         
##  [277] "17.2"          "15.2"          "13.5"          "13.9"         
##  [281] "14.7"          "12.5"          "18.2"          "Not Available"
##  [285] "14.7"          "18.7"          "16.0"          "14.9"         
##  [289] "Not Available" "16.9"          "12.4"          "17.3"         
##  [293] "Not Available" "14.4"          "15.8"          "16.2"         
##  [297] "14.4"          "17.5"          "12.9"          "16.0"         
##  [301] "15.8"          "14.5"          "15.6"          "Not Available"
##  [305] "Not Available" "Not Available" "Not Available" "Not Available"
##  [309] "Not Available" "14.2"          "16.4"          "14.2"         
##  [313] "13.6"          "16.7"          "14.9"          "15.5"         
##  [317] "Not Available" "13.7"          "Not Available" "17.2"         
##  [321] "13.8"          "15.8"          "16.9"          "13.9"         
##  [325] "13.6"          "18.4"          "14.9"          "15.9"         
##  [329] "15.8"          "13.9"          "Not Available" "15.3"         
##  [333] "14.3"          "15.7"          "18.2"          "15.9"         
##  [337] "16.3"          "13.9"          "14.7"          "15.6"         
##  [341] "15.3"          "14.9"          "14.2"          "15.0"         
##  [345] "15.1"          "Not Available" "15.2"          "Not Available"
##  [349] "Not Available" "Not Available" "Not Available" "15.8"         
##  [353] "13.7"          "15.8"          "16.9"          "15.2"         
##  [357] "13.3"          "Not Available" "17.1"          "14.5"         
##  [361] "12.9"          "14.7"          "16.2"          "14.0"         
##  [365] "Not Available" "13.9"          "Not Available" "17.1"         
##  [369] "13.9"          "Not Available" "13.1"          "16.3"         
##  [373] "13.9"          "14.3"          "12.6"          "15.3"         
##  [377] "15.4"          "16.4"          "17.4"          "13.4"         
##  [381] "14.2"          "13.2"          "Not Available" "14.8"         
##  [385] "15.4"          "14.4"          "10.5"          "15.4"         
##  [389] "15.3"          "17.9"          "16.2"          "18.6"         
##  [393] "Not Available" "16.8"          "13.0"          "16.7"         
##  [397] "Not Available" "Not Available" "14.1"          "17.0"         
##  [401] "14.9"          "16.6"          "14.2"          "14.9"         
##  [405] "18.6"          "11.9"          "14.4"          "16.0"         
##  [409] "16.9"          "13.9"          "17.9"          "12.7"         
##  [413] "15.6"          "14.8"          "15.3"          "16.0"         
##  [417] "13.7"          "18.8"          "Not Available" "15.1"         
##  [421] "Not Available" "15.2"          "14.5"          "15.6"         
##  [425] "16.5"          "16.5"          "16.3"          "15.1"         
##  [429] "14.9"          "Not Available" "14.1"          "14.9"         
##  [433] "Not Available" "15.3"          "Not Available" "15.8"         
##  [437] "13.5"          "16.8"          "17.1"          "14.8"         
##  [441] "Not Available" "12.7"          "12.5"          "Not Available"
##  [445] "15.4"          "14.3"          "14.1"          "17.1"         
##  [449] "Not Available" "13.8"          "Not Available" "17.8"         
##  [453] "16.0"          "Not Available" "13.6"          "Not Available"
##  [457] "14.2"          "Not Available" "15.5"          "13.0"         
##  [461] "13.4"          "17.2"          "Not Available" "16.0"         
##  [465] "16.1"          "14.4"          "14.8"          "14.6"         
##  [469] "14.9"          "16.1"          "13.8"          "14.1"         
##  [473] "15.1"          "15.8"          "15.8"          "13.8"         
##  [477] "12.9"          "18.8"          "Not Available" "Not Available"
##  [481] "Not Available" "15.8"          "Not Available" "16.0"         
##  [485] "16.1"          "Not Available" "Not Available" "17.4"         
##  [489] "Not Available" "Not Available" "Not Available" "Not Available"
##  [493] "13.5"          "15.2"          "Not Available" "14.7"         
##  [497] "Not Available" "13.7"          "17.3"          "14.9"         
##  [501] "15.4"          "Not Available" "15.2"          "14.6"         
##  [505] "15.1"          "16.2"          "18.6"          "19.2"         
##  [509] "16.0"          "14.1"          "13.9"          "16.7"         
##  [513] "Not Available" "Not Available" "15.2"          "Not Available"
##  [517] "12.9"          "12.3"          "16.6"          "16.6"         
##  [521] "15.2"          "Not Available" "Not Available" "15.8"         
##  [525] "Not Available" "Not Available" "Not Available" "15.3"         
##  [529] "15.2"          "Not Available" "14.7"          "15.5"         
##  [533] "Not Available" "Not Available" "Not Available" "14.8"         
##  [537] "18.1"          "Not Available" "13.4"          "Not Available"
##  [541] "Not Available" "Not Available" "Not Available" "14.7"         
##  [545] "Not Available" "16.7"          "14.3"          "14.7"         
##  [549] "13.5"          "14.9"          "15.5"          "14.1"         
##  [553] "15.8"          "11.2"          "Not Available" "Not Available"
##  [557] "15.7"          "Not Available" "Not Available" "Not Available"
##  [561] "Not Available" "14.8"          "Not Available" "13.3"         
##  [565] "15.4"          "Not Available" "Not Available" "14.3"         
##  [569] "Not Available" "14.8"          "Not Available" "Not Available"
##  [573] "Not Available" "Not Available" "Not Available" "Not Available"
##  [577] "Not Available" "Not Available" "13.3"          "17.3"         
##  [581] "13.4"          "Not Available" "Not Available" "Not Available"
##  [585] "Not Available" "Not Available" "Not Available" "Not Available"
##  [589] "Not Available" "14.0"          "Not Available" "Not Available"
##  [593] "Not Available" "Not Available" "Not Available" "Not Available"
##  [597] "Not Available" "Not Available" "Not Available" "Not Available"
##  [601] "Not Available" "Not Available" "16.3"          "Not Available"
##  [605] "Not Available" "Not Available" "15.2"          "Not Available"
##  [609] "Not Available" "Not Available" "13.7"          "14.5"         
##  [613] "16.2"          "15.6"          "Not Available" "13.0"         
##  [617] "15.4"          "Not Available" "14.2"          "13.8"         
##  [621] "14.9"          "14.2"          "Not Available" "12.7"         
##  [625] "16.1"          "12.4"          "16.3"          "15.2"         
##  [629] "15.1"          "16.0"          "13.5"          "14.9"         
##  [633] "14.4"          "15.1"          "Not Available" "Not Available"
##  [637] "Not Available" "Not Available" "15.4"          "13.8"         
##  [641] "17.2"          "14.9"          "15.8"          "Not Available"
##  [645] "Not Available" "Not Available" "13.1"          "Not Available"
##  [649] "13.0"          "Not Available" "15.0"          "14.7"         
##  [653] "15.7"          "13.8"          "Not Available" "Not Available"
##  [657] "13.1"          "Not Available" "Not Available" "Not Available"
##  [661] "Not Available" "Not Available" "Not Available" "Not Available"
##  [665] "Not Available" "Not Available" "Not Available" "Not Available"
##  [669] "Not Available" "Not Available" "Not Available" "Not Available"
##  [673] "Not Available" "Not Available" "Not Available" "Not Available"
##  [677] "Not Available" "Not Available" "Not Available" "Not Available"
##  [681] "Not Available" "Not Available" "14.9"          "14.0"         
##  [685] "14.8"          "16.3"          "10.6"          "13.2"         
##  [689] "14.8"          "17.2"          "13.7"          "16.6"         
##  [693] "15.6"          "16.3"          "12.8"          "15.6"         
##  [697] "16.3"          "16.6"          "13.4"          "15.6"         
##  [701] "12.1"          "15.8"          "14.4"          "15.0"         
##  [705] "13.3"          "15.3"          "15.0"          "14.2"         
##  [709] "12.8"          "14.6"          "14.2"          "Not Available"
##  [713] "Not Available" "Not Available" "14.3"          "15.6"         
##  [717] "12.9"          "15.3"          "14.2"          "Not Available"
##  [721] "15.3"          "16.0"          "Not Available" "14.2"         
##  [725] "14.0"          "Not Available" "15.6"          "Not Available"
##  [729] "16.8"          "14.5"          "15.0"          "14.0"         
##  [733] "13.5"          "16.2"          "14.9"          "16.7"         
##  [737] "16.2"          "13.6"          "13.4"          "15.3"         
##  [741] "17.3"          "14.2"          "13.1"          "14.0"         
##  [745] "15.6"          "19.1"          "15.3"          "12.2"         
##  [749] "18.0"          "13.9"          "16.7"          "16.4"         
##  [753] "14.4"          "13.2"          "15.9"          "16.3"         
##  [757] "15.5"          "Not Available" "15.4"          "12.8"         
##  [761] "16.9"          "17.4"          "15.0"          "15.2"         
##  [765] "16.7"          "14.5"          "14.0"          "15.3"         
##  [769] "15.3"          "15.0"          "Not Available" "14.4"         
##  [773] "15.8"          "15.5"          "15.6"          "13.2"         
##  [777] "15.6"          "15.5"          "15.4"          "Not Available"
##  [781] "15.0"          "18.4"          "13.8"          "14.3"         
##  [785] "13.2"          "14.7"          "16.0"          "17.6"         
##  [789] "16.7"          "13.9"          "14.1"          "14.4"         
##  [793] "16.0"          "14.4"          "19.0"          "13.4"         
##  [797] "14.9"          "15.5"          "15.9"          "18.0"         
##  [801] "14.5"          "16.1"          "15.4"          "13.3"         
##  [805] "14.2"          "Not Available" "13.8"          "13.5"         
##  [809] "14.7"          "14.3"          "Not Available" "Not Available"
##  [813] "14.3"          "16.9"          "14.4"          "14.1"         
##  [817] "13.7"          "13.8"          "17.6"          "17.5"         
##  [821] "Not Available" "12.8"          "15.4"          "15.9"         
##  [825] "12.9"          "16.3"          "16.2"          "16.3"         
##  [829] "16.1"          "15.4"          "19.1"          "15.5"         
##  [833] "16.4"          "16.2"          "15.1"          "17.1"         
##  [837] "14.3"          "17.1"          "14.7"          "15.5"         
##  [841] "14.3"          "17.8"          "17.9"          "15.7"         
##  [845] "18.0"          "15.3"          "14.6"          "16.9"         
##  [849] "16.1"          "17.3"          "13.5"          "18.1"         
##  [853] "14.8"          "Not Available" "17.1"          "16.3"         
##  [857] "16.6"          "15.4"          "18.2"          "16.9"         
##  [861] "12.5"          "14.4"          "19.1"          "14.7"         
##  [865] "14.7"          "13.4"          "14.3"          "15.5"         
##  [869] "17.3"          "14.2"          "16.1"          "13.5"         
##  [873] "14.9"          "12.9"          "16.2"          "14.8"         
##  [877] "Not Available" "13.7"          "15.8"          "16.0"         
##  [881] "17.8"          "13.5"          "17.7"          "13.8"         
##  [885] "16.5"          "14.3"          "15.1"          "13.5"         
##  [889] "16.7"          "14.0"          "15.7"          "Not Available"
##  [893] "Not Available" "Not Available" "Not Available" "13.8"         
##  [897] "15.6"          "15.8"          "Not Available" "Not Available"
##  [901] "Not Available" "Not Available" "15.6"          "Not Available"
##  [905] "Not Available" "Not Available" "Not Available" "Not Available"
##  [909] "15.4"          "14.9"          "15.9"          "15.8"         
##  [913] "14.6"          "17.0"          "14.5"          "17.6"         
##  [917] "14.4"          "16.8"          "15.0"          "19.9"         
##  [921] "15.2"          "14.1"          "15.5"          "16.8"         
##  [925] "15.2"          "Not Available" "15.7"          "14.2"         
##  [929] "16.0"          "17.7"          "12.9"          "16.1"         
##  [933] "14.8"          "15.1"          "16.4"          "15.3"         
##  [937] "14.6"          "18.0"          "Not Available" "14.7"         
##  [941] "Not Available" "Not Available" "16.2"          "Not Available"
##  [945] "15.8"          "18.1"          "Not Available" "15.7"         
##  [949] "14.9"          "Not Available" "16.0"          "16.4"         
##  [953] "16.3"          "15.0"          "14.7"          "16.4"         
##  [957] "13.9"          "13.5"          "Not Available" "14.7"         
##  [961] "16.7"          "15.7"          "Not Available" "16.3"         
##  [965] "Not Available" "Not Available" "17.0"          "17.6"         
##  [969] "16.3"          "Not Available" "Not Available" "Not Available"
##  [973] "Not Available" "16.6"          "Not Available" "17.4"         
##  [977] "14.7"          "16.0"          "16.1"          "16.9"         
##  [981] "Not Available" "17.2"          "Not Available" "Not Available"
##  [985] "16.6"          "Not Available" "Not Available" "Not Available"
##  [989] "16.6"          "14.9"          "16.5"          "14.5"         
##  [993] "15.6"          "17.5"          "Not Available" "16.9"         
##  [997] "Not Available" "Not Available" "Not Available" "Not Available"
## [1001] "17.2"          "16.1"          "Not Available" "16.7"         
## [1005] "Not Available" "Not Available" "Not Available" "Not Available"
## [1009] "Not Available" "15.6"          "15.9"          "16.2"         
## [1013] "15.1"          "14.3"          "14.5"          "16.3"         
## [1017] "18.0"          "16.0"          "Not Available" "Not Available"
## [1021] "Not Available" "Not Available" "Not Available" "Not Available"
## [1025] "Not Available" "Not Available" "Not Available" "Not Available"
## [1029] "Not Available" "Not Available" "Not Available" "Not Available"
## [1033] "Not Available" "Not Available" "Not Available" "Not Available"
## [1037] "Not Available" "Not Available" "Not Available" "Not Available"
## [1041] "15.4"          "16.3"          "14.9"          "13.3"         
## [1045] "15.1"          "13.8"          "15.8"          "Not Available"
## [1049] "15.3"          "Not Available" "15.8"          "17.9"         
## [1053] "17.1"          "Not Available" "Not Available" "Not Available"
## [1057] "Not Available" "Not Available" "Not Available" "16.3"         
## [1061] "15.5"          "14.1"          "14.1"          "13.6"         
## [1065] "15.5"          "17.0"          "Not Available" "12.3"         
## [1069] "15.4"          "Not Available" "Not Available" "Not Available"
## [1073] "Not Available" "Not Available" "Not Available" "Not Available"
## [1077] "Not Available" "Not Available" "Not Available" "Not Available"
## [1081] "Not Available" "Not Available" "Not Available" "Not Available"
## [1085] "Not Available" "Not Available" "Not Available" "Not Available"
## [1089] "Not Available" "Not Available" "13.7"          "12.6"         
## [1093] "14.1"          "13.8"          "15.9"          "14.7"         
## [1097] "15.9"          "15.2"          "15.5"          "Not Available"
## [1101] "16.1"          "16.9"          "15.4"          "15.1"         
## [1105] "Not Available" "15.6"          "13.7"          "16.9"         
## [1109] "17.2"          "12.7"          "13.8"          "15.1"         
## [1113] "Not Available" "13.4"          "15.6"          "13.7"         
## [1117] "16.3"          "17.4"          "15.7"          "13.1"         
## [1121] "14.8"          "18.6"          "15.1"          "15.4"         
## [1125] "16.8"          "Not Available" "15.2"          "15.7"         
## [1129] "12.2"          "Not Available" "15.5"          "14.3"         
## [1133] "15.7"          "Not Available" "15.0"          "14.5"         
## [1137] "14.4"          "Not Available" "16.6"          "Not Available"
## [1141] "17.3"          "14.6"          "14.0"          "15.8"         
## [1145] "13.3"          "14.7"          "14.2"          "14.5"         
## [1149] "15.4"          "12.3"          "15.5"          "17.2"         
## [1153] "14.3"          "14.2"          "16.5"          "16.8"         
## [1157] "Not Available" "Not Available" "Not Available" "16.1"         
## [1161] "14.9"          "15.9"          "Not Available" "14.5"         
## [1165] "14.1"          "16.1"          "Not Available" "17.5"         
## [1169] "14.0"          "16.1"          "15.4"          "16.1"         
## [1173] "16.3"          "14.5"          "15.6"          "12.1"         
## [1177] "13.9"          "17.4"          "15.7"          "14.9"         
## [1181] "14.6"          "16.2"          "15.8"          "15.4"         
## [1185] "13.1"          "Not Available" "13.7"          "14.6"         
## [1189] "16.3"          "13.9"          "14.9"          "16.1"         
## [1193] "14.6"          "16.0"          "14.0"          "14.9"         
## [1197] "11.0"          "13.3"          "12.8"          "18.9"         
## [1201] "16.5"          "13.5"          "15.3"          "13.8"         
## [1205] "16.4"          "15.0"          "14.7"          "11.5"         
## [1209] "15.7"          "13.8"          "12.6"          "11.9"         
## [1213] "15.9"          "16.6"          "15.3"          "13.8"         
## [1217] "13.0"          "14.1"          "Not Available" "Not Available"
## [1221] "14.4"          "15.2"          "Not Available" "Not Available"
## [1225] "Not Available" "Not Available" "Not Available" "15.4"         
## [1229] "Not Available" "Not Available" "16.7"          "15.7"         
## [1233] "Not Available" "Not Available" "Not Available" "Not Available"
## [1237] "Not Available" "Not Available" "Not Available" "Not Available"
## [1241] "Not Available" "Not Available" "Not Available" "Not Available"
## [1245] "Not Available" "Not Available" "Not Available" "Not Available"
## [1249] "16.0"          "Not Available" "Not Available" "Not Available"
## [1253] "Not Available" "14.8"          "Not Available" "14.9"         
## [1257] "Not Available" "Not Available" "Not Available" "16.9"         
## [1261] "Not Available" "Not Available" "Not Available" "Not Available"
## [1265] "Not Available" "Not Available" "16.5"          "Not Available"
## [1269] "15.0"          "14.3"          "15.4"          "14.6"         
## [1273] "14.0"          "17.9"          "16.4"          "15.2"         
## [1277] "16.1"          "16.0"          "18.2"          "16.2"         
## [1281] "15.6"          "16.6"          "14.3"          "18.0"         
## [1285] "Not Available" "15.9"          "13.4"          "15.6"         
## [1289] "15.6"          "15.9"          "17.0"          "14.8"         
## [1293] "14.8"          "16.3"          "15.9"          "16.7"         
## [1297] "15.2"          "15.6"          "15.4"          "18.0"         
## [1301] "16.0"          "Not Available" "14.7"          "15.4"         
## [1305] "Not Available" "15.2"          "16.8"          "13.8"         
## [1309] "15.7"          "16.3"          "15.0"          "Not Available"
## [1313] "15.6"          "16.7"          "15.6"          "15.7"         
## [1317] "14.5"          "14.9"          "15.1"          "14.5"         
## [1321] "16.1"          "Not Available" "Not Available" "14.4"         
## [1325] "Not Available" "Not Available" "14.3"          "12.3"         
## [1329] "16.4"          "15.8"          "14.3"          "14.8"         
## [1333] "17.9"          "13.6"          "Not Available" "17.1"         
## [1337] "Not Available" "Not Available" "Not Available" "11.5"         
## [1341] "15.6"          "Not Available" "13.8"          "Not Available"
## [1345] "15.4"          "14.5"          "Not Available" "Not Available"
## [1349] "Not Available" "Not Available" "Not Available" "Not Available"
## [1353] "17.8"          "Not Available" "16.7"          "15.2"         
## [1357] "Not Available" "Not Available" "Not Available" "Not Available"
## [1361] "Not Available" "Not Available" "Not Available" "Not Available"
## [1365] "Not Available" "Not Available" "Not Available" "Not Available"
## [1369] "Not Available" "Not Available" "Not Available" "Not Available"
## [1373] "Not Available" "Not Available" "Not Available" "17.0"         
## [1377] "Not Available" "Not Available" "Not Available" "Not Available"
## [1381] "Not Available" "Not Available" "Not Available" "Not Available"
## [1385] "14.0"          "Not Available" "15.1"          "16.6"         
## [1389] "Not Available" "Not Available" "Not Available" "14.2"         
## [1393] "15.0"          "Not Available" "16.2"          "16.4"         
## [1397] "14.2"          "15.5"          "16.0"          "14.2"         
## [1401] "12.5"          "Not Available" "15.0"          "Not Available"
## [1405] "Not Available" "12.7"          "12.7"          "14.5"         
## [1409] "14.4"          "14.9"          "13.5"          "15.7"         
## [1413] "16.2"          "15.9"          "14.9"          "16.3"         
## [1417] "15.0"          "16.6"          "Not Available" "14.8"         
## [1421] "16.7"          "16.1"          "14.8"          "16.2"         
## [1425] "Not Available" "16.0"          "15.5"          "14.3"         
## [1429] "Not Available" "Not Available" "Not Available" "Not Available"
## [1433] "Not Available" "Not Available" "Not Available" "Not Available"
## [1437] "Not Available" "Not Available" "Not Available" "Not Available"
## [1441] "Not Available" "Not Available" "Not Available" "Not Available"
## [1445] "Not Available" "Not Available" "Not Available" "Not Available"
## [1449] "Not Available" "Not Available" "Not Available" "Not Available"
## [1453] "Not Available" "Not Available" "Not Available" "Not Available"
## [1457] "Not Available" "Not Available" "Not Available" "Not Available"
## [1461] "Not Available" "Not Available" "Not Available" "Not Available"
## [1465] "Not Available" "Not Available" "16.3"          "Not Available"
## [1469] "Not Available" "Not Available" "Not Available" "Not Available"
## [1473] "Not Available" "Not Available" "Not Available" "Not Available"
## [1477] "Not Available" "Not Available" "Not Available" "Not Available"
## [1481] "Not Available" "Not Available" "Not Available" "16.3"         
## [1485] "Not Available" "15.4"          "Not Available" "Not Available"
## [1489] "Not Available" "Not Available" "15.8"          "16.7"         
## [1493] "Not Available" "Not Available" "Not Available" "Not Available"
## [1497] "Not Available" "Not Available" "Not Available" "Not Available"
## [1501] "Not Available" "17.6"          "16.7"          "15.1"         
## [1505] "Not Available" "16.1"          "13.8"          "Not Available"
## [1509] "14.6"          "Not Available" "17.2"          "14.4"         
## [1513] "Not Available" "Not Available" "14.1"          "18.4"         
## [1517] "Not Available" "Not Available" "16.9"          "Not Available"
## [1521] "Not Available" "14.2"          "16.0"          "Not Available"
## [1525] "13.5"          "17.4"          "Not Available" "Not Available"
## [1529] "Not Available" "Not Available" "15.3"          "14.1"         
## [1533] "Not Available" "16.3"          "14.6"          "16.2"         
## [1537] "16.8"          "Not Available" "Not Available" "14.4"         
## [1541] "16.4"          "15.7"          "Not Available" "13.4"         
## [1545] "13.2"          "Not Available" "Not Available" "Not Available"
## [1549] "Not Available" "16.8"          "Not Available" "Not Available"
## [1553] "Not Available" "15.3"          "Not Available" "Not Available"
## [1557] "Not Available" "Not Available" "Not Available" "Not Available"
## [1561] "Not Available" "Not Available" "Not Available" "Not Available"
## [1565] "Not Available" "Not Available" "Not Available" "Not Available"
## [1569] "Not Available" "Not Available" "Not Available" "Not Available"
## [1573] "Not Available" "Not Available" "Not Available" "Not Available"
## [1577] "Not Available" "Not Available" "Not Available" "Not Available"
## [1581] "Not Available" "Not Available" "Not Available" "Not Available"
## [1585] "Not Available" "Not Available" "Not Available" "Not Available"
## [1589] "Not Available" "Not Available" "Not Available" "Not Available"
## [1593] "Not Available" "Not Available" "Not Available" "Not Available"
## [1597] "Not Available" "Not Available" "Not Available" "Not Available"
## [1601] "Not Available" "Not Available" "Not Available" "Not Available"
## [1605] "Not Available" "Not Available" "Not Available" "Not Available"
## [1609] "Not Available" "15.1"          "Not Available" "Not Available"
## [1613] "Not Available" "Not Available" "16.1"          "Not Available"
## [1617] "Not Available" "Not Available" "Not Available" "15.2"         
## [1621] "15.2"          "Not Available" "14.5"          "15.3"         
## [1625] "15.5"          "15.5"          "15.4"          "16.0"         
## [1629] "16.5"          "17.7"          "15.5"          "16.1"         
## [1633] "15.0"          "17.2"          "Not Available" "16.0"         
## [1637] "20.0"          "17.7"          "12.2"          "13.9"         
## [1641] "15.1"          "14.9"          "15.6"          "19.0"         
## [1645] "14.8"          "Not Available" "12.3"          "18.1"         
## [1649] "17.2"          "17.9"          "Not Available" "15.2"         
## [1653] "Not Available" "Not Available" "18.9"          "Not Available"
## [1657] "16.4"          "Not Available" "Not Available" "Not Available"
## [1661] "14.8"          "18.8"          "15.3"          "15.2"         
## [1665] "13.8"          "18.1"          "15.2"          "Not Available"
## [1669] "16.8"          "13.2"          "15.7"          "16.9"         
## [1673] "Not Available" "Not Available" "16.5"          "Not Available"
## [1677] "15.9"          "15.5"          "Not Available" "13.9"         
## [1681] "17.7"          "16.4"          "17.3"          "18.3"         
## [1685] "14.7"          "Not Available" "Not Available" "Not Available"
## [1689] "Not Available" "Not Available" "Not Available" "Not Available"
## [1693] "Not Available" "Not Available" "Not Available" "Not Available"
## [1697] "Not Available" "Not Available" "Not Available" "Not Available"
## [1701] "Not Available" "Not Available" "Not Available" "Not Available"
## [1705] "Not Available" "Not Available" "Not Available" "Not Available"
## [1709] "Not Available" "Not Available" "Not Available" "15.1"         
## [1713] "Not Available" "Not Available" "Not Available" "17.0"         
## [1717] "18.7"          "15.9"          "17.4"          "16.4"         
## [1721] "Not Available" "13.7"          "17.0"          "Not Available"
## [1725] "Not Available" "15.2"          "17.4"          "15.9"         
## [1729] "15.9"          "16.1"          "15.8"          "14.7"         
## [1733] "16.5"          "14.5"          "Not Available" "14.3"         
## [1737] "16.6"          "15.3"          "16.9"          "Not Available"
## [1741] "14.3"          "14.3"          "15.9"          "17.4"         
## [1745] "17.2"          "14.9"          "15.9"          "13.8"         
## [1749] "Not Available" "Not Available" "17.2"          "Not Available"
## [1753] "Not Available" "17.3"          "Not Available" "16.9"         
## [1757] "Not Available" "14.9"          "16.3"          "Not Available"
## [1761] "Not Available" "Not Available" "13.6"          "Not Available"
## [1765] "Not Available" "Not Available" "Not Available" "16.7"         
## [1769] "Not Available" "15.9"          "Not Available" "17.7"         
## [1773] "Not Available" "16.7"          "15.1"          "19.9"         
## [1777] "17.7"          "19.2"          "Not Available" "Not Available"
## [1781] "Not Available" "Not Available" "Not Available" "15.4"         
## [1785] "16.0"          "16.7"          "Not Available" "16.1"         
## [1789] "17.0"          "Not Available" "16.4"          "Not Available"
## [1793] "Not Available" "17.4"          "Not Available" "Not Available"
## [1797] "Not Available" "Not Available" "Not Available" "Not Available"
## [1801] "14.7"          "Not Available" "Not Available" "Not Available"
## [1805] "Not Available" "Not Available" "15.9"          "Not Available"
## [1809] "Not Available" "Not Available" "Not Available" "Not Available"
## [1813] "Not Available" "Not Available" "Not Available" "Not Available"
## [1817] "Not Available" "Not Available" "Not Available" "Not Available"
## [1821] "Not Available" "Not Available" "Not Available" "Not Available"
## [1825] "Not Available" "Not Available" "Not Available" "Not Available"
## [1829] "Not Available" "13.9"          "14.8"          "16.3"         
## [1833] "14.9"          "14.3"          "15.3"          "12.6"         
## [1837] "17.3"          "14.7"          "16.2"          "16.2"         
## [1841] "13.5"          "16.2"          "16.8"          "14.7"         
## [1845] "Not Available" "15.0"          "14.6"          "15.5"         
## [1849] "14.7"          "15.3"          "16.7"          "Not Available"
## [1853] "Not Available" "18.4"          "16.6"          "17.1"         
## [1857] "16.2"          "16.6"          "16.4"          "18.1"         
## [1861] "Not Available" "15.3"          "16.2"          "14.5"         
## [1865] "17.2"          "15.9"          "17.1"          "18.0"         
## [1869] "15.1"          "13.8"          "15.1"          "18.1"         
## [1873] "15.0"          "14.8"          "12.4"          "16.6"         
## [1877] "15.2"          "Not Available" "14.8"          "14.8"         
## [1881] "15.4"          "14.7"          "14.3"          "14.5"         
## [1885] "15.2"          "17.0"          "16.2"          "16.1"         
## [1889] "17.0"          "14.8"          "13.9"          "14.3"         
## [1893] "14.7"          "15.0"          "13.7"          "Not Available"
## [1897] "14.8"          "15.9"          "14.9"          "15.8"         
## [1901] "Not Available" "12.8"          "15.3"          "15.3"         
## [1905] "15.6"          "16.0"          "14.3"          "14.6"         
## [1909] "Not Available" "15.8"          "14.8"          "14.3"         
## [1913] "13.2"          "16.7"          "15.6"          "15.3"         
## [1917] "14.1"          "12.5"          "15.6"          "14.3"         
## [1921] "14.6"          "Not Available" "16.4"          "15.2"         
## [1925] "13.7"          "15.7"          "16.4"          "16.1"         
## [1929] "13.4"          "14.2"          "13.2"          "13.4"         
## [1933] "16.3"          "13.5"          "14.9"          "Not Available"
## [1937] "14.1"          "Not Available" "15.2"          "17.0"         
## [1941] "13.2"          "14.9"          "16.1"          "13.0"         
## [1945] "15.9"          "13.5"          "Not Available" "15.5"         
## [1949] "13.3"          "14.6"          "14.8"          "12.7"         
## [1953] "12.1"          "Not Available" "13.3"          "13.8"         
## [1957] "16.9"          "15.8"          "14.3"          "13.3"         
## [1961] "13.9"          "14.4"          "13.7"          "14.6"         
## [1965] "16.5"          "14.8"          "15.3"          "14.4"         
## [1969] "Not Available" "12.6"          "13.7"          "14.5"         
## [1973] "14.9"          "12.8"          "Not Available" "Not Available"
## [1977] "Not Available" "Not Available" "Not Available" "14.9"         
## [1981] "Not Available" "15.1"          "15.2"          "Not Available"
## [1985] "Not Available" "14.8"          "12.7"          "13.0"         
## [1989] "15.0"          "15.6"          "15.1"          "14.5"         
## [1993] "14.7"          "17.6"          "15.9"          "16.0"         
## [1997] "13.1"          "16.3"          "15.5"          "18.6"         
## [2001] "13.2"          "13.1"          "12.3"          "16.0"         
## [2005] "14.9"          "12.7"          "16.2"          "Not Available"
## [2009] "15.6"          "15.1"          "13.3"          "Not Available"
## [2013] "15.2"          "18.5"          "15.6"          "Not Available"
## [2017] "15.7"          "15.5"          "Not Available" "15.4"         
## [2021] "15.2"          "Not Available" "15.7"          "15.4"         
## [2025] "11.8"          "14.1"          "Not Available" "17.3"         
## [2029] "16.9"          "12.7"          "13.8"          "Not Available"
## [2033] "17.7"          "15.2"          "19.8"          "18.1"         
## [2037] "14.6"          "15.7"          "Not Available" "14.2"         
## [2041] "19.8"          "Not Available" "15.4"          "13.8"         
## [2045] "13.5"          "16.4"          "12.4"          "14.0"         
## [2049] "14.3"          "Not Available" "15.0"          "18.3"         
## [2053] "15.6"          "14.7"          "14.1"          "14.9"         
## [2057] "Not Available" "Not Available" "15.1"          "15.0"         
## [2061] "13.8"          "15.3"          "16.0"          "15.7"         
## [2065] "16.4"          "Not Available" "15.8"          "16.4"         
## [2069] "15.2"          "Not Available" "12.5"          "15.7"         
## [2073] "13.7"          "Not Available" "13.5"          "Not Available"
## [2077] "Not Available" "Not Available" "14.6"          "16.1"         
## [2081] "Not Available" "Not Available" "Not Available" "15.9"         
## [2085] "Not Available" "Not Available" "Not Available" "Not Available"
## [2089] "Not Available" "Not Available" "16.0"          "Not Available"
## [2093] "Not Available" "Not Available" "17.3"          "Not Available"
## [2097] "Not Available" "Not Available" "Not Available" "Not Available"
## [2101] "Not Available" "Not Available" "Not Available" "Not Available"
## [2105] "Not Available" "Not Available" "Not Available" "Not Available"
## [2109] "Not Available" "Not Available" "Not Available" "Not Available"
## [2113] "Not Available" "16.6"          "16.0"          "15.2"         
## [2117] "Not Available" "12.1"          "Not Available" "16.0"         
## [2121] "Not Available" "Not Available" "Not Available" "Not Available"
## [2125] "Not Available" "15.7"          "12.4"          "12.6"         
## [2129] "16.1"          "14.8"          "15.7"          "16.6"         
## [2133] "Not Available" "15.2"          "14.7"          "15.3"         
## [2137] "12.3"          "17.4"          "Not Available" "15.3"         
## [2141] "16.3"          "Not Available" "15.4"          "Not Available"
## [2145] "15.3"          "Not Available" "15.4"          "14.1"         
## [2149] "14.7"          "15.0"          "14.4"          "14.4"         
## [2153] "15.4"          "Not Available" "16.8"          "15.4"         
## [2157] "15.4"          "15.7"          "14.6"          "15.8"         
## [2161] "Not Available" "Not Available" "Not Available" "15.9"         
## [2165] "17.7"          "15.4"          "Not Available" "Not Available"
## [2169] "Not Available" "Not Available" "Not Available" "Not Available"
## [2173] "Not Available" "Not Available" "Not Available" "Not Available"
## [2177] "Not Available" "Not Available" "Not Available" "Not Available"
## [2181] "Not Available" "Not Available" "Not Available" "Not Available"
## [2185] "Not Available" "Not Available" "Not Available" "Not Available"
## [2189] "Not Available" "Not Available" "Not Available" "Not Available"
## [2193] "Not Available" "Not Available" "Not Available" "Not Available"
## [2197] "Not Available" "Not Available" "Not Available" "Not Available"
## [2201] "Not Available" "Not Available" "Not Available" "Not Available"
## [2205] "Not Available" "Not Available" "Not Available" "Not Available"
## [2209] "Not Available" "Not Available" "Not Available" "Not Available"
## [2213] "Not Available" "Not Available" "Not Available" "Not Available"
## [2217] "Not Available" "Not Available" "Not Available" "Not Available"
## [2221] "Not Available" "Not Available" "Not Available" "Not Available"
## [2225] "Not Available" "Not Available" "Not Available" "Not Available"
## [2229] "Not Available" "Not Available" "Not Available" "Not Available"
## [2233] "Not Available" "Not Available" "Not Available" "Not Available"
## [2237] "Not Available" "Not Available" "Not Available" "Not Available"
## [2241] "15.9"          "15.8"          "Not Available" "Not Available"
## [2245] "Not Available" "Not Available" "16.7"          "Not Available"
## [2249] "17.1"          "16.0"          "15.2"          "16.6"         
## [2253] "Not Available" "Not Available" "15.7"          "15.1"         
## [2257] "16.3"          "Not Available" "16.5"          "Not Available"
## [2261] "15.7"          "14.1"          "Not Available" "Not Available"
## [2265] "15.6"          "16.7"          "Not Available" "Not Available"
## [2269] "14.2"          "Not Available" "Not Available" "Not Available"
## [2273] "Not Available" "19.1"          "15.6"          "Not Available"
## [2277] "Not Available" "Not Available" "14.6"          "14.7"         
## [2281] "16.0"          "18.2"          "Not Available" "Not Available"
## [2285] "16.3"          "19.3"          "16.2"          "17.0"         
## [2289] "12.9"          "15.5"          "17.4"          "19.3"         
## [2293] "17.3"          "16.8"          "14.6"          "14.1"         
## [2297] "14.3"          "17.0"          "17.7"          "Not Available"
## [2301] "Not Available" "Not Available" "Not Available" "Not Available"
## [2305] "13.8"          "Not Available" "15.0"          "Not Available"
## [2309] "Not Available" "16.8"          "Not Available" "Not Available"
## [2313] "Not Available" "Not Available" "Not Available" "Not Available"
## [2317] "Not Available" "Not Available" "Not Available" "Not Available"
## [2321] "Not Available" "Not Available" "Not Available" "Not Available"
## [2325] "Not Available" "Not Available" "Not Available" "Not Available"
## [2329] "Not Available" "17.3"          "Not Available" "15.7"         
## [2333] "17.0"          "17.5"          "17.4"          "17.6"         
## [2337] "14.6"          "14.3"          "15.6"          "14.1"         
## [2341] "17.8"          "15.6"          "16.1"          "13.2"         
## [2345] "Not Available" "17.5"          "17.0"          "Not Available"
## [2349] "15.7"          "Not Available" "15.8"          "15.7"         
## [2353] "Not Available" "Not Available" "13.7"          "14.2"         
## [2357] "16.3"          "12.0"          "Not Available" "15.1"         
## [2361] "15.9"          "16.1"          "16.0"          "Not Available"
## [2365] "13.9"          "17.5"          "15.0"          "12.7"         
## [2369] "16.2"          "16.0"          "17.0"          "12.2"         
## [2373] "Not Available" "15.4"          "17.0"          "12.6"         
## [2377] "17.9"          "16.8"          "16.3"          "Not Available"
## [2381] "18.7"          "15.8"          "12.5"          "15.9"         
## [2385] "15.9"          "Not Available" "16.2"          "Not Available"
## [2389] "15.1"          "17.1"          "15.9"          "15.1"         
## [2393] "12.3"          "14.0"          "16.5"          "15.8"         
## [2397] "16.6"          "13.8"          "14.9"          "15.0"         
## [2401] "15.1"          "Not Available" "Not Available" "15.7"         
## [2405] "Not Available" "16.9"          "14.4"          "Not Available"
## [2409] "Not Available" "Not Available" "Not Available" "Not Available"
## [2413] "Not Available" "Not Available" "Not Available" "Not Available"
## [2417] "Not Available" "Not Available" "Not Available" "Not Available"
## [2421] "Not Available" "Not Available" "Not Available" "Not Available"
## [2425] "Not Available" "Not Available" "Not Available" "Not Available"
## [2429] "Not Available" "Not Available" "Not Available" "Not Available"
## [2433] "Not Available" "Not Available" "Not Available" "Not Available"
## [2437] "Not Available" "15.0"          "15.9"          "13.6"         
## [2441] "13.6"          "15.0"          "13.8"          "Not Available"
## [2445] "14.6"          "14.4"          "13.7"          "15.9"         
## [2449] "Not Available" "Not Available" "Not Available" "Not Available"
## [2453] "Not Available" "Not Available" "Not Available" "Not Available"
## [2457] "Not Available" "Not Available" "Not Available" "Not Available"
## [2461] "Not Available" "Not Available" "Not Available" "Not Available"
## [2465] "Not Available" "Not Available" "Not Available" "Not Available"
## [2469] "Not Available" "Not Available" "Not Available" "Not Available"
## [2473] "Not Available" "Not Available" "Not Available" "Not Available"
## [2477] "Not Available" "Not Available" "Not Available" "Not Available"
## [2481] "Not Available" "Not Available" "Not Available" "Not Available"
## [2485] "Not Available" "Not Available" "Not Available" "Not Available"
## [2489] "Not Available" "Not Available" "Not Available" "14.8"         
## [2493] "15.3"          "16.9"          "16.7"          "14.4"         
## [2497] "14.2"          "15.6"          "14.8"          "14.3"         
## [2501] "16.4"          "16.5"          "17.3"          "16.4"         
## [2505] "15.2"          "15.1"          "14.9"          "14.0"         
## [2509] "Not Available" "14.6"          "Not Available" "16.5"         
## [2513] "Not Available" "Not Available" "Not Available" "Not Available"
## [2517] "Not Available" "Not Available" "Not Available" "Not Available"
## [2521] "Not Available" "Not Available" "Not Available" "Not Available"
## [2525] "Not Available" "Not Available" "Not Available" "Not Available"
## [2529] "Not Available" "Not Available" "Not Available" "Not Available"
## [2533] "Not Available" "Not Available" "Not Available" "Not Available"
## [2537] "Not Available" "Not Available" "Not Available" "Not Available"
## [2541] "Not Available" "Not Available" "Not Available" "Not Available"
## [2545] "Not Available" "Not Available" "Not Available" "Not Available"
## [2549] "Not Available" "Not Available" "Not Available" "Not Available"
## [2553] "Not Available" "Not Available" "Not Available" "Not Available"
## [2557] "Not Available" "Not Available" "Not Available" "Not Available"
## [2561] "Not Available" "Not Available" "Not Available" "Not Available"
## [2565] "Not Available" "Not Available" "Not Available" "Not Available"
## [2569] "Not Available" "Not Available" "Not Available" "Not Available"
## [2573] "Not Available" "Not Available" "Not Available" "Not Available"
## [2577] "Not Available" "Not Available" "Not Available" "Not Available"
## [2581] "Not Available" "14.2"          "13.4"          "14.9"         
## [2585] "Not Available" "14.6"          "15.6"          "15.7"         
## [2589] "15.8"          "16.4"          "Not Available" "17.5"         
## [2593] "20.1"          "14.9"          "17.7"          "17.1"         
## [2597] "15.6"          "14.7"          "15.7"          "15.4"         
## [2601] "Not Available" "Not Available" "15.5"          "15.2"         
## [2605] "Not Available" "Not Available" "Not Available" "Not Available"
## [2609] "Not Available" "17.0"          "13.6"          "18.4"         
## [2613] "14.3"          "14.7"          "14.7"          "15.1"         
## [2617] "14.6"          "15.9"          "15.6"          "15.8"         
## [2621] "14.6"          "12.3"          "Not Available" "Not Available"
## [2625] "Not Available" "16.8"          "Not Available" "Not Available"
## [2629] "18.8"          "16.0"          "16.2"          "16.0"         
## [2633] "15.8"          "Not Available" "16.2"          "11.9"         
## [2637] "14.7"          "12.7"          "13.3"          "15.4"         
## [2641] "12.0"          "15.2"          "15.7"          "16.5"         
## [2645] "13.6"          "16.6"          "12.0"          "15.4"         
## [2649] "15.4"          "16.8"          "Not Available" "15.8"         
## [2653] "14.6"          "20.5"          "13.8"          "18.2"         
## [2657] "16.9"          "14.3"          "16.2"          "13.2"         
## [2661] "14.6"          "15.7"          "16.1"          "15.2"         
## [2665] "14.2"          "14.4"          "12.8"          "15.5"         
## [2669] "17.7"          "13.9"          "13.8"          "14.9"         
## [2673] "15.2"          "14.4"          "15.5"          "15.5"         
## [2677] "14.8"          "15.3"          "14.2"          "15.8"         
## [2681] "15.2"          "14.5"          "13.6"          "14.3"         
## [2685] "12.7"          "11.8"          "14.4"          "16.7"         
## [2689] "17.2"          "17.0"          "16.7"          "16.5"         
## [2693] "16.1"          "15.1"          "15.1"          "15.3"         
## [2697] "12.4"          "14.7"          "15.7"          "15.8"         
## [2701] "15.6"          "13.9"          "Not Available" "17.0"         
## [2705] "15.0"          "18.2"          "16.8"          "Not Available"
## [2709] "Not Available" "Not Available" "Not Available" "Not Available"
## [2713] "15.6"          "15.7"          "16.0"          "Not Available"
## [2717] "Not Available" "Not Available" "Not Available" "Not Available"
## [2721] "Not Available" "Not Available" "Not Available" "Not Available"
## [2725] "15.3"          "16.6"          "Not Available" "Not Available"
## [2729] "Not Available" "Not Available" "19.0"          "Not Available"
## [2733] "Not Available" "Not Available" "Not Available" "Not Available"
## [2737] "Not Available" "Not Available" "16.4"          "Not Available"
## [2741] "14.5"          "16.8"          "15.4"          "14.0"         
## [2745] "14.2"          "15.5"          "14.7"          "14.8"         
## [2749] "14.3"          "14.8"          "15.6"          "13.2"         
## [2753] "13.9"          "17.8"          "15.6"          "Not Available"
## [2757] "14.0"          "16.0"          "15.5"          "13.6"         
## [2761] "17.0"          "16.0"          "13.2"          "14.2"         
## [2765] "13.8"          "16.1"          "14.2"          "16.9"         
## [2769] "14.6"          "17.6"          "13.5"          "13.3"         
## [2773] "15.5"          "17.4"          "14.5"          "16.6"         
## [2777] "18.8"          "15.2"          "15.5"          "18.1"         
## [2781] "14.5"          "16.1"          "14.4"          "14.3"         
## [2785] "12.8"          "15.1"          "15.8"          "Not Available"
## [2789] "11.4"          "14.9"          "16.6"          "14.0"         
## [2793] "12.5"          "15.2"          "15.0"          "Not Available"
## [2797] "Not Available" "12.7"          "Not Available" "12.8"         
## [2801] "12.9"          "16.8"          "17.5"          "15.0"         
## [2805] "Not Available" "13.4"          "16.5"          "Not Available"
## [2809] "13.5"          "16.0"          "Not Available" "15.4"         
## [2813] "16.2"          "16.5"          "14.8"          "Not Available"
## [2817] "15.8"          "14.1"          "14.1"          "17.5"         
## [2821] "Not Available" "14.3"          "16.0"          "15.7"         
## [2825] "Not Available" "13.7"          "16.7"          "14.3"         
## [2829] "11.4"          "14.5"          "12.6"          "15.9"         
## [2833] "14.5"          "16.2"          "11.0"          "16.4"         
## [2837] "13.1"          "16.8"          "14.0"          "13.3"         
## [2841] "16.0"          "14.7"          "16.3"          "14.1"         
## [2845] "12.6"          "15.4"          "15.8"          "15.6"         
## [2849] "15.0"          "10.1"          "13.4"          "14.3"         
## [2853] "15.7"          "13.7"          "16.7"          "15.5"         
## [2857] "13.5"          "15.8"          "14.2"          "Not Available"
## [2861] "14.2"          "15.2"          "16.3"          "13.2"         
## [2865] "15.8"          "15.8"          "Not Available" "18.2"         
## [2869] "14.6"          "16.1"          "15.2"          "15.4"         
## [2873] "17.8"          "15.2"          "13.7"          "14.3"         
## [2877] "12.9"          "17.3"          "15.6"          "Not Available"
## [2881] "14.7"          "Not Available" "Not Available" "15.2"         
## [2885] "17.3"          "15.6"          "15.7"          "13.9"         
## [2889] "14.1"          "13.1"          "16.7"          "14.1"         
## [2893] "15.1"          "15.2"          "16.6"          "14.5"         
## [2897] "13.7"          "14.0"          "14.6"          "Not Available"
## [2901] "15.9"          "13.3"          "14.8"          "15.5"         
## [2905] "17.0"          "17.6"          "17.0"          "12.0"         
## [2909] "Not Available" "Not Available" "Not Available" "Not Available"
## [2913] "Not Available" "Not Available" "Not Available" "Not Available"
## [2917] "Not Available" "Not Available" "Not Available" "Not Available"
## [2921] "Not Available" "Not Available" "Not Available" "Not Available"
## [2925] "Not Available" "13.2"          "14.5"          "16.2"         
## [2929] "15.1"          "14.9"          "19.0"          "14.7"         
## [2933] "16.3"          "15.6"          "16.2"          "16.0"         
## [2937] "15.9"          "15.4"          "17.3"          "14.5"         
## [2941] "16.4"          "16.3"          "14.2"          "14.0"         
## [2945] "14.9"          "Not Available" "14.7"          "13.5"         
## [2949] "15.4"          "15.6"          "16.5"          "16.2"         
## [2953] "Not Available" "16.0"          "14.1"          "16.5"         
## [2957] "16.2"          "15.7"          "16.6"          "15.1"         
## [2961] "15.8"          "15.8"          "14.3"          "14.7"         
## [2965] "13.5"          "18.4"          "Not Available" "15.6"         
## [2969] "15.2"          "16.8"          "15.8"          "14.1"         
## [2973] "13.6"          "15.2"          "15.0"          "15.0"         
## [2977] "17.1"          "15.3"          "15.0"          "14.1"         
## [2981] "14.3"          "15.8"          "16.7"          "17.1"         
## [2985] "15.5"          "16.8"          "14.9"          "15.8"         
## [2989] "17.3"          "15.3"          "15.2"          "14.0"         
## [2993] "16.2"          "Not Available" "14.7"          "13.8"         
## [2997] "16.2"          "15.3"          "14.3"          "15.3"         
## [3001] "Not Available" "15.4"          "Not Available" "16.2"         
## [3005] "Not Available" "14.2"          "Not Available" "14.9"         
## [3009] "16.2"          "14.8"          "13.3"          "Not Available"
## [3013] "17.6"          "14.6"          "Not Available" "13.8"         
## [3017] "Not Available" "Not Available" "Not Available" "Not Available"
## [3021] "Not Available" "Not Available" "Not Available" "Not Available"
## [3025] "Not Available" "Not Available" "Not Available" "Not Available"
## [3029] "Not Available" "14.7"          "Not Available" "Not Available"
## [3033] "Not Available" "Not Available" "Not Available" "16.3"         
## [3037] "Not Available" "16.8"          "15.7"          "13.1"         
## [3041] "15.2"          "19.8"          "Not Available" "Not Available"
## [3045] "16.8"          "Not Available" "Not Available" "Not Available"
## [3049] "Not Available" "Not Available" "Not Available" "Not Available"
## [3053] "Not Available" "Not Available" "Not Available" "15.5"         
## [3057] "Not Available" "Not Available" "Not Available" "Not Available"
## [3061] "Not Available" "Not Available" "Not Available" "Not Available"
## [3065] "Not Available" "Not Available" "Not Available" "Not Available"
## [3069] "14.9"          "Not Available" "16.8"          "16.0"         
## [3073] "13.8"          "13.9"          "16.5"          "15.0"         
## [3077] "17.7"          "15.6"          "16.8"          "16.9"         
## [3081] "15.5"          "17.3"          "Not Available" "15.7"         
## [3085] "12.0"          "18.4"          "15.5"          "14.0"         
## [3089] "17.0"          "13.9"          "16.4"          "17.4"         
## [3093] "Not Available" "15.2"          "15.3"          "15.9"         
## [3097] "14.6"          "15.1"          "14.1"          "16.4"         
## [3101] "16.8"          "Not Available" "15.5"          "14.9"         
## [3105] "15.2"          "12.7"          "18.6"          "14.3"         
## [3109] "14.8"          "16.5"          "14.7"          "15.3"         
## [3113] "15.2"          "15.4"          "14.3"          "15.7"         
## [3117] "16.5"          "15.9"          "15.0"          "12.2"         
## [3121] "17.2"          "13.5"          "13.8"          "12.9"         
## [3125] "16.4"          "18.0"          "16.4"          "16.4"         
## [3129] "16.0"          "13.2"          "18.8"          "17.4"         
## [3133] "Not Available" "Not Available" "16.2"          "15.6"         
## [3137] "Not Available" "15.5"          "15.8"          "14.4"         
## [3141] "15.1"          "Not Available" "16.2"          "19.2"         
## [3145] "15.2"          "Not Available" "17.2"          "15.7"         
## [3149] "13.9"          "14.0"          "15.2"          "15.8"         
## [3153] "14.1"          "14.4"          "15.4"          "14.3"         
## [3157] "14.2"          "13.3"          "12.4"          "15.0"         
## [3161] "Not Available" "Not Available" "17.7"          "15.0"         
## [3165] "16.6"          "13.4"          "14.8"          "15.3"         
## [3169] "15.5"          "14.3"          "Not Available" "13.0"         
## [3173] "16.3"          "14.3"          "14.0"          "15.0"         
## [3177] "14.6"          "Not Available" "13.1"          "Not Available"
## [3181] "13.5"          "15.8"          "15.2"          "15.7"         
## [3185] "16.1"          "14.8"          "15.6"          "15.6"         
## [3189] "15.3"          "16.6"          "Not Available" "Not Available"
## [3193] "14.2"          "Not Available" "14.2"          "Not Available"
## [3197] "Not Available" "Not Available" "Not Available" "Not Available"
## [3201] "Not Available" "15.8"          "Not Available" "Not Available"
## [3205] "Not Available" "Not Available" "Not Available" "14.2"         
## [3209] "Not Available" "Not Available" "Not Available" "Not Available"
## [3213] "Not Available" "Not Available" "Not Available" "Not Available"
## [3217] "Not Available" "15.2"          "Not Available" "Not Available"
## [3221] "Not Available" "Not Available" "15.1"          "Not Available"
## [3225] "Not Available" "Not Available" "Not Available" "14.5"         
## [3229] "Not Available" "18.3"          "14.7"          "Not Available"
## [3233] "Not Available" "Not Available" "15.4"          "Not Available"
## [3237] "Not Available" "14.9"          "Not Available" "Not Available"
## [3241] "Not Available" "Not Available" "Not Available" "14.9"         
## [3245] "Not Available" "16.3"          "16.4"          "Not Available"
## [3249] "15.7"          "Not Available" "14.7"          "14.7"         
## [3253] "Not Available" "13.7"          "17.1"          "Not Available"
## [3257] "14.2"          "15.6"          "16.0"          "14.5"         
## [3261] "18.0"          "15.3"          "Not Available" "Not Available"
## [3265] "17.0"          "16.0"          "Not Available" "14.9"         
## [3269] "17.6"          "15.3"          "Not Available" "18.5"         
## [3273] "17.9"          "14.1"          "Not Available" "Not Available"
## [3277] "14.7"          "Not Available" "15.3"          "Not Available"
## [3281] "16.8"          "Not Available" "Not Available" "17.0"         
## [3285] "15.1"          "15.6"          "14.4"          "16.6"         
## [3289] "Not Available" "Not Available" "Not Available" "14.6"         
## [3293] "Not Available" "18.4"          "17.8"          "14.6"         
## [3297] "Not Available" "Not Available" "16.0"          "15.6"         
## [3301] "Not Available" "Not Available" "Not Available" "Not Available"
## [3305] "Not Available" "Not Available" "Not Available" "Not Available"
## [3309] "Not Available" "Not Available" "Not Available" "Not Available"
## [3313] "Not Available" "Not Available" "Not Available" "Not Available"
## [3317] "15.8"          "Not Available" "Not Available" "Not Available"
## [3321] "14.8"          "Not Available" "Not Available" "13.3"         
## [3325] "Not Available" "Not Available" "Not Available" "Not Available"
## [3329] "Not Available" "Not Available" "Not Available" "Not Available"
## [3333] "Not Available" "Not Available" "12.5"          "Not Available"
## [3337] "Not Available" "Not Available" "Not Available" "Not Available"
## [3341] "Not Available" "Not Available" "Not Available" "Not Available"
## [3345] "Not Available" "Not Available" "Not Available" "Not Available"
## [3349] "Not Available" "Not Available" "Not Available" "Not Available"
## [3353] "Not Available" "Not Available" "Not Available" "Not Available"
## [3357] "Not Available" "Not Available" "Not Available" "Not Available"
## [3361] "Not Available" "Not Available" "Not Available" "Not Available"
## [3365] "Not Available" "Not Available" "Not Available" "Not Available"
## [3369] "Not Available" "17.3"          "20.1"          "13.6"         
## [3373] "Not Available" "15.2"          "13.3"          "16.8"         
## [3377] "14.5"          "15.7"          "15.2"          "16.5"         
## [3381] "16.5"          "16.3"          "16.2"          "Not Available"
## [3385] "Not Available" "15.2"          "16.1"          "12.5"         
## [3389] "Not Available" "15.7"          "17.9"          "17.5"         
## [3393] "16.2"          "Not Available" "18.6"          "16.5"         
## [3397] "18.1"          "16.2"          "14.2"          "15.8"         
## [3401] "15.0"          "Not Available" "14.8"          "Not Available"
## [3405] "Not Available" "15.5"          "Not Available" "Not Available"
## [3409] "Not Available" "Not Available" "Not Available" "Not Available"
## [3413] "Not Available" "Not Available" "15.9"          "Not Available"
## [3417] "17.9"          "16.2"          "Not Available" "15.7"         
## [3421] "Not Available" "Not Available" "Not Available" "17.2"         
## [3425] "Not Available" "Not Available" "Not Available" "Not Available"
## [3429] "16.3"          "14.6"          "17.0"          "15.8"         
## [3433] "15.2"          "Not Available" "14.1"          "14.6"         
## [3437] "12.5"          "14.9"          "13.3"          "14.6"         
## [3441] "Not Available" "14.9"          "16.2"          "17.9"         
## [3445] "17.7"          "17.1"          "15.9"          "15.6"         
## [3449] "16.7"          "15.2"          "13.0"          "15.9"         
## [3453] "14.0"          "17.1"          "15.1"          "15.2"         
## [3457] "15.1"          "15.4"          "14.0"          "Not Available"
## [3461] "14.8"          "17.8"          "15.0"          "13.9"         
## [3465] "17.2"          "Not Available" "15.0"          "Not Available"
## [3469] "13.8"          "16.1"          "14.7"          "14.6"         
## [3473] "Not Available" "16.3"          "15.0"          "15.6"         
## [3477] "15.1"          "14.8"          "17.3"          "14.8"         
## [3481] "14.2"          "16.5"          "15.5"          "14.7"         
## [3485] "18.2"          "14.9"          "16.1"          "15.8"         
## [3489] "13.4"          "13.2"          "15.3"          "15.1"         
## [3493] "15.1"          "16.8"          "16.6"          "13.5"         
## [3497] "15.7"          "13.2"          "16.6"          "16.2"         
## [3501] "17.2"          "Not Available" "17.2"          "14.4"         
## [3505] "Not Available" "15.8"          "16.7"          "15.5"         
## [3509] "14.9"          "16.2"          "14.4"          "Not Available"
## [3513] "14.9"          "12.8"          "16.2"          "13.4"         
## [3517] "13.6"          "16.6"          "15.0"          "15.1"         
## [3521] "16.0"          "17.0"          "16.6"          "13.2"         
## [3525] "17.9"          "16.0"          "14.2"          "14.9"         
## [3529] "15.9"          "15.9"          "13.1"          "14.0"         
## [3533] "15.0"          "13.5"          "16.8"          "13.9"         
## [3537] "13.8"          "15.3"          "15.9"          "Not Available"
## [3541] "12.9"          "13.1"          "Not Available" "15.7"         
## [3545] "10.7"          "15.5"          "Not Available" "15.5"         
## [3549] "16.3"          "10.4"          "16.8"          "13.2"         
## [3553] "Not Available" "16.7"          "15.9"          "16.2"         
## [3557] "14.4"          "18.7"          "13.8"          "13.2"         
## [3561] "14.3"          "13.2"          "16.3"          "14.6"         
## [3565] "16.5"          "14.4"          "13.3"          "16.1"         
## [3569] "Not Available" "14.3"          "14.9"          "16.3"         
## [3573] "Not Available" "Not Available" "18.4"          "14.7"         
## [3577] "Not Available" "Not Available" "16.3"          "Not Available"
## [3581] "Not Available" "Not Available" "Not Available" "Not Available"
## [3585] "Not Available" "Not Available" "Not Available" "Not Available"
## [3589] "Not Available" "Not Available" "Not Available" "Not Available"
## [3593] "Not Available" "Not Available" "Not Available" "Not Available"
## [3597] "Not Available" "Not Available" "Not Available" "15.5"         
## [3601] "15.5"          "Not Available" "Not Available" "16.2"         
## [3605] "Not Available" "16.4"          "Not Available" "Not Available"
## [3609] "15.7"          "Not Available" "Not Available" "Not Available"
## [3613] "Not Available" "16.2"          "Not Available" "Not Available"
## [3617] "18.3"          "14.3"          "15.6"          "15.5"         
## [3621] "17.7"          "Not Available" "Not Available" "17.2"         
## [3625] "15.8"          "16.4"          "Not Available" "Not Available"
## [3629] "16.2"          "14.0"          "Not Available" "Not Available"
## [3633] "15.5"          "Not Available" "Not Available" "16.8"         
## [3637] "15.9"          "16.5"          "16.2"          "14.1"         
## [3641] "16.1"          "15.7"          "Not Available" "14.5"         
## [3645] "18.6"          "17.7"          "Not Available" "Not Available"
## [3649] "16.0"          "Not Available" "Not Available" "Not Available"
## [3653] "Not Available" "Not Available" "14.9"          "16.3"         
## [3657] "15.5"          "15.6"          "13.9"          "14.7"         
## [3661] "14.4"          "Not Available" "14.2"          "11.9"         
## [3665] "17.7"          "15.3"          "18.0"          "12.9"         
## [3669] "15.3"          "14.5"          "16.9"          "16.4"         
## [3673] "15.0"          "17.1"          "Not Available" "13.8"         
## [3677] "16.1"          "14.3"          "16.4"          "15.2"         
## [3681] "15.1"          "Not Available" "14.5"          "14.8"         
## [3685] "Not Available" "Not Available" "15.2"          "14.6"         
## [3689] "14.6"          "17.3"          "16.2"          "17.0"         
## [3693] "Not Available" "15.6"          "Not Available" "Not Available"
## [3697] "Not Available" "13.1"          "15.8"          "Not Available"
## [3701] "17.4"          "14.6"          "Not Available" "13.9"         
## [3705] "14.1"          "Not Available" "16.3"          "17.3"         
## [3709] "17.1"          "16.7"          "17.1"          "15.9"         
## [3713] "14.2"          "15.3"          "16.2"          "Not Available"
## [3717] "17.9"          "18.3"          "Not Available" "Not Available"
## [3721] "Not Available" "Not Available" "16.1"          "14.4"         
## [3725] "Not Available" "Not Available" "Not Available" "Not Available"
## [3729] "Not Available" "18.0"          "15.1"          "15.3"         
## [3733] "15.7"          "13.0"          "15.8"          "15.6"         
## [3737] "14.5"          "Not Available" "Not Available" "15.3"         
## [3741] "13.8"          "Not Available" "Not Available" "Not Available"
## [3745] "Not Available" "Not Available" "Not Available" "Not Available"
## [3749] "Not Available" "Not Available" "Not Available" "10.5"         
## [3753] "Not Available" "Not Available" "Not Available" "Not Available"
## [3757] "Not Available" "Not Available" "Not Available" "Not Available"
## [3761] "Not Available" "Not Available" "Not Available" "Not Available"
## [3765] "Not Available" "Not Available" "Not Available" "Not Available"
## [3769] "Not Available" "Not Available" "Not Available" "Not Available"
## [3773] "Not Available" "15.7"          "Not Available" "Not Available"
## [3777] "Not Available" "Not Available" "15.8"          "15.8"         
## [3781] "15.4"          "Not Available" "16.9"          "14.4"         
## [3785] "Not Available" "16.5"          "13.5"          "14.9"         
## [3789] "Not Available" "13.5"          "16.1"          "Not Available"
## [3793] "15.2"          "14.4"          "17.5"          "15.1"         
## [3797] "Not Available" "Not Available" "12.8"          "17.3"         
## [3801] "13.7"          "Not Available" "14.8"          "Not Available"
## [3805] "12.9"          "15.8"          "Not Available" "14.7"         
## [3809] "15.9"          "Not Available" "16.0"          "15.0"         
## [3813] "15.1"          "13.8"          "Not Available" "15.5"         
## [3817] "14.9"          "Not Available" "14.5"          "15.7"         
## [3821] "14.9"          "17.2"          "19.0"          "14.4"         
## [3825] "14.2"          "14.0"          "17.2"          "14.9"         
## [3829] "15.4"          "Not Available" "18.4"          "Not Available"
## [3833] "14.7"          "Not Available" "Not Available" "17.0"         
## [3837] "14.6"          "17.3"          "16.6"          "17.6"         
## [3841] "17.0"          "18.2"          "18.1"          "Not Available"
## [3845] "15.7"          "Not Available" "Not Available" "16.7"         
## [3849] "15.9"          "Not Available" "15.4"          "14.7"         
## [3853] "Not Available" "16.2"          "Not Available" "Not Available"
## [3857] "15.2"          "16.6"          "Not Available" "Not Available"
## [3861] "14.7"          "14.7"          "Not Available" "Not Available"
## [3865] "14.4"          "Not Available" "14.2"          "Not Available"
## [3869] "17.9"          "14.1"          "14.1"          "14.9"         
## [3873] "15.1"          "14.4"          "16.5"          "Not Available"
## [3877] "Not Available" "16.3"          "16.4"          "Not Available"
## [3881] "Not Available" "Not Available" "Not Available" "Not Available"
## [3885] "Not Available" "Not Available" "Not Available" "Not Available"
## [3889] "Not Available" "Not Available" "Not Available" "Not Available"
## [3893] "Not Available" "16.1"          "16.3"          "15.7"         
## [3897] "Not Available" "17.4"          "15.7"          "12.9"         
## [3901] "17.4"          "18.1"          "16.0"          "16.4"         
## [3905] "15.4"          "21.6"          "14.5"          "16.1"         
## [3909] "15.1"          "17.4"          "16.6"          "18.8"         
## [3913] "13.6"          "14.2"          "14.5"          "16.8"         
## [3917] "15.6"          "Not Available" "13.9"          "Not Available"
## [3921] "14.0"          "14.9"          "15.7"          "17.3"         
## [3925] "13.3"          "Not Available" "Not Available" "15.1"         
## [3929] "16.1"          "Not Available" "15.7"          "Not Available"
## [3933] "16.3"          "15.3"          "15.5"          "18.7"         
## [3937] "Not Available" "16.2"          "14.6"          "15.2"         
## [3941] "15.8"          "14.6"          "15.5"          "Not Available"
## [3945] "16.2"          "17.2"          "14.0"          "15.7"         
## [3949] "16.9"          "14.9"          "15.7"          "Not Available"
## [3953] "Not Available" "16.1"          "15.2"          "14.0"         
## [3957] "16.3"          "Not Available" "Not Available" "Not Available"
## [3961] "13.9"          "13.5"          "14.7"          "Not Available"
## [3965] "16.0"          "17.9"          "Not Available" "14.8"         
## [3969] "14.4"          "17.9"          "15.6"          "19.4"         
## [3973] "16.5"          "17.2"          "15.0"          "14.3"         
## [3977] "15.7"          "Not Available" "Not Available" "Not Available"
## [3981] "17.3"          "15.6"          "13.1"          "16.9"         
## [3985] "Not Available" "14.9"          "13.9"          "Not Available"
## [3989] "Not Available" "Not Available" "Not Available" "16.2"         
## [3993] "14.7"          "15.0"          "Not Available" "14.3"         
## [3997] "17.0"          "Not Available" "16.0"          "16.6"         
## [4001] "Not Available" "18.5"          "16.2"          "16.2"         
## [4005] "16.6"          "Not Available" "Not Available" "15.2"         
## [4009] "16.3"          "12.9"          "Not Available" "Not Available"
## [4013] "15.2"          "Not Available" "15.2"          "16.2"         
## [4017] "16.4"          "Not Available" "Not Available" "15.0"         
## [4021] "14.9"          "Not Available" "Not Available" "Not Available"
## [4025] "13.5"          "16.2"          "Not Available" "Not Available"
## [4029] "17.7"          "Not Available" "Not Available" "17.5"         
## [4033] "17.2"          "16.6"          "15.5"          "16.5"         
## [4037] "Not Available" "Not Available" "Not Available" "Not Available"
## [4041] "16.4"          "16.1"          "16.3"          "Not Available"
## [4045] "17.2"          "16.0"          "Not Available" "14.5"         
## [4049] "Not Available" "Not Available" "16.4"          "Not Available"
## [4053] "Not Available" "14.7"          "Not Available" "16.7"         
## [4057] "17.1"          "15.9"          "Not Available" "15.4"         
## [4061] "17.1"          "16.2"          "14.1"          "Not Available"
## [4065] "16.1"          "18.9"          "12.4"          "16.0"         
## [4069] "Not Available" "Not Available" "17.2"          "16.3"         
## [4073] "15.8"          "15.4"          "16.8"          "15.2"         
## [4077] "16.3"          "Not Available" "14.4"          "18.0"         
## [4081] "16.7"          "16.5"          "16.2"          "13.3"         
## [4085] "15.5"          "17.1"          "Not Available" "17.6"         
## [4089] "14.3"          "14.8"          "15.3"          "16.6"         
## [4093] "18.7"          "18.1"          "15.6"          "15.9"         
## [4097] "15.5"          "Not Available" "15.8"          "15.2"         
## [4101] "14.3"          "14.9"          "12.0"          "16.1"         
## [4105] "17.7"          "15.2"          "16.6"          "15.6"         
## [4109] "Not Available" "17.2"          "Not Available" "13.6"         
## [4113] "16.1"          "Not Available" "Not Available" "Not Available"
## [4117] "14.5"          "Not Available" "15.5"          "14.7"         
## [4121] "Not Available" "16.2"          "Not Available" "Not Available"
## [4125] "Not Available" "17.7"          "14.9"          "Not Available"
## [4129] "Not Available" "15.9"          "Not Available" "14.6"         
## [4133] "16.8"          "Not Available" "Not Available" "15.7"         
## [4137] "Not Available" "15.2"          "Not Available" "Not Available"
## [4141] "Not Available" "Not Available" "13.1"          "Not Available"
## [4145] "16.8"          "16.1"          "14.9"          "Not Available"
## [4149] "13.8"          "Not Available" "Not Available" "15.2"         
## [4153] "Not Available" "Not Available" "Not Available" "16.2"         
## [4157] "15.6"          "Not Available" "Not Available" "Not Available"
## [4161] "Not Available" "14.0"          "15.2"          "Not Available"
## [4165] "Not Available" "Not Available" "17.1"          "Not Available"
## [4169] "Not Available" "Not Available" "15.7"          "Not Available"
## [4173] "Not Available" "Not Available" "15.0"          "Not Available"
## [4177] "Not Available" "Not Available" "Not Available" "Not Available"
## [4181] "Not Available" "Not Available" "Not Available" "Not Available"
## [4185] "Not Available" "Not Available" "Not Available" "Not Available"
## [4189] "Not Available" "Not Available" "Not Available" "Not Available"
## [4193] "Not Available" "Not Available" "Not Available" "Not Available"
## [4197] "Not Available" "Not Available" "16.0"          "Not Available"
## [4201] "Not Available" "Not Available" "Not Available" "Not Available"
## [4205] "Not Available" "Not Available" "Not Available" "Not Available"
## [4209] "Not Available" "Not Available" "Not Available" "Not Available"
## [4213] "Not Available" "Not Available" "Not Available" "Not Available"
## [4217] "Not Available" "Not Available" "Not Available" "14.9"         
## [4221] "15.2"          "15.8"          "14.4"          "Not Available"
## [4225] "15.5"          "14.5"          "13.5"          "Not Available"
## [4229] "15.5"          "Not Available" "15.4"          "Not Available"
## [4233] "Not Available" "13.2"          "Not Available" "Not Available"
## [4237] "14.3"          "Not Available" "Not Available" "Not Available"
## [4241] "Not Available" "14.7"          "14.7"          "Not Available"
## [4245] "Not Available" "16.6"          "Not Available" "15.0"         
## [4249] "16.3"          "Not Available" "Not Available" "Not Available"
## [4253] "Not Available" "Not Available" "Not Available" "Not Available"
## [4257] "Not Available" "Not Available" "Not Available" "Not Available"
## [4261] "Not Available" "15.4"          "14.8"          "15.6"         
## [4265] "16.5"          "16.0"          "15.4"          "16.6"         
## [4269] "Not Available" "18.2"          "Not Available" "19.5"         
## [4273] "15.4"          "16.9"          "14.9"          "Not Available"
## [4277] "14.8"          "17.1"          "16.9"          "15.3"         
## [4281] "14.9"          "14.0"          "17.7"          "14.3"         
## [4285] "14.6"          "15.1"          "14.6"          "17.2"         
## [4289] "14.4"          "15.9"          "15.3"          "13.9"         
## [4293] "15.4"          "14.4"          "14.1"          "14.7"         
## [4297] "17.6"          "Not Available" "15.8"          "16.5"         
## [4301] "13.4"          "17.9"          "17.2"          "14.0"         
## [4305] "17.7"          "16.2"          "16.3"          "15.4"         
## [4309] "14.6"          "13.5"          "14.3"          "15.8"         
## [4313] "15.0"          "15.5"          "15.1"          "13.8"         
## [4317] "14.8"          "14.3"          "Not Available" "17.4"         
## [4321] "15.9"          "17.9"          "18.2"          "Not Available"
## [4325] "16.6"          "15.1"          "15.3"          "18.1"         
## [4329] "Not Available" "15.6"          "15.3"          "14.0"         
## [4333] "Not Available" "Not Available" "13.9"          "Not Available"
## [4337] "16.3"          "16.7"          "14.7"          "15.9"         
## [4341] "13.3"          "15.4"          "16.6"          "14.9"         
## [4345] "16.0"          "14.7"          "16.6"          "17.5"         
## [4349] "12.5"          "17.2"          "15.2"          "14.1"         
## [4353] "14.9"          "17.1"          "Not Available" "17.7"         
## [4357] "13.7"          "Not Available" "Not Available" "14.6"         
## [4361] "Not Available" "16.4"          "Not Available" "Not Available"
## [4365] "Not Available" "15.4"          "16.1"          "14.6"         
## [4369] "13.4"          "15.6"          "14.4"          "17.2"         
## [4373] "16.9"          "15.9"          "17.4"          "14.0"         
## [4377] "18.6"          "17.6"          "15.6"          "13.3"         
## [4381] "17.8"          "16.0"          "13.4"          "18.6"         
## [4385] "Not Available" "13.9"          "Not Available" "17.4"         
## [4389] "13.6"          "13.8"          "Not Available" "16.6"         
## [4393] "15.2"          "Not Available" "17.9"          "13.1"         
## [4397] "19.1"          "Not Available" "17.8"          "16.1"         
## [4401] "14.1"          "18.5"          "Not Available" "17.9"         
## [4405] "17.8"          "17.6"          "Not Available" "14.3"         
## [4409] "18.7"          "15.9"          "Not Available" "17.1"         
## [4413] "Not Available" "16.9"          "16.0"          "Not Available"
## [4417] "16.6"          "Not Available" "Not Available" "Not Available"
## [4421] "Not Available" "Not Available" "Not Available" "Not Available"
## [4425] "Not Available" "Not Available" "Not Available" "Not Available"
## [4429] "Not Available" "Not Available" "Not Available" "Not Available"
## [4433] "Not Available" "Not Available" "Not Available" "16.8"         
## [4437] "Not Available" "Not Available" "Not Available" "Not Available"
## [4441] "Not Available" "Not Available" "Not Available" "Not Available"
## [4445] "Not Available" "Not Available" "Not Available" "Not Available"
## [4449] "Not Available" "Not Available" "Not Available" "Not Available"
## [4453] "Not Available" "15.4"          "15.9"          "16.4"         
## [4457] "14.5"          "17.1"          "15.1"          "17.9"         
## [4461] "14.5"          "14.6"          "15.4"          "14.4"         
## [4465] "18.2"          "Not Available" "14.5"          "15.5"         
## [4469] "15.5"          "15.3"          "16.1"          "17.4"         
## [4473] "15.2"          "15.4"          "16.2"          "16.4"         
## [4477] "Not Available" "15.5"          "15.3"          "Not Available"
## [4481] "15.8"          "17.2"          "15.5"          "15.6"         
## [4485] "16.7"          "15.8"          "Not Available" "15.1"         
## [4489] "Not Available" "Not Available" "Not Available" "Not Available"
## [4493] "Not Available" "Not Available" "Not Available" "Not Available"
## [4497] "Not Available" "Not Available" "Not Available" "Not Available"
## [4501] "Not Available" "Not Available" "15.3"          "Not Available"
## [4505] "15.6"          "Not Available" "Not Available" "17.9"         
## [4509] "16.2"          "16.4"          "18.6"          "Not Available"
## [4513] "14.5"          "Not Available" "15.8"          "16.5"         
## [4517] "17.2"          "16.6"          "Not Available" "16.2"         
## [4521] "17.2"          "17.1"          "16.1"          "15.9"         
## [4525] "13.9"          "14.7"          "Not Available" "17.3"         
## [4529] "16.2"          "16.7"          "11.8"          "16.1"         
## [4533] "14.3"          "Not Available" "14.2"          "14.3"         
## [4537] "14.8"          "16.9"          "14.2"          "17.7"         
## [4541] "15.8"          "16.5"          "18.2"          "14.6"         
## [4545] "15.6"          "15.5"          "14.0"          "15.6"         
## [4549] "Not Available" "16.1"          "16.1"          "13.9"         
## [4553] "13.7"          "15.8"          "16.4"          "19.3"         
## [4557] "Not Available" "13.0"          "18.6"          "12.9"         
## [4561] "13.1"          "14.6"          "16.5"          "15.7"         
## [4565] "17.2"          "14.2"          "Not Available" "Not Available"
## [4569] "Not Available" "15.5"          "15.2"          "Not Available"
## [4573] "Not Available" "Not Available" "Not Available" "Not Available"
## [4577] "Not Available" "Not Available" "Not Available" "Not Available"
## [4581] "Not Available" "Not Available" "Not Available" "Not Available"
## [4585] "Not Available" "Not Available" "Not Available" "Not Available"
## [4589] "Not Available" "Not Available" "Not Available" "Not Available"
## [4593] "16.4"          "Not Available" "Not Available" "Not Available"
## [4597] "Not Available" "Not Available" "Not Available" "Not Available"
## [4601] "Not Available" "Not Available" "Not Available" "Not Available"
## [4605] "Not Available" "Not Available" "16.1"          "Not Available"
## [4609] "Not Available" "15.4"          "Not Available" "Not Available"
## [4613] "Not Available" "Not Available" "Not Available" "Not Available"
## [4617] "Not Available" "Not Available" "Not Available" "Not Available"
## [4621] "Not Available" "Not Available" "Not Available" "Not Available"
## [4625] "Not Available" "Not Available" "Not Available" "Not Available"
## [4629] "Not Available" "Not Available" "Not Available" "16.2"         
## [4633] "Not Available" "18.3"          "Not Available" "Not Available"
## [4637] "Not Available" "14.9"          "15.3"          "Not Available"
## [4641] "Not Available" "Not Available" "Not Available" "Not Available"
## [4645] "Not Available" "Not Available" "Not Available" "Not Available"
## [4649] "Not Available" "Not Available" "Not Available" "Not Available"
## [4653] "Not Available" "Not Available" "Not Available" "Not Available"
## [4657] "Not Available" "Not Available" "Not Available" "Not Available"
## [4661] "Not Available" "15.7"          "Not Available" "16.5"         
## [4665] "Not Available" "Not Available" "Not Available" "Not Available"
## [4669] "Not Available" "Not Available" "Not Available" "15.1"         
## [4673] "15.3"          "13.7"          "Not Available" "15.4"         
## [4677] "14.6"          "16.4"          "Not Available" "Not Available"
## [4681] "Not Available" "17.8"          "Not Available" "Not Available"
## [4685] "Not Available" "14.2"          "Not Available" "14.8"         
## [4689] "15.4"          "Not Available" "Not Available" "Not Available"
## [4693] "14.9"          "Not Available" "Not Available" "Not Available"
## [4697] "Not Available" "Not Available" "Not Available" "Not Available"
## [4701] "Not Available" "Not Available" "Not Available" "Not Available"
## [4705] "Not Available" "Not Available"
```

```r
str(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
```

```
##  chr [1:4706] "14.3" "18.5" "18.1" "Not Available" ...
```


Find NA values

```r
df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == "Not Available"
```

```
##    [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE
##   [12] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
##   [23]  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
##   [34]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE
##   [45]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE
##   [56] FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
##   [67]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##   [78] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
##   [89]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
##  [100] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
##  [111]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [122] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
##  [133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
##  [144]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [155] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE
##  [166]  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE
##  [177]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [188]  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
##  [199] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [210] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
##  [221] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
##  [232] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [243]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [254]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [265]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
##  [276] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
##  [287] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [298] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [309]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
##  [320] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [331]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [342] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
##  [353] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [364] FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [375] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
##  [386] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
##  [397]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [408] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [419]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [430]  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [441]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
##  [452] FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [463]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [474] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
##  [485] FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
##  [496] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [507] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE
##  [518] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
##  [529] FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE
##  [540]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [551] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
##  [562] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE
##  [573]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
##  [584]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
##  [595]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
##  [606]  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE
##  [617] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [628] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
##  [639] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
##  [650]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
##  [661]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [672]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
##  [683] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [694] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [705] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE
##  [716] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE
##  [727] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [738] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [749] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
##  [760] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [771]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
##  [782] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [804] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
##  [815] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [826] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [837] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [848] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [859] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [870] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
##  [881] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [892]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
##  [903] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
##  [914] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [925] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [936] FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE
##  [947]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [958] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE
##  [969] FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
##  [980] FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE
##  [991] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
## [1002] FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
## [1013] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1024]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1035]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
## [1046] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE
## [1057]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1068] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1079]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1090]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1101] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [1112] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1123] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1134]  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1156] FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1167]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1178] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [1189] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1200] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1211] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [1222] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE
## [1233]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1244]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
## [1255]  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1266]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [1288] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1299] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1310] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1321] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
## [1332] FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
## [1343] FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [1354]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1365]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1376] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
## [1387] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1398] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE
## [1409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1420] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE
## [1431]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1442]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1453]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1464]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1475]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
## [1486] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
## [1497]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
## [1508]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
## [1519] FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
## [1530]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [1541] FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
## [1552]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1563]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1574]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1585]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1596]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1607]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
## [1618]  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [1629] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1640] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1651]  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
## [1662] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1673]  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1684] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1695]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1706]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
## [1717] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE
## [1728] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1739] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1750]  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE
## [1761]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
## [1772] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
## [1783]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE
## [1794] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
## [1805]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1816]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [1827]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1838] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1849] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [1860] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1871] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1882] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1893] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [1904] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [1915] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [1926] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1937] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1948] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [1959] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [1970] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [1981]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [1992] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2003] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
## [2014] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE
## [2025] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [2036] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [2047] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [2058]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [2069] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
## [2080] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2091] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2102]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2113]  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
## [2124]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [2135] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE
## [2146]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [2157] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
## [2168]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2179]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2190]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2201]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2212]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2223]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2234]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
## [2245]  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [2256] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE
## [2267]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
## [2278]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE
## [2289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2300]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE
## [2311]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2322]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
## [2333] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2344] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
## [2355] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE
## [2366] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [2377] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [2388]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2399] FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE
## [2410]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2421]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2432]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
## [2443] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2454]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2465]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2476]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2487]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [2498] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2509]  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2520]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2531]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2542]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2553]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2564]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2575]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
## [2586] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [2597] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
## [2608]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2619] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
## [2630] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [2641] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [2652] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2663] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2674] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2696] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [2707] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
## [2718]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
## [2729]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [2740]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2751] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [2762] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2773] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2784] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [2795] FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
## [2806] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
## [2817] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
## [2828] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2839] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2850] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [2861] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [2872] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
## [2883]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2894] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [2905] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [2916]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [2927] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2938] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [2949] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [2960] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [2971] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2982] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2993] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
## [3004] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3015]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3026]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [3037]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
## [3048]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
## [3059]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [3070]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3081] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3092] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [3103] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3114] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3125] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [3136] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
## [3147] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3158] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [3169] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [3180]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3191]  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3202] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [3213]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
## [3224]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
## [3235] FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
## [3246] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE
## [3257] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE
## [3268] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE
## [3279] FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
## [3290]  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
## [3301]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3312]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE
## [3323]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3334]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3345]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3356]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3367]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [3378] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
## [3389]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [3400] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [3411]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE
## [3422]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
## [3433] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3444] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3455] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [3466]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [3477] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3488] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3499] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [3510] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3521] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3532] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3543]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
## [3554] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3565] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [3576] FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3587]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3598]  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE
## [3609] FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE
## [3620] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
## [3631]  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [3642] FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
## [3653]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [3664] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3675]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
## [3686]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE
## [3697]  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
## [3708] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3719]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3730] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [3741] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3752] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3763]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [3774] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3785]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
## [3796] FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE
## [3807]  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [3818]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3829] FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE
## [3840] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE
## [3851] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE
## [3862] FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
## [3873] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
## [3884]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
## [3895] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3906] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3917] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
## [3928] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE
## [3939] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [3950] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
## [3961] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [3972] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
## [3983] FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
## [3994] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
## [4005] FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE
## [4016] FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
## [4027]  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
## [4038]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
## [4049]  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE
## [4060] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
## [4071] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [4082] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [4093] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [4104] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE
## [4115]  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
## [4126] FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE
## [4137]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE
## [4148]  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
## [4159]  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
## [4170]  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4181]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4192]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
## [4203]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4214]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
## [4225] FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
## [4236]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE
## [4247]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4258]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4269]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [4280] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4291] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
## [4302] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4313] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
## [4324]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE
## [4335] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4346] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [4357] FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE
## [4368] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4379] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE
## [4390] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
## [4401] FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
## [4412] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4423]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4434]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4445]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
## [4456] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [4467] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## [4478] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## [4489]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4500]  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE
## [4511] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## [4522] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [4533] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4544] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
## [4555] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4566] FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4577]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4588]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4599]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
## [4610] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4621]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4632] FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
## [4643]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [4654]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
## [4665]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
## [4676] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
## [4687]  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [4698]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```




```r
df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[1:10]
```

```
##  [1] "14.3"          "18.5"          "18.1"          "Not Available"
##  [5] "Not Available" "Not Available" "17.7"          "18.0"         
##  [9] "15.9"          "Not Available"
```

```r
# as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)[1:10]
# as.character(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)[1:10]
as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)[1:10]
```

```
## Warning: NAs introduced by coercion
```

```
##  [1] 14.3 18.5 18.1   NA   NA   NA 17.7 18.0 15.9   NA
```


Max and Min
[refer-1](http://stat.ethz.ch/R-manual/R-devel/library/base/html/Extremes.html)




```r
max(as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
```

```
## Warning: NAs introduced by coercion
```

```
## [1] NA
```

```r
min(as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
```

```
## Warning: NAs introduced by coercion
```

```
## [1] NA
```

```r
max(as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), 
    na.rm = T)
```

```
## Warning: NAs introduced by coercion
```

```
## [1] 21.9
```

```r
min(as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), 
    na.rm = T)
```

```
## Warning: NAs introduced by coercion
```

```
## [1] 10.1
```




```r
max(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm = T)
```

```
## [1] "Not Available"
```

```r
min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm = T)
```

```
## [1] "10.1"
```




```r
df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T)
```

```
##    [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [45] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [56] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [67] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [78] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##   [89] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [100] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [111] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [122] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [144] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [155] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [166] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [177] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [188] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [199] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [210] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [221] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [232] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [243] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [254] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [276] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [287] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [298] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [309] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [320] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [331] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [342] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [353] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [364] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [375] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [386] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [408] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [419] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [430] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [452] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [463] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [474] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [485] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [496] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [507] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [518] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [529] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [540] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [551] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [562] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [573] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [584] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [595] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [606] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [617] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [628] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [639] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [650] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [661] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [672] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [683] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [694] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [705] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [716] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [727] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [738] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [749] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [760] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [771] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [782] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [804] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [815] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [826] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [837] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [848] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [859] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [870] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [881] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [892] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [903] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [914] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [925] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [936] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [947] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [958] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [969] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [980] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##  [991] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1002] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1013] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1024] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1035] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1046] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1057] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1068] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1079] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1090] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1101] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1112] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1123] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1134] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1156] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1167] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1178] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1189] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1200] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1211] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1222] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1233] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1244] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1255] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1266] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1288] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1299] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1310] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1321] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1332] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1343] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1354] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1365] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1376] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1387] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1398] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1420] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1431] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1442] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1464] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1475] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1486] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1497] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1508] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1519] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1530] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1541] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1552] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1563] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1574] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1585] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1596] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1607] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1618] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1629] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1640] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1651] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1662] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1673] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1684] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1695] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1706] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1717] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1728] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1739] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1750] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1761] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1772] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1783] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1794] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1805] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1816] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1827] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1838] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1849] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1860] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1871] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1882] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1893] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1904] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1915] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1926] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1937] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1948] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1959] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1970] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1981] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [1992] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2003] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2014] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2025] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2036] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2047] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2058] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2069] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2080] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2091] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2102] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2113] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2124] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2135] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2146] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2157] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2168] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2179] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2190] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2201] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2212] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2223] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2234] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2245] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2256] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2267] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2278] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2300] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2311] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2322] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2333] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2344] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2355] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2366] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2377] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2388] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2399] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2410] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2421] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2432] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2443] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2454] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2465] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2476] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2487] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2498] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2509] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2520] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2531] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2542] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2553] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2564] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2575] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2586] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2597] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2608] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2619] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2630] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2641] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2652] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2663] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2674] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2696] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2707] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2718] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2729] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2740] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2751] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2762] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2773] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2784] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2795] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2806] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2817] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2828] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2839] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2850]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2861] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2872] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2883] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2894] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2905] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2916] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2927] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2938] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2949] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2960] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2971] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2982] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [2993] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3004] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3015] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3026] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3037] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3048] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3059] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3070] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3081] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3092] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3103] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3114] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3125] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3136] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3147] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3158] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3169] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3180] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3191] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3202] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3213] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3224] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3235] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3246] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3257] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3268] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3279] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3290] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3301] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3312] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3323] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3334] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3345] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3356] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3367] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3378] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3389] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3400] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3411] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3422] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3433] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3444] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3455] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3466] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3477] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3488] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3499] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3510] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3521] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3532] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3543] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3554] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3565] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3576] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3587] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3598] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3609] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3620] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3631] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3642] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3653] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3664] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3675] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3686] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3697] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3708] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3719] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3730] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3741] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3752] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3763] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3774] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3785] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3796] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3807] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3818] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3829] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3840] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3851] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3862] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3873] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3884] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3895] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3906] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3917] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3928] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3939] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3950] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3961] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3972] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3983] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [3994] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4005] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4016] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4027] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4038] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4049] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4060] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4071] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4082] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4093] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4104] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4115] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4126] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4148] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4159] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4170] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4181] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4192] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4203] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4214] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4225] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4236] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4247] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4258] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4269] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4280] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4291] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4302] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4313] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4324] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4335] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4346] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4357] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4368] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4379] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4390] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4401] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4412] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4423] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4434] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4445] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4456] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4467] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4478] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4489] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4500] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4511] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4522] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4533] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4544] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4555] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4566] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4577] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4588] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4599] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4610] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4621] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4632] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4643] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4654] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4665] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4676] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4687] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [4698] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```



```r
any(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T))
```

```
## [1] TRUE
```



```r
sum(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T))
```

```
## [1] 1
```



Number of matches found

```r
sum(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T))
```

```
## [1] 1
```




```r
df[df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T), 2]
```

```
## [1] "NYU HOSPITALS CENTER"
```


Find the details for Texas

```r
df1 <- df[df$State == "TX", ]
```




```r
df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T), 2]
```

```
## [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
```



Resolve Conflict by choosing the first hospital in alphabetical order

```r
min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
    na.rm = T), 2])
```

```
## [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
```





Find the details for MD

```r
df1 <- df[df$State == "MD", ]
```




```r
df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
    na.rm = T), 2]
```

```
## [1] "CALVERT MEMORIAL HOSPITAL"      "HOWARD COUNTY GENERAL HOSPITAL"
```


Find the details for NY

```r
df1 <- df[df$State == "NY", ]
```




```r
df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
    na.rm = T), 2]
```

```
## [1] "ALBANY MEDICAL CENTER HOSPITAL"                    
## [2] "JOHN T MATHER MEMORIAL HOSPITAL  OF PORT JEFFERSON"
## [3] "LUTHERAN MEDICAL CENTER"
```



```r
min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, 
    na.rm = T), 2])
```

```
## [1] "ALBANY MEDICAL CENTER HOSPITAL"
```

```r

min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
```

```
## [1] "10.0"
```

```r
sum(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == 10)
```

```
## [1] 0
```

```r
sum(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == "10.0")
```

```
## [1] 3
```




Question#3
=================================================
##Ranking hospitals by outcome in a state


Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. For example, the call


```r
rm(list = ls())
```




```r
rankhospital <- function(state, outcome, num) {
    # Read the file outcome-of-care-measures.csv
    df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", 
        Hospital.Name = "character"))
    
    df[, 11] <- suppressWarnings(as.numeric(df[, 11]))
    df[, 17] <- suppressWarnings(as.numeric(df[, 17]))
    df[, 23] <- suppressWarnings(as.numeric(df[, 23]))
    
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    if (!(state %in% df$State)) {
        stop("invalid state")
    }
    
    if (!(outcome %in% outcomes)) {
        stop("invalid outcome")
    }
    
    
    if (outcome == "heart attack") {
        df1 <- df[df$State == state, c(2, 11)]
        names(df1)[2] <- "Rate"
    }
    
    if (outcome == "heart failure") {
        df1 <- df[df$State == state, c(2, 17)]
        names(df1)[2] <- "Rate"
    }
    
    
    if (outcome == "pneumonia") {
        df1 <- df[df$State == state, c(2, 23)]
        names(df1)[2] <- "Rate"
    }
    # Remove rows where Ratings are not known.
    df1 <- df1[!is.na(df1$Rate), ]
    # Order the dataframe by Names to help in Ranking
    df1 <- df1[order(df1[1]), ]
    # head(df1) tail(df1)
    
    # Set Rank
    df1$rank <- rank(df1$Rate, ties.method = "first")
    
    # Return the values based on data provided
    if (num == "best") {
        return(df1[df1$rank == min(df1$rank), 1])
    } else if (num == "worst") {
        return(df1[df1$rank == max(df1$rank), 1])
    } else if ((num <= max(df1$rank)) | (num >= min(df1$rank))) {
        return(df1[df1$rank == num, 1])
    } else if ((num > max(df1$rank)) | (num < min(df1$rank))) {
        NA
    }
}
```



Unit tests

```r
rm(list = ls())
rankhospital("TX", "heart failure", 4)
```

```
## Error: could not find function "rankhospital"
```

```r
rankhospital("MD", "heart attack", "worst")
```

```
## Error: could not find function "rankhospital"
```

```r
rankhospital("MD", "heart attack", "best")
```

```
## Error: could not find function "rankhospital"
```

```r
rankhospital("MN", "heart attack", 5000)
```

```
## Error: could not find function "rankhospital"
```

```r
rankhospital("WA", "pneumonia", 1000)
```

```
## Error: could not find function "rankhospital"
```


Submission

```r
rm(list = ls())
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
submit()
```

```
## [1] 'best' part 1
## [2] 'best' part 2
## [3] 'best' part 3
## [4] 'rankhospital' part 1
## [5] 'rankhospital' part 2
## [6] 'rankhospital' part 3
## [7] 'rankhospital' part 4
## [8] 'rankall' part 1
## [9] 'rankall' part 2
## [10] 'rankall' part 3
## Which part are you submitting [1-10]?
```

```
## Error: missing value where TRUE/FALSE needed
```




```r
returnNA <- function() {
    return(NA)
}

returnNA()
```

```
## [1] NA
```



```r
`?`(return)
```




The function reads the outcome-of-care-measures.csv file


```r
df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", Hospital.Name = "character"))

df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
```

```
## Warning: NAs introduced by coercion
```

```r

df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
```

```
## Warning: NAs introduced by coercion
```

```r

df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
```

```
## Warning: NAs introduced by coercion
```



```r
class(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
```

```
## [1] "numeric"
```

```r
class(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
```

```
## [1] "numeric"
```

```r
class(df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
```

```
## [1] "numeric"
```



```r
state <- "NY"
outcome <- "heart attack"
outcome <- "heart failure"
outcome <- "penumonia"
outcomes <- c("heart attack", "heart failure", "pneumonia")
```


refer
[link1](http://stackoverflow.com/a/1296745/2356016)


```r

if (outcome == "heart attack") {
    df1 <- df[df$State == state, c(2, 11)]
    names(df1)[2] <- "Rate"
}

if (outcome == "heart failure") {
    df1 <- df[df$State == state, c(2, 17)]
    names(df1)[2] <- "Rate"
}


if (outcome == "pneumonia") {
    df1 <- df[df$State == state, c(2, 23)]
    names(df1)[2] <- "Rate"
}
# Remove rows where Ratings are not known.
df1 <- df1[!is.na(df1$Rate), ]
```

```
## Error: object 'df1' not found
```

```r
# Order the dataframe by Names to help in Ranking
df1 <- df1[order(df1[1]), ]
```

```
## Error: object 'df1' not found
```

```r
head(df1)
```

```
## Error: object 'df1' not found
```

```r
tail(df1)
```

```
## Error: object 'df1' not found
```



```r
`?`(rank)
```



```r
`?`(order)
```




```r
class(df)
```

```
## [1] "data.frame"
```


Assign rank to dataframe

```r
df1$rank <- rank(df1$Rate, ties.method = "first")
```

```
## Error: object 'df1' not found
```



Test the results by viewing the results by sorting by ranks 

```r
df1[order(df1[3]), ]
```

```
## Error: object 'df1' not found
```

```r
head(df1[order(df1[3]), ], 20)
```

```
## Error: object 'df1' not found
```

```r
tail(df1[order(df1[3]), ], 20)
```

```
## Error: object 'df1' not found
```



Find min max and num specific ranking rows 

```r
df1[df1$rank == max(df1$rank), 1]
```

```
## Error: object 'df1' not found
```

```r
df1[df1$rank == min(df1$rank), 1]
```

```
## Error: object 'df1' not found
```

```r
df1[df1$rank == 1, 1]
```

```
## Error: object 'df1' not found
```

```r
df1[df1$rank == 1, 1]
```

```
## Error: object 'df1' not found
```

```r
df1[df1$rank == 171, 1]
```

```
## Error: object 'df1' not found
```



Return the results

```r
if (num == "best") {
    return(df1[df1$rank == min(df1$rank), 1])
} else if (num == "worst") {
    return(df1[df1$rank == max(df1$rank), 1])
} else if ((num <= max(df1$rank)) | (num >= min(df1$rank))) {
    return(df1[df1$rank == num, 1])
} else {
    return(NA)
}
```

```
## Error: object 'num' not found
```



```r

num <- "best"

if (num == "best") {
    return(df1[df1$rank == min(df1$rank), 1])
}
```

```
## Error: object 'df1' not found
```



Remove results with NA ratings 

```r
df1[!is.na(df1$Rate), ]
```

```
## Error: object 'df1' not found
```




```r
str(df)
```

```
## 'data.frame':	4706 obs. of  46 variables:
##  $ Provider.Number                                                                      : Factor w/ 4706 levels "010001","010005",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ Hospital.Name                                                                        : chr  "SOUTHEAST ALABAMA MEDICAL CENTER" "MARSHALL MEDICAL CENTER SOUTH" "ELIZA COFFEE MEMORIAL HOSPITAL" "MIZELL MEMORIAL HOSPITAL" ...
##  $ Address.1                                                                            : Factor w/ 4681 levels " 1200 EAST PECAN ST",..: 454 2054 1690 3830 227 4081 3145 1551 128 1319 ...
##  $ Address.2                                                                            : logi  NA NA NA NA NA NA ...
##  $ Address.3                                                                            : logi  NA NA NA NA NA NA ...
##  $ City                                                                                 : Factor w/ 2926 levels "ABBEVILLE","ABERDEEN",..: 698 269 870 1910 1511 1064 241 900 19 241 ...
##  $ State                                                                                : Factor w/ 54 levels "AK","AL","AR",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ ZIP.Code                                                                             : int  36301 35957 35631 36467 36049 35976 35235 35968 35007 35233 ...
##  $ County.Name                                                                          : Factor w/ 1498 levels "ABBEVILLE","ACADIA",..: 642 844 770 340 349 844 684 381 1240 684 ...
##  $ Phone.Number                                                                         : num  3.35e+09 2.57e+09 2.57e+09 3.34e+09 3.34e+09 ...
##  $ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack                            : num  14.3 18.5 18.1 NA NA NA 17.7 18 15.9 NA ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 2 2 4 4 4 2 2 2 3 ...
##  $ Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack : Factor w/ 83 levels "10.0","10.1",..: 22 48 49 83 83 83 43 42 27 83 ...
##  $ Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack : Factor w/ 121 levels "12.4","12.5",..: 38 98 86 121 121 121 89 96 68 121 ...
##  $ Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack       : Factor w/ 596 levels "1","10","100",..: 506 366 266 58 579 146 147 594 116 596 ...
##  $ Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack                 : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 1 1 3 3 3 1 1 1 2 ...
##  $ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure                           : num  11.4 15.2 11.3 13.6 13.8 12.5 10.9 16.6 13.6 NA ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 5 2 2 2 2 2 5 2 3 ...
##  $ Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure: Factor w/ 86 levels "10.0","10.1",..: 81 23 77 1 85 85 71 25 7 86 ...
##  $ Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure: Factor w/ 136 levels "10.0","10.1",..: 38 89 40 83 88 57 39 117 72 136 ...
##  $ Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure      : Factor w/ 850 levels "1","10","100",..: 719 244 549 48 556 155 371 113 275 850 ...
##  $ Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure                : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 1 1 1 1 1 1 1 1 2 ...
##  $ Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia                               : num  10.9 13.9 13.4 14.9 15.8 8.7 16.2 15.8 10.7 NA ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia     : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 2 2 2 2 1 5 5 2 3 ...
##  $ Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia    : Factor w/ 102 levels "10.0","10.1",..: 88 14 13 17 15 70 35 22 84 102 ...
##  $ Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia    : Factor w/ 151 levels "10.0","10.1",..: 38 71 59 91 116 11 97 103 37 151 ...
##  $ Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia          : Factor w/ 772 levels "1","10","100",..: 340 341 710 193 571 278 415 167 281 772 ...
##  $ Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia                    : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 1 1 1 1 1 1 1 1 2 ...
##  $ Hospital.30.Day.Readmission.Rates.from.Heart.Attack                                  : Factor w/ 96 levels "15.1","15.4",..: 38 96 26 96 96 96 72 46 51 96 ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack        : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 4 2 4 4 4 2 2 2 3 ...
##  $ Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack     : Factor w/ 89 levels "12.4","12.5",..: 41 89 24 89 89 89 60 33 43 89 ...
##  $ Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack     : Factor w/ 108 levels "17.9","18.2",..: 35 108 33 108 108 108 86 64 62 108 ...
##  $ Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack             : Factor w/ 632 levels "1","10","100",..: 553 154 291 1 344 56 158 576 141 632 ...
##  $ Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack                       : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 3 1 3 3 3 1 1 1 2 ...
##  $ Hospital.30.Day.Readmission.Rates.from.Heart.Failure                                 : Factor w/ 125 levels "19.0","19.2",..: 46 34 7 80 56 48 22 73 60 125 ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure       : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 2 1 2 2 2 2 2 2 3 ...
##  $ Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure    : Factor w/ 120 levels "16.0","16.1",..: 52 31 11 63 38 40 21 60 55 120 ...
##  $ Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure    : Factor w/ 132 levels "21.2","21.7",..: 41 37 7 95 78 58 23 89 63 132 ...
##  $ Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure            : Factor w/ 998 levels "1","10","100",..: 937 358 720 138 699 235 524 207 423 998 ...
##  $ Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure                      : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 1 1 1 1 1 1 1 1 2 ...
##  $ Hospital.30.Day.Readmission.Rates.from.Pneumonia                                     : Factor w/ 109 levels "14.1","14.3",..: 29 34 27 52 38 45 35 35 27 109 ...
##  $ Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia           : Factor w/ 5 levels "Better than U.S. National Rate",..: 2 2 2 2 2 2 2 2 2 3 ...
##  $ Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia        : Factor w/ 101 levels "11.5","11.6",..: 30 36 33 45 26 43 39 30 28 101 ...
##  $ Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia        : Factor w/ 119 levels "16.9","17.1",..: 34 36 25 62 58 52 37 48 33 119 ...
##  $ Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia                : Factor w/ 801 levels "1","10","100",..: 378 348 735 215 540 295 434 166 302 801 ...
##  $ Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia                          : Factor w/ 3 levels "","No data are available from the hospital for this measure",..: 1 1 1 1 1 1 1 1 1 2 ...
```



```r
names(df)
```

```
##  [1] "Provider.Number"                                                                      
##  [2] "Hospital.Name"                                                                        
##  [3] "Address.1"                                                                            
##  [4] "Address.2"                                                                            
##  [5] "Address.3"                                                                            
##  [6] "City"                                                                                 
##  [7] "State"                                                                                
##  [8] "ZIP.Code"                                                                             
##  [9] "County.Name"                                                                          
## [10] "Phone.Number"                                                                         
## [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                            
## [12] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
## [13] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
## [14] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
## [15] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"       
## [16] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"                 
## [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                           
## [18] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
## [19] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [20] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [21] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"      
## [22] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"                
## [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                               
## [24] "Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"     
## [25] "Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
## [26] "Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    
## [27] "Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"          
## [28] "Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"                    
## [29] "Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                                  
## [30] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"        
## [31] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
## [32] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"     
## [33] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"             
## [34] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack"                       
## [35] "Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                                 
## [36] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"       
## [37] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
## [38] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"    
## [39] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"            
## [40] "Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure"                      
## [41] "Hospital.30.Day.Readmission.Rates.from.Pneumonia"                                     
## [42] "Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"           
## [43] "Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
## [44] "Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia"        
## [45] "Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia"                
## [46] "Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia"
```



```r
head(df)
```

```
##   Provider.Number                    Hospital.Name
## 1          010001 SOUTHEAST ALABAMA MEDICAL CENTER
## 2          010005    MARSHALL MEDICAL CENTER SOUTH
## 3          010006   ELIZA COFFEE MEMORIAL HOSPITAL
## 4          010007         MIZELL MEMORIAL HOSPITAL
## 5          010008      CRENSHAW COMMUNITY HOSPITAL
## 6          010010    MARSHALL MEDICAL CENTER NORTH
##                    Address.1 Address.2 Address.3         City State
## 1     1108 ROSS CLARK CIRCLE        NA        NA       DOTHAN    AL
## 2 2505 U S HIGHWAY 431 NORTH        NA        NA         BOAZ    AL
## 3         205 MARENGO STREET        NA        NA     FLORENCE    AL
## 4              702 N MAIN ST        NA        NA          OPP    AL
## 5        101 HOSPITAL CIRCLE        NA        NA      LUVERNE    AL
## 6    8000 ALABAMA HIGHWAY 69        NA        NA GUNTERSVILLE    AL
##   ZIP.Code County.Name Phone.Number
## 1    36301     HOUSTON    3.348e+09
## 2    35957    MARSHALL    2.566e+09
## 3    35631  LAUDERDALE    2.568e+09
## 4    36467   COVINGTON    3.345e+09
## 5    36049    CRENSHAW    3.343e+09
## 6    35976    MARSHALL    2.566e+09
##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                      14.3
## 2                                                      18.5
## 3                                                      18.1
## 4                                                        NA
## 5                                                        NA
## 6                                                        NA
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                No Different than U.S. National Rate
## 2                                                No Different than U.S. National Rate
## 3                                                No Different than U.S. National Rate
## 4                                                           Number of Cases Too Small
## 5                                                           Number of Cases Too Small
## 6                                                           Number of Cases Too Small
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                 12.1
## 2                                                                                 14.7
## 3                                                                                 14.8
## 4                                                                        Not Available
## 5                                                                        Not Available
## 6                                                                        Not Available
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                 17.0
## 2                                                                                 23.0
## 3                                                                                 21.8
## 4                                                                        Not Available
## 5                                                                        Not Available
## 6                                                                        Not Available
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                            666
## 2                                                                             44
## 3                                                                            329
## 4                                                                             14
## 5                                                                              9
## 6                                                                             22
##                                Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
## 1                                                                                                  
## 2                                                                                                  
## 3                                                                                                  
## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
##   Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                       11.4
## 2                                                       15.2
## 3                                                       11.3
## 4                                                       13.6
## 5                                                       13.8
## 6                                                       12.5
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                 No Different than U.S. National Rate
## 2                                                        Worse than U.S. National Rate
## 3                                                 No Different than U.S. National Rate
## 4                                                 No Different than U.S. National Rate
## 5                                                 No Different than U.S. National Rate
## 6                                                 No Different than U.S. National Rate
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                                   9.5
## 2                                                                                  12.2
## 3                                                                                   9.1
## 4                                                                                  10.0
## 5                                                                                   9.9
## 6                                                                                   9.9
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                                  13.7
## 2                                                                                  18.8
## 3                                                                                  13.9
## 4                                                                                  18.2
## 5                                                                                  18.7
## 6                                                                                  15.6
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                             741
## 2                                                                             234
## 3                                                                             523
## 4                                                                             113
## 5                                                                              53
## 6                                                                             163
##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
## 1                                                                      
## 2                                                                      
## 3                                                                      
## 4                                                                      
## 5                                                                      
## 6                                                                      
##   Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                   10.9
## 2                                                   13.9
## 3                                                   13.4
## 4                                                   14.9
## 5                                                   15.8
## 6                                                    8.7
##   Comparison.to.U.S..Rate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                             No Different than U.S. National Rate
## 2                                             No Different than U.S. National Rate
## 3                                             No Different than U.S. National Rate
## 4                                             No Different than U.S. National Rate
## 5                                             No Different than U.S. National Rate
## 6                                                   Better than U.S. National Rate
##   Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                               8.6
## 2                                                                              11.3
## 3                                                                              11.2
## 4                                                                              11.6
## 5                                                                              11.4
## 6                                                                               6.8
##   Upper.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                              13.7
## 2                                                                              17.0
## 3                                                                              15.8
## 4                                                                              19.0
## 5                                                                              21.5
## 6                                                                              11.0
##   Number.of.Patients...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                         371
## 2                                                                         372
## 3                                                                         836
## 4                                                                         239
## 5                                                                          61
## 6                                                                         315
##   Footnote...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
## 1                                                                  
## 2                                                                  
## 3                                                                  
## 4                                                                  
## 5                                                                  
## 6                                                                  
##   Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                19.0
## 2                                       Not Available
## 3                                                17.8
## 4                                       Not Available
## 5                                       Not Available
## 6                                       Not Available
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                          No Different than U.S. National Rate
## 2                                                     Number of Cases Too Small
## 3                                          No Different than U.S. National Rate
## 4                                                     Number of Cases Too Small
## 5                                                     Number of Cases Too Small
## 6                                                     Number of Cases Too Small
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                             16.6
## 2                                                                    Not Available
## 3                                                                             14.9
## 4                                                                    Not Available
## 5                                                                    Not Available
## 6                                                                    Not Available
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                             21.7
## 2                                                                    Not Available
## 3                                                                             21.5
## 4                                                                    Not Available
## 5                                                                    Not Available
## 6                                                                    Not Available
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                      728
## 2                                                                       21
## 3                                                                      342
## 4                                                                        1
## 5                                                                        4
## 6                                                                       13
##                                      Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Attack
## 1                                                                                                  
## 2 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 3                                                                                                  
## 4 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 5 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
## 6 number of cases is too small (fewer than 25) to reliably tell how well the hospital is performing
##   Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                 23.7
## 2                                                 22.5
## 3                                                 19.8
## 4                                                 27.1
## 5                                                 24.7
## 6                                                 23.9
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                           No Different than U.S. National Rate
## 2                                           No Different than U.S. National Rate
## 3                                                 Better than U.S. National Rate
## 4                                           No Different than U.S. National Rate
## 5                                           No Different than U.S. National Rate
## 6                                           No Different than U.S. National Rate
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                              21.3
## 2                                                                              19.2
## 3                                                                              17.2
## 4                                                                              22.4
## 5                                                                              19.9
## 6                                                                              20.1
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                              26.5
## 2                                                                              26.1
## 3                                                                              22.9
## 4                                                                              31.9
## 5                                                                              30.2
## 6                                                                              28.2
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                       891
## 2                                                                       264
## 3                                                                       614
## 4                                                                       135
## 5                                                                        59
## 6                                                                       173
##   Footnote...Hospital.30.Day.Readmission.Rates.from.Heart.Failure
## 1                                                                
## 2                                                                
## 3                                                                
## 4                                                                
## 5                                                                
## 6                                                                
##   Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                             17.1
## 2                                             17.6
## 3                                             16.9
## 4                                             19.4
## 5                                             18.0
## 6                                             18.7
##   Comparison.to.U.S..Rate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                       No Different than U.S. National Rate
## 2                                       No Different than U.S. National Rate
## 3                                       No Different than U.S. National Rate
## 4                                       No Different than U.S. National Rate
## 5                                       No Different than U.S. National Rate
## 6                                       No Different than U.S. National Rate
##   Lower.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                          14.4
## 2                                                                          15.0
## 3                                                                          14.7
## 4                                                                          15.9
## 5                                                                          14.0
## 6                                                                          15.7
##   Upper.Readmission.Estimate...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                          20.4
## 2                                                                          20.6
## 3                                                                          19.5
## 4                                                                          23.2
## 5                                                                          22.8
## 6                                                                          22.2
##   Number.of.Patients...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                                   400
## 2                                                                   374
## 3                                                                   842
## 4                                                                   254
## 5                                                                    56
## 6                                                                   326
##   Footnote...Hospital.30.Day.Readmission.Rates.from.Pneumonia
## 1                                                            
## 2                                                            
## 3                                                            
## 4                                                            
## 5                                                            
## 6
```



```r
grep("^Hospital.30.Day.Death..Mortality..Rates.from", names(df))
```

```
## [1] 11 17 23
```

```r
names(df)[grep("^Hospital.30.Day.Death..Mortality..Rates.from", names(df))]
```

```
## [1] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
## [2] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [3] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
```



Question#4
=================================================
##4 Ranking hospitals in all states

Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital rank-ing (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.



Reset everything

```r
rm(list = ls())
```





```r
rankall <- function(outcome, num = "best") {
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    if (!(outcome %in% outcomes)) {
        stop("invalid outcome")
    }
    
    df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
        Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", 
        Hospital.Name = "character"))
    
    # convert ratings to numeric
    df[, 11] <- suppressWarnings(as.numeric(df[, 11]))
    df[, 17] <- suppressWarnings(as.numeric(df[, 17]))
    df[, 23] <- suppressWarnings(as.numeric(df[, 23]))
    
    # Create a subset dataframe for given outcome
    if (outcome == "heart attack") {
        df1 <- df[, c(2, 7, 11)]
    } else if (outcome == "heart failure") {
        df1 <- df[, c(2, 7, 17)]
    } else if (outcome == "pneumonia") {
        df1 <- df[, c(2, 7, 23)]
    }
    
    # Rename Column name of Hospital name to Hospital
    names(df1)[1] <- "hospital"
    names(df1)[2] <- "state"
    names(df1)[3] <- "Rate"
    
    # Remove rows where Ratings are not known.
    df1 <- df1[!is.na(df1$Rate), ]
    # head(df1)
    
    library(data.table)
    dt <- as.data.table(df1[, c("hospital", "state", "Rate")])
    # head(dt) Add ranking to the table dt1 <- dt[,list(hospital, rank =
    # rank(Rate,ties.method = 'first')), by = state]
    setkey(dt, state, Rate)
    dt1 <- dt[, list(hospital, rank = rank(Rate, ties.method = "random")), by = state]
    # dt1 <- dt[,list(hospital, Rate, rank = rank(Rate,ties.method = 'last')),
    # by = state]
    
    # =======================
    if (num == "best") {
        dt2 <- dt1[, list(rank = 1), by = state]
    } else if (num == "worst") {
        dt2 <- dt1[, list(rank = max(rank)), by = state]
    } else {
        dt2 <- dt1[, list(rank = num), by = state]
    }
    # =======================
    setkey(dt2, state, rank)
    setkey(dt1, state, rank)
    return(as.data.frame(dt1[dt2, ][, list(hospital, state, rank)]))
}
```


Unit tests


```r
rm(list = ls())
source("./rankall.R")
head(rankall("heart attack", 20), 10)
```

```
##                               hospital state
## 1                                 <NA>    AK
## 2       D W MCMILLAN MEMORIAL HOSPITAL    AL
## 3    FAYETTEVILLE AR VA MEDICAL CENTER    AR
## 4  JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
## 5       VA SAN DIEGO HEALTHCARE SYSTEM    CA
## 6             SKY RIDGE MEDICAL CENTER    CO
## 7              MIDSTATE MEDICAL CENTER    CT
## 8                                 <NA>    DC
## 9                                 <NA>    DE
## 10       GOOD SAMARITAN MEDICAL CENTER    FL
```

```r
tail(rankall("pneumonia", "worst"), 3)
```

```
##                                      hospital state
## 52 MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
## 53                     PLATEAU MEDICAL CENTER    WV
## 54           NORTH BIG HORN HOSPITAL DISTRICT    WY
```

```r
tail(rankall("heart failure"), 10)
```

```
##                                                             hospital state
## 45                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
## 46                                        FORT DUNCAN MEDICAL CENTER    TX
## 47 VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
## 48                                          SENTARA POTOMAC HOSPITAL    VA
## 49                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
## 50                                              SPRINGFIELD HOSPITAL    VT
## 51                                         HARBORVIEW MEDICAL CENTER    WA
## 52                                        WAUKESHA MEMORIAL HOSPITAL    WI
## 53                                         FAIRMONT GENERAL HOSPITAL    WV
## 54                                        CHEYENNE VA MEDICAL CENTER    WY
```

```r
class(rankall("heart failure", 10))
```

```
## [1] "data.frame"
```

```r

rankall("heart failure", 10)
```

```
##                                              hospital state
## 1                         FAIRBANKS MEMORIAL HOSPITAL    AK
## 2                           FLORALA MEMORIAL HOSPITAL    AL
## 3           BAPTIST HEALTH MEDICAL CENTER-LITTLE ROCK    AR
## 4                      CARONDELET ST JOSEPHS HOSPITAL    AZ
## 5                           HUNTINGTON BEACH HOSPITAL    CA
## 6                     EXEMPLA LUTHERAN MEDICAL CENTER    CO
## 7                           MASONIC HOME AND HOSPITAL    CT
## 8                                                <NA>    DC
## 9                                                <NA>    DE
## 10                  HIGHLANDS REGIONAL MEDICAL CENTER    FL
## 11                DEKALB MEDICAL CENTER AT HILLANDALE    GA
## 12                                               <NA>    GU
## 13                         HAWAII MEDICAL CENTER EAST    HI
## 14                                  ST LUKES HOSPITAL    IA
## 15                            PORTNEUF MEDICAL CENTER    ID
## 16                    ALEXIAN BROTHERS MEDICAL CENTER    IL
## 17                            CLARK MEMORIAL HOSPITAL    IN
## 18                              SCOTT COUNTY HOSPITAL    KS
## 19                             ST ELIZABETH FT THOMAS    KY
## 20            LSU HEALTH SCIENCES CENTER - SHREVEPORT    LA
## 21                         NORTH SHORE MEDICAL CENTER    MA
## 22                        JOHNS HOPKINS HOSPITAL, THE    MD
## 23                                CARY MEDICAL CENTER    ME
## 24                OAKWOOD HOSPITAL AND MEDICAL CENTER    MI
## 25                                  OWATONNA HOSPITAL    MN
## 26                       CHRISTIAN HOSPITAL NORTHEAST    MO
## 27                            CALHOUN HEALTH SERVICES    MS
## 28                        ST JOHN'S LUTHERAN HOSPITAL    MT
## 29                             WAKEMED, CARY HOSPITAL    NC
## 30                     SAKAKAWEA MEDICAL CENTER - CAH    ND
## 31                         BOX BUTTE GENERAL HOSPITAL    NE
## 32                   MARY HITCHCOCK MEMORIAL HOSPITAL    NH
## 33                 OUR LADY OF LOURDES MEDICAL CENTER    NJ
## 34             REHOBOTH MCKINLEY CHRISTIAN HEALTH SER    NM
## 35                  SUMMERLIN HOSPITAL MEDICAL CENTER    NV
## 36                               MOUNT SINAI HOSPITAL    NY
## 37                                     UNION HOSPITAL    OH
## 38                       SAINT FRANCIS HOSPITAL SOUTH    OK
## 39                                ST ANTHONY HOSPITAL    OR
## 40                                       UPMC HORIZON    PA
## 41                     HOSPITAL HERMANOS MELENDEZ INC    PR
## 42                                   NEWPORT HOSPITAL    RI
## 43                       CHARLESTON VA MEDICAL CENTER    SC
## 44 AVERA MCKENNAN HOSPITAL & UNIVERSITY HEALTH CENTER    SD
## 45                                  CROCKETT HOSPITAL    TN
## 46                    THE HEART HOSPITAL BAYLOR PLANO    TX
## 47                        UINTAH BASIN MEDICAL CENTER    UT
## 48                  CARILION GILES COMMUNITY HOSPITAL    VA
## 49                                               <NA>    VI
## 50                     CENTRAL VERMONT MEDICAL CENTER    VT
## 51                 KITTITAS VALLEY COMMUNITY HOSPITAL    WA
## 52          WHEATON FRANCISCAN HEALTHCARE- ST FRANCIS    WI
## 53                       PRINCETON COMMUNITY HOSPITAL    WV
## 54                  CAMPBELL COUNTY MEMORIAL HOSPITAL    WY
```

```r
rankall("heart failure", 15)
```

```
##                                    hospital state
## 1                                      <NA>    AK
## 2                      HALE COUNTY HOSPITAL    AL
## 3             ST JOHN'S HOSPITAL-BERRYVILLE    AR
## 4            PAYSON REGIONAL MEDICAL CENTER    AZ
## 5                   GOOD SAMARITAN HOSPITAL    CA
## 6  CENTURA HEALTH-PORTER ADVENTIST HOSPITAL    CO
## 7                      SAINT MARYS HOSPITAL    CT
## 8                                      <NA>    DC
## 9                                      <NA>    DE
## 10           METROPOLITAN HOSPITAL OF MIAMI    FL
## 11              CHESTATEE REGIONAL HOSPITAL    GA
## 12                                     <NA>    GU
## 13                                     <NA>    HI
## 14            JONES REGIONAL MEDICAL CENTER    IA
## 15               WEST VALLEY MEDICAL CENTER    ID
## 16              ROSELAND COMMUNITY HOSPITAL    IL
## 17            TERRE HAUTE REGIONAL HOSPITAL    IN
## 18            UNIVERSITY OF KANSAS HOSPITAL    KS
## 19                     SPRING VIEW HOSPITAL    KY
## 20                    TULANE MEDICAL CENTER    LA
## 21                NEWTON-WELLESLEY HOSPITAL    MA
## 22                  MEDSTAR HARBOR HOSPITAL    MD
## 23                  TOGUS VA MEDICAL CENTER    ME
## 24            HENRY FORD WYANDOTTE HOSPITAL    MI
## 25                 CAMBRIDGE MEDICAL CENTER    MN
## 26       BARNES-JEWISH WEST COUNTY HOSPITAL    MO
## 27               CLAY COUNTY MEDICAL CENTER    MS
## 28                   HOLY ROSARY HEALTHCARE    MT
## 29            IREDELL MEMORIAL HOSPITAL INC    NC
## 30         PEMBINA COUNTY MEMORIAL HOSPITAL    ND
## 31                  BRYANLGH MEDICAL CENTER    NE
## 32                         COTTAGE HOSPITAL    NH
## 33        NEWARK BETH ISRAEL MEDICAL CENTER    NJ
## 34                        ESPANOLA HOSPITAL    NM
## 35  SAINT ROSE DOMINICAN HOSPITAL - DE LIMA    NV
## 36             COBLESKILL REGIONAL HOSPITAL    NY
## 37                  GOOD SAMARITAN HOSPITAL    OH
## 38             KINGFISHER REGIONAL HOSPITAL    OK
## 39         LEGACY MOUNT HOOD MEDICAL CENTER    OR
## 40                               UPMC HAMOT    PA
## 41                  HOSPITAL PAVIA SANTURCE    PR
## 42                                     <NA>    RI
## 43          UPSTATE CAROLINA MEDICAL CENTER    SC
## 44  LEAD - DEADWOOD REGIONAL HOSPITAL - CAH    SD
## 45          MOUNTAIN HOME VA MEDICAL CENTER    TN
## 46                HAMILTON GENERAL HOSPITAL    TX
## 47             TIMPANOGOS REGIONAL HOSPITAL    UT
## 48             ROCKINGHAM MEMORIAL HOSPITAL    VA
## 49                                     <NA>    VI
## 50                                     <NA>    VT
## 51             PROVIDENCE ST PETER HOSPITAL    WA
## 52                         WAUPUN MEM HSPTL    WI
## 53       MONONGALIA COUNTY GENERAL HOSPITAL    WV
## 54                IVINSON MEMORIAL HOSPITAL    WY
```

```r
rankall("heart failure")
```

```
##                                                             hospital state
## 1                                           SOUTH PENINSULA HOSPITAL    AK
## 2                                 GEORGE H. LANIER MEMORIAL HOSPITAL    AL
## 3                       VA CENTRAL AR. VETERANS HEALTHCARE SYSTEM LR    AR
## 4                               BANNER GOOD SAMARITAN MEDICAL CENTER    AZ
## 5                                  CENTINELA HOSPITAL MEDICAL CENTER    CA
## 6                                          PARKER ADVENTIST HOSPITAL    CO
## 7                                            YALE-NEW HAVEN HOSPITAL    CT
## 8                                                PROVIDENCE HOSPITAL    DC
## 9                                  BAYHEALTH - KENT GENERAL HOSPITAL    DE
## 10                         FLORIDA HOSPITAL HEARTLAND MEDICAL CENTER    FL
## 11                                                  DOCTORS HOSPITAL    GA
## 12                                  GUAM MEMORIAL HOSPITAL AUTHORITY    GU
## 13                                            KUAKINI MEDICAL CENTER    HI
## 14                               MERCY MEDICAL CENTER - CEDAR RAPIDS    IA
## 15                            SAINT ALPHONSUS MEDICAL CENTER - NAMPA    ID
## 16                                    RUSH UNIVERSITY MEDICAL CENTER    IL
## 17                                         ST CATHERINE HOSPITAL INC    IN
## 18                                               HAYS MEDICAL CENTER    KS
## 19                                        WESTLAKE REGIONAL HOSPITAL    KY
## 20                                    WILLIS KNIGHTON MEDICAL CENTER    LA
## 21                                     ST ELIZABETH'S MEDICAL CENTER    MA
## 22                                   MEDSTAR GOOD SAMARITAN HOSPITAL    MD
## 23                MILES MEMORIAL HOSPITAL (LINCOLN COUNTY HEALTHCARE    ME
## 24                                        HARPER UNIVERSITY HOSPITAL    MI
## 25                        ESSENTIA HEALTH ST JOSEPH'S MEDICAL CENTER    MN
## 26                                        NORTH KANSAS CITY HOSPITAL    MO
## 27                                   VA GULF COAST HEALTHCARE SYSTEM    MS
## 28                                      COMMUNITY MEDICAL CENTER INC    MT
## 29                               FIRSTHEALTH MOORE REGIONAL HOSPITAL    NC
## 30                                        ST ALOISIUS MEDICAL CENTER    ND
## 31                                           NEBRASKA HEART HOSPITAL    NE
## 32                                          VALLEY REGIONAL HOSPITAL    NH
## 33                                      EAST ORANGE GENERAL HOSPITAL    NJ
## 34                              LOVELACE REGIONAL HOSPITAL - ROSWELL    NM
## 35                                             MOUNTAINVIEW HOSPITAL    NV
## 36                                  KINGSBROOK JEWISH MEDICAL CENTER    NY
## 37                                                 FAIRVIEW HOSPITAL    OH
## 38                                     DUNCAN REGIONAL HOSPITAL, INC    OK
## 39                                        PORTLAND VA MEDICAL CENTER    OR
## 40                                    PHILADELPHIA VA MEDICAL CENTER    PA
## 41                                  SAN LUKE'S MEMORIAL HOSPITAL INC    PR
## 42                                                 WESTERLY HOSPITAL    RI
## 43                                           PALMETTO HEALTH BAPTIST    SC
## 44                     VA BLACK HILLS HEALTHCARE SYSTEM - FORT MEADE    SD
## 45                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL    TN
## 46                                        FORT DUNCAN MEDICAL CENTER    TX
## 47 VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER    UT
## 48                                          SENTARA POTOMAC HOSPITAL    VA
## 49                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR    VI
## 50                                              SPRINGFIELD HOSPITAL    VT
## 51                                         HARBORVIEW MEDICAL CENTER    WA
## 52                                        WAUKESHA MEMORIAL HOSPITAL    WI
## 53                                         FAIRMONT GENERAL HOSPITAL    WV
## 54                                        CHEYENNE VA MEDICAL CENTER    WY
```

```r
rankall("pneumonia", "worst")
```

```
##                                       hospital state
## 1                 ALASKA NATIVE MEDICAL CENTER    AK
## 2                  JACKSONVILLE MEDICAL CENTER    AL
## 3                  RIVER VALLEY MEDICAL CENTER    AR
## 4               HAVASU REGIONAL MEDICAL CENTER    AZ
## 5               DELANO REGIONAL MEDICAL CENTER    CA
## 6         ST MARYS HOSPITAL AND MEDICAL CENTER    CO
## 7                        MILFORD HOSPITAL, INC    CT
## 8               GEORGETOWN UNIVERSITY HOSPITAL    DC
## 9        CHRISTIANA CARE HEALTH SERVICES, INC.    DE
## 10        SEVEN RIVERS REGIONAL MEDICAL CENTER    FL
## 11            MCDUFFIE REGIONAL MEDICAL CENTER    GA
## 12            GUAM MEMORIAL HOSPITAL AUTHORITY    GU
## 13                MAUI MEMORIAL MEDICAL CENTER    HI
## 14                       BURGESS HEALTH CENTER    IA
## 15                 BEAR LAKE MEMORIAL HOSPITAL    ID
## 16                           ST JOHNS HOSPITAL    IL
## 17 INDIANA UNIVERSITY HEALTH LA PORTE HOSPITAL    IN
## 18              WESTERN PLAINS MEDICAL COMPLEX    KS
## 19                     CALDWELL MEDICAL CENTER    KY
## 20           TERREBONNE GENERAL MEDICAL CENTER    LA
## 21                     ATHOL MEMORIAL HOSPITAL    MA
## 22                      CIVISTA MEDICAL CENTER    MD
## 23                          MID COAST HOSPITAL    ME
## 24                 ASPIRUS GRAND VIEW HOSPITAL    MI
## 25                      GLACIAL RIDGE HOSPITAL    MN
## 26          UNIVERSITY OF MISSOURI HEALTH CARE    MO
## 27                      BOLIVAR MEDICAL CENTER    MS
## 28                     GLENDIVE MEDICAL CENTER    MT
## 29                   VIDANT EDGECOMBE HOSPITAL    NC
## 30                    OAKES COMMUNITY HOSPITAL    ND
## 31                 MEMORIAL COMMUNITY HOSPITAL    NE
## 32               LAKES REGION GENERAL HOSPITAL    NH
## 33              BERGEN REGIONAL MEDICAL CENTER    NJ
## 34                                UNM HOSPITAL    NM
## 35              RENOWN REGIONAL MEDICAL CENTER    NV
## 36                    ONEIDA HEALTHCARE CENTER    NY
## 37          COSHOCTON COUNTY MEMORIAL HOSPITAL    OH
## 38                MERCY MEMORIAL HEALTH CENTER    OK
## 39                           BAY AREA HOSPITAL    OR
## 40           POTTSTOWN MEMORIAL MEDICAL CENTER    PA
## 41                HOSPITAL SAN CARLOS BORROMEO    PR
## 42                   SOUTH COUNTY HOSPITAL INC    RI
## 43            LAURENS COUNTY HEALTHCARE SYSTEM    SC
## 44               HURON REGIONAL MEDICAL CENTER    SD
## 45              ATHENS REGIONAL MEDICAL CENTER    TN
## 46                    LIMESTONE MEDICAL CENTER    TX
## 47                         CASTLEVIEW HOSPITAL    UT
## 48                      SENTARA LEIGH HOSPITAL    VA
## 49           ROY LESTER SCHNEIDER HOSPITAL,THE    VI
## 50                        PORTER HOSPITAL, INC    VT
## 51                      OLYMPIC MEDICAL CENTER    WA
## 52  MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
## 53                      PLATEAU MEDICAL CENTER    WV
## 54            NORTH BIG HORN HOSPITAL DISTRICT    WY
```

```r

```


Submission

```r
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
submit()
```

```
## [1] 'best' part 1
## [2] 'best' part 2
## [3] 'best' part 3
## [4] 'rankhospital' part 1
## [5] 'rankhospital' part 2
## [6] 'rankhospital' part 3
## [7] 'rankhospital' part 4
## [8] 'rankall' part 1
## [9] 'rankall' part 2
## [10] 'rankall' part 3
## Which part are you submitting [1-10]?
```

```
## Error: missing value where TRUE/FALSE needed
```







Iterations of previous attempts

```r
## 
rm(dt1)
```

```
## Warning: object 'dt1' not found
```

```r
num = 4
dt1 <- dt[, list(rank = num), by = State]
```

```
## Error: object 'State' not found
```

```r
# dt1
setkey(dt1, State, rank)
```

```
## Error: object 'dt1' not found
```

```r
# dt[dt1,State,Hospital.Name] dt[dt1,Hospital.Name,dt1$State] #12 is not
# missed
merge(dt1, dt, all.x = T)[, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```

```r




## Worst Ranks
dt1 <- dt[, list(rank = max(rank)), by = State]
```

```
## Error: invalid 'type' (closure) of argument
```

```r
dt1
```

```
## Error: object 'dt1' not found
```

```r
head(dt1)
```

```
## Error: object 'dt1' not found
```

```r
setkey(dt1, State, rank)
```

```
## Error: object 'dt1' not found
```

```r
key(dt1)
```

```
## Error: object 'dt1' not found
```

```r
key(dt)
```

```
## NULL
```

```r
# dt[dt1,] dt[dt1,Hospital.Name,State]
dt[dt1, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```

```r
# dt[dt1,dt1$State,Hospital.Name] ## So many number of rows
dt[dt1, Hospital.Name, dt1$State]  ## Opposite columnn order
```

```
## Error: object 'dt1' not found
```

```r
merge(dt1, dt, all.x = T)[, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```

```r
## 
rm(dt1)
```

```
## Warning: object 'dt1' not found
```

```r
num = 4
dt1 <- dt[, list(rank = num), by = State]
```

```
## Error: object 'State' not found
```

```r
# dt1
setkey(dt1, State, rank)
```

```
## Error: object 'dt1' not found
```

```r
# dt[dt1,State,Hospital.Name] dt[dt1,Hospital.Name,dt1$State] #12 is not
# missed
merge(dt1, dt, all.x = T)[, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```

```r

## 
rm(dt1)
```

```
## Warning: object 'dt1' not found
```

```r
num = 10
dt1
```

```
## Error: object 'dt1' not found
```

```r
dt1 <- dt[, list(rank = num), by = State]
```

```
## Error: object 'State' not found
```

```r
setkey(dt1, State, rank)
```

```
## Error: object 'dt1' not found
```

```r
# dt[dt1,Hospital.Name,dt1$State] #12 is not missed
merge(dt1, dt, all.x = T)[, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```

```r
## 
rm(dt1)
```

```
## Warning: object 'dt1' not found
```

```r
num = 1
dt1 <- dt[, list(rank = num), by = State]
```

```
## Error: object 'State' not found
```

```r
setkey(dt1, State, rank)
```

```
## Error: object 'dt1' not found
```

```r
# dt[dt1,Hospital.Name,dt1$State] #12 is not missed
merge(dt1, dt, all.x = T)[, State, Hospital.Name]
```

```
## Error: object 'dt1' not found
```







```r
rm(list = ls())
df <- read.csv("./outcome-of-care-measures.csv", colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure = "character", 
    Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia = "character", Hospital.Name = "character"))

df[, 11] <- suppressWarnings(as.numeric(df[, 11]))
df[, 17] <- suppressWarnings(as.numeric(df[, 17]))
df[, 23] <- suppressWarnings(as.numeric(df[, 23]))

# df$State grep('State', names(df))

# Subset to have only Heart Attack Data
df1 <- df[, c(2, 7, 11)]
names(df1)[3] <- "Rate"
head(df1)
```

```
##                      Hospital.Name State Rate
## 1 SOUTHEAST ALABAMA MEDICAL CENTER    AL 14.3
## 2    MARSHALL MEDICAL CENTER SOUTH    AL 18.5
## 3   ELIZA COFFEE MEMORIAL HOSPITAL    AL 18.1
## 4         MIZELL MEMORIAL HOSPITAL    AL   NA
## 5      CRENSHAW COMMUNITY HOSPITAL    AL   NA
## 6    MARSHALL MEDICAL CENTER NORTH    AL   NA
```

```r
tail(df1)
```

```
##                                         Hospital.Name State Rate
## 4701 TEXAS HEALTH HEART & VASCULAR HOSPITAL ARLINGTON    TX   NA
## 4702                 WESTBURY COMMUNITY HOSPITAL, LLC    TX   NA
## 4703                   METHODIST HOSPITAL FOR SURGERY    TX   NA
## 4704           ST LUKE'S HOSPITAL AT THE VINTAGE, LLC    TX   NA
## 4705                  HERITAGE PARK SURGICAL HOSPITAL    TX   NA
## 4706                  METHODIST WEST HOUSTON HOSPITAL    TX   NA
```

```r
# Remove rows where Ratings are not known.
df1 <- df1[!is.na(df1$Rate), ]

# Order the dataframe by Names to help in Ranking. This might not be
# required with data.table
df1 <- df1[order(df1[, 1], df1[, 2]), ]
`?`(order)
# install.packages('data.table')
library(data.table)
rm(dt)
```

```
## Warning: object 'dt' not found
```

```r
head(df1)
```

```
##                        Hospital.Name State Rate
## 2137    ABBOTT NORTHWESTERN HOSPITAL    MN 12.3
## 4045 ABILENE REGIONAL MEDICAL CENTER    TX 17.2
## 3561      ABINGTON MEMORIAL HOSPITAL    PA 14.3
## 3531                   ACMH HOSPITAL    PA 13.1
## 1387         ADAMS MEMORIAL HOSPITAL    IN 15.1
## 3168   ADENA REGIONAL MEDICAL CENTER    OH 15.3
```

```r
dt <- as.data.table(df1[, c("Hospital.Name", "State", "Rate")])
# setkey(dt,State,Hospital.Name) key(dt)
head(dt)
```

```
##                      Hospital.Name State Rate
## 1:    ABBOTT NORTHWESTERN HOSPITAL    MN 12.3
## 2: ABILENE REGIONAL MEDICAL CENTER    TX 17.2
## 3:      ABINGTON MEMORIAL HOSPITAL    PA 14.3
## 4:                   ACMH HOSPITAL    PA 13.1
## 5:         ADAMS MEMORIAL HOSPITAL    IN 15.1
## 6:   ADENA REGIONAL MEDICAL CENTER    OH 15.3
```

```r
dt1 <- dt[, list(rank = rank(Rate, ties.method = "first")), by = State]
dt$rank <- dt1$rank

head(dt)
```

```
##                      Hospital.Name State Rate rank
## 1:    ABBOTT NORTHWESTERN HOSPITAL    MN 12.3    2
## 2: ABILENE REGIONAL MEDICAL CENTER    TX 17.2   15
## 3:      ABINGTON MEMORIAL HOSPITAL    PA 14.3   31
## 4:                   ACMH HOSPITAL    PA 13.1   18
## 5:         ADAMS MEMORIAL HOSPITAL    IN 15.1    8
## 6:   ADENA REGIONAL MEDICAL CENTER    OH 15.3   32
```

```r

setkey(dt, rank)
key(dt)
```

```
## [1] "rank"
```

```r
head(dt)
```

```
##                                 Hospital.Name State Rate rank
## 1: ALEGENT HEALTH BERGAN MERCY MEDICAL CENTER    NE 14.3    1
## 2:            ASHTABULA COUNTY MEDICAL CENTER    OH 14.0    1
## 3:                   CALAIS REGIONAL HOSPITAL    ME 17.1    1
## 4:                   COMMUNITY HOSPITAL SOUTH    IN 13.6    1
## 5:             D W MCMILLAN MEMORIAL HOSPITAL    AL 15.7    1
## 6:                      FHN MEMORIAL HOSPITAL    IL 16.1    1
```

```r
dt[J(4)][, Hospital.Name, State]
```

```
##     State                                    Hospital.Name
##  1:    IL                 ADVOCATE SOUTH SUBURBAN HOSPITAL
##  2:    IL                     NORTHWEST COMMUNITY HOSPITAL
##  3:    IL                 PROVENA ST JOSEPH MEDICAL CENTER
##  4:    TX               BAYLOR HEART AND VASCULAR HOSPITAL
##  5:    TX                       SOUTHWEST GENERAL HOSPITAL
##  6:    NC                     CAROLINA EAST MEDICAL CENTER
##  7:    NC                   VIDANT ROANOKE CHOWAN HOSPITAL
##  8:    LA             CHRISTUS ST FRANCES CABRINI HOSPITAL
##  9:    LA LOUISIANA MEDICAL CENTER AND HEART HOSPITAL, LLC
## 10:    LA                            SABINE MEDICAL CENTER
## 11:    MI               CRITTENTON HOSPITAL MEDICAL CENTER
## 12:    MI              HENRY FORD WEST BLOOMFIELD HOSPITAL
## 13:    MI                        MERCY HOSPITAL - GRAYLING
## 14:    OH           FORT HAMILTON HUGHES MEMORIAL HOSPITAL
## 15:    OH                         MERCY HOSPITAL FAIRFIELD
## 16:    OH                       TRUMBULL MEMORIAL HOSPITAL
## 17:    MN                 GRAND ITASCA CLINIC AND HOSPITAL
## 18:    MN              MAYO CLINIC HEALTH SYSTEM - MANKATO
## 19:    HI                           KUAKINI MEDICAL CENTER
## 20:    WA               LEGACY SALMON CREEK MEDICAL CENTER
## 21:    FL                   MARTIN MEMORIAL MEDICAL CENTER
## 22:    FL                       MEASE COUNTRYSIDE HOSPITAL
## 23:    FL                    PALM SPRINGS GENERAL HOSPITAL
## 24:    FL              WUESTHOFF MEDICAL CENTER  ROCKLEDGE
## 25:    NY                             MERCY MEDICAL CENTER
## 26:    NY                WYOMING COUNTY COMMUNITY HOSPITAL
## 27:    MA                         METROWEST MEDICAL CENTER
## 28:    WI                      MILWAUKEE VA MEDICAL CENTER
## 29:    NJ                            MOUNTAINSIDE HOSPITAL
## 30:    SC                NEWBERRY COUNTY MEMORIAL HOSPITAL
## 31:    CA             ORANGE COAST MEMORIAL MEDICAL CENTER
## 32:    CA       PARKVIEW COMMUNITY HOSPITAL MEDICAL CENTER
## 33:    CA                       SAINT JOHN'S HEALTH CENTER
## 34:    CA                   SANTA BARBARA COTTAGE HOSPITAL
## 35:    CA       UNIVERSITY OF CALIFORNIA IRVINE MED CENTER
## 36:    CA                VA N CALIFORNIA HEALTHCARE SYSTEM
## 37:    CA                 WHITTIER HOSPITAL MEDICAL CENTER
## 38:    KY                     PINEVILLE COMMUNITY HOSPITAL
## 39:    KY                    T J SAMSON COMMUNITY HOSPITAL
## 40:    PR    SISTEMA INTEGRADOS DE SALUD DEL SUR OESTE INC
## 41:    MS             ST DOMINIC-JACKSON MEMORIAL HOSPITAL
## 42:    MS             UNIVERSITY OF MISSISSIPPI MED CENTER
## 43:    TN                               ST THOMAS HOSPITAL
## 44:    TN                     VOLUNTEER COMMUNITY HOSPITAL
## 45:    GA                 TANNER MEDICAL CENTER VILLA RICA
## 46:    WV                           UNITED HOSPITAL CENTER
## 47:    WV                     WILLIAMSON MEMORIAL HOSPITAL
## 48:    PA                                     UPMC HORIZON
## 49:    CO                 VALLEY VIEW HOSPITAL ASSOCIATION
## 50:    AR       WASHINGTON REGIONAL MED CTR AT NORTH HILLS
## 51:    IN                           WITHAM HEALTH SERVICES
##     State                                    Hospital.Name
```

```r


dt[dt$rank == 4, Hospital.Name, State]
```

```
##     State                                    Hospital.Name
##  1:    IL                 ADVOCATE SOUTH SUBURBAN HOSPITAL
##  2:    IL                     NORTHWEST COMMUNITY HOSPITAL
##  3:    IL                 PROVENA ST JOSEPH MEDICAL CENTER
##  4:    TX               BAYLOR HEART AND VASCULAR HOSPITAL
##  5:    TX                       SOUTHWEST GENERAL HOSPITAL
##  6:    NC                     CAROLINA EAST MEDICAL CENTER
##  7:    NC                   VIDANT ROANOKE CHOWAN HOSPITAL
##  8:    LA             CHRISTUS ST FRANCES CABRINI HOSPITAL
##  9:    LA LOUISIANA MEDICAL CENTER AND HEART HOSPITAL, LLC
## 10:    LA                            SABINE MEDICAL CENTER
## 11:    MI               CRITTENTON HOSPITAL MEDICAL CENTER
## 12:    MI              HENRY FORD WEST BLOOMFIELD HOSPITAL
## 13:    MI                        MERCY HOSPITAL - GRAYLING
## 14:    OH           FORT HAMILTON HUGHES MEMORIAL HOSPITAL
## 15:    OH                         MERCY HOSPITAL FAIRFIELD
## 16:    OH                       TRUMBULL MEMORIAL HOSPITAL
## 17:    MN                 GRAND ITASCA CLINIC AND HOSPITAL
## 18:    MN              MAYO CLINIC HEALTH SYSTEM - MANKATO
## 19:    HI                           KUAKINI MEDICAL CENTER
## 20:    WA               LEGACY SALMON CREEK MEDICAL CENTER
## 21:    FL                   MARTIN MEMORIAL MEDICAL CENTER
## 22:    FL                       MEASE COUNTRYSIDE HOSPITAL
## 23:    FL                    PALM SPRINGS GENERAL HOSPITAL
## 24:    FL              WUESTHOFF MEDICAL CENTER  ROCKLEDGE
## 25:    NY                             MERCY MEDICAL CENTER
## 26:    NY                WYOMING COUNTY COMMUNITY HOSPITAL
## 27:    MA                         METROWEST MEDICAL CENTER
## 28:    WI                      MILWAUKEE VA MEDICAL CENTER
## 29:    NJ                            MOUNTAINSIDE HOSPITAL
## 30:    SC                NEWBERRY COUNTY MEMORIAL HOSPITAL
## 31:    CA             ORANGE COAST MEMORIAL MEDICAL CENTER
## 32:    CA       PARKVIEW COMMUNITY HOSPITAL MEDICAL CENTER
## 33:    CA                       SAINT JOHN'S HEALTH CENTER
## 34:    CA                   SANTA BARBARA COTTAGE HOSPITAL
## 35:    CA       UNIVERSITY OF CALIFORNIA IRVINE MED CENTER
## 36:    CA                VA N CALIFORNIA HEALTHCARE SYSTEM
## 37:    CA                 WHITTIER HOSPITAL MEDICAL CENTER
## 38:    KY                     PINEVILLE COMMUNITY HOSPITAL
## 39:    KY                    T J SAMSON COMMUNITY HOSPITAL
## 40:    PR    SISTEMA INTEGRADOS DE SALUD DEL SUR OESTE INC
## 41:    MS             ST DOMINIC-JACKSON MEMORIAL HOSPITAL
## 42:    MS             UNIVERSITY OF MISSISSIPPI MED CENTER
## 43:    TN                               ST THOMAS HOSPITAL
## 44:    TN                     VOLUNTEER COMMUNITY HOSPITAL
## 45:    GA                 TANNER MEDICAL CENTER VILLA RICA
## 46:    WV                           UNITED HOSPITAL CENTER
## 47:    WV                     WILLIAMSON MEMORIAL HOSPITAL
## 48:    PA                                     UPMC HORIZON
## 49:    CO                 VALLEY VIEW HOSPITAL ASSOCIATION
## 50:    AR       WASHINGTON REGIONAL MED CTR AT NORTH HILLS
## 51:    IN                           WITHAM HEALTH SERVICES
##     State                                    Hospital.Name
```

```r
dt[dt$rank == 1, Hospital.Name, State]
```

```
##     State                              Hospital.Name
##  1:    NE ALEGENT HEALTH BERGAN MERCY MEDICAL CENTER
##  2:    OH            ASHTABULA COUNTY MEDICAL CENTER
##  3:    OH                  LICKING MEMORIAL HOSPITAL
##  4:    OH                   UH GEAUGA MEDICAL CENTER
##  5:    OH                  WYANDOT MEMORIAL HOSPITAL
##  6:    ME                   CALAIS REGIONAL HOSPITAL
##  7:    IN                   COMMUNITY HOSPITAL SOUTH
##  8:    IN                    METHODIST HOSPITALS INC
##  9:    AL             D W MCMILLAN MEMORIAL HOSPITAL
## 10:    IL                      FHN MEMORIAL HOSPITAL
## 11:    IL       METHODIST MEDICAL CENTER OF ILLINOIS
## 12:    IL              SAINT ANTHONY'S HEALTH CENTER
## 13:    IL                  SWEDISH AMERICAN HOSPITAL
## 14:    MO                 HANNIBAL REGIONAL HOSPITAL
## 15:    MO                 MERCY HOSPITAL SPRINGFIELD
## 16:    MO                SSM ST JOSEPH HOSPITAL WEST
## 17:    MD                        HOLY CROSS HOSPITAL
## 18:    ID                    KOOTENAI MEDICAL CENTER
## 19:    NY                   LAWRENCE HOSPITAL CENTER
## 20:    NY                  MASSENA MEMORIAL HOSPITAL
## 21:    NY             WYCKOFF HEIGHTS MEDICAL CENTER
## 22:    NH           MARY HITCHCOCK MEMORIAL HOSPITAL
## 23:    SC     MCLEOD REGIONAL MEDICAL CENTER-PEE DEE
## 24:    PA                     MEMORIAL HOSPITAL YORK
## 25:    PA                         UNIONTOWN HOSPITAL
## 26:    PA              WILKES-BARRE GENERAL HOSPITAL
## 27:    CT                    MIDSTATE MEDICAL CENTER
## 28:    WA          MULTICARE GOOD SAMARITAN HOSPITAL
## 29:    WA YAKIMA REGIONAL MEDICAL AND CARDIAC CENTER
## 30:    KS                      NEWTON MEDICAL CENTER
## 31:    AR                 NW ARKANSAS HOSPITALS, LLC
## 32:    WI                       OCONOMOWOC MEM HSPTL
## 33:    WI                        THEDA CLARK MED CTR
## 34:    TX        PARKLAND HEALTH AND HOSPITAL SYSTEM
## 35:    TX          VAL VERDE REGIONAL MEDICAL CENTER
## 36:    TX             WADLEY REGIONAL MEDICAL CENTER
## 37:    GA            PHOEBE PUTNEY MEMORIAL HOSPITAL
## 38:    KY                   PIKEVILLE MEDICAL CENTER
## 39:    NJ                 RARITAN BAY MEDICAL CENTER
## 40:    NJ                       SHORE MEDICAL CENTER
## 41:    TN                       ROANE MEDICAL CENTER
## 42:    TN                  UNIVERSITY MEDICAL CENTER
## 43:    TN             VANDERBILT UNIVERSITY HOSPITAL
## 44:    CA               SAN DIMAS COMMUNITY HOSPITAL
## 45:    CA                        WASHINGTON HOSPITAL
## 46:    CA                 WOODLAND MEMORIAL HOSPITAL
## 47:    OR                   SKY LAKES MEDICAL CENTER
## 48:    MN                          ST MARYS HOSPITAL
## 49:    MN           VIRGINIA REGIONAL MEDICAL CENTER
## 50:    FL               UNIVERSITY OF MIAMI HOSPITAL
## 51:    NM                               UNM HOSPITAL
## 52:    NC                     WATAUGA MEDICAL CENTER
## 53:    WV                          WHEELING HOSPITAL
## 54:    IA                  WINNESHIEK MEDICAL CENTER
##     State                              Hospital.Name
```

```r
dt[dt$rank == 10, Hospital.Name, State]
```

```
##     State                                     Hospital.Name
##  1:    IL                   ALEXIAN BROTHERS MEDICAL CENTER
##  2:    IL                        JOHN H STROGER JR HOSPITAL
##  3:    MA                  BAYSTATE FRANKLIN MEDICAL CENTER
##  4:    MA                           LOWELL GENERAL HOSPITAL
##  5:    PA                          BUTLER MEMORIAL HOSPITAL
##  6:    PA              WILLIAMSPORT REGIONAL MEDICAL CENTER
##  7:    TX                           CITIZENS MEDICAL CENTER
##  8:    TX     MEMORIAL HERMANN MEMORIAL CITY MEDICAL CENTER
##  9:    TX                METHODIST MANSFIELD MEDICAL CENTER
## 10:    TX                       SETON MEDICAL CENTER AUSTIN
## 11:    TX                         UNIVERSITY MEDICAL CENTER
## 12:    TX                    VALLEY REGIONAL MEDICAL CENTER
## 13:    TX                VHS HARLINGEN HOSPITAL COMPANY LLC
## 14:    TX                         YOAKUM COMMUNITY HOSPITAL
## 15:    FL                    DOCTOR'S MEMORIAL HOSPITAL INC
## 16:    FL                  LEESBURG REGIONAL MEDICAL CENTER
## 17:    FL                 PALM BEACH GARDENS MEDICAL CENTER
## 18:    GA              EAST GEORGIA REGIONAL MEDICAL CENTER
## 19:    NY                                GLEN COVE HOSPITAL
## 20:    NY                     MARY IMOGENE BASSETT HOSPITAL
## 21:    NY                         PENINSULA HOSPITAL CENTER
## 22:    CA                  LA PALMA INTERCOMMUNITY HOSPITAL
## 23:    CA             MISSION COMMUNITY HOSPITAL - PANORAMA
## 24:    CA                                 OROVILLE HOSPITAL
## 25:    CA                    SAN JOAQUIN COMMUNITY HOSPITAL
## 26:    CO                     MEDICAL CENTER OF AURORA, THE
## 27:    MO                           MERCY HOSPITAL ST LOUIS
## 28:    MI                    MERCY MEMORIAL HOSPITAL SYSTEM
## 29:    LA              NATCHITOCHES REGIONAL MEDICAL CENTER
## 30:    LA                OCHSNER MEDICAL CENTER-BATON ROUGE
## 31:    LA           THE REGIONAL MEDICAL CENTER OF ACADIANA
## 32:    NJ                 NEWARK BETH ISRAEL MEDICAL CENTER
## 33:    OK                         PONCA CITY MEDICAL CENTER
## 34:    WV                          RALEIGH GENERAL HOSPITAL
## 35:    VA                 RIVERSIDE SHORE MEMORIAL HOSPITAL
## 36:    KY                                 SAINT JOSEPH EAST
## 37:    MD                 SOUTHERN MARYLAND HOSPITAL CENTER
## 38:    WA                               ST ANTHONY HOSPITAL
## 39:    KS                          STORMONT-VAIL HEALTHCARE
## 40:    TN                   SWEETWATER HOSPITAL ASSOCIATION
## 41:    IA                                TRINITY BETTENDORF
## 42:    MN UNIVERSITY OF MINNESOTA  MEDICAL CENTER, FAIRVIEW
## 43:    WI   UNIVERSITY OF WI  HOSPITALS & CLINICS AUTHORITY
## 44:    SC                   UPSTATE CAROLINA MEDICAL CENTER
## 45:    SC                       WACCAMAW COMMUNITY HOSPITAL
## 46:    MS                            WAYNE GENERAL HOSPITAL
## 47:    OH                       WEST CHESTER MEDICAL CENTER
##     State                                     Hospital.Name
```

```r


df1$rank <- dt1$V1


head(df1)
```

```
##                        Hospital.Name State Rate
## 2137    ABBOTT NORTHWESTERN HOSPITAL    MN 12.3
## 4045 ABILENE REGIONAL MEDICAL CENTER    TX 17.2
## 3561      ABINGTON MEMORIAL HOSPITAL    PA 14.3
## 3531                   ACMH HOSPITAL    PA 13.1
## 1387         ADAMS MEMORIAL HOSPITAL    IN 15.1
## 3168   ADENA REGIONAL MEDICAL CENTER    OH 15.3
```

```r
head(df1[order(df1[1], df1[4]), ], 20)
```

```
## Error: undefined columns selected
```

```r
tail(df1[order(df1[1], df1[4]), ], 20)
```

```
## Error: undefined columns selected
```

```r




# Set Rank
df1$rank <- rank(df1$Rate, ties.method = "first")

# Return the values based on data provided
if (num == "best") {
    return(df1[df1$rank == min(df1$rank), c(2, 1)])
} else if (num == "worst") {
    return(df1[df1$rank == max(df1$rank), c(2, 1)])
} else if ((num <= max(df1$rank)) | (num >= min(df1$rank))) {
    return(df1[df1$rank == num, c(2, 1)])
} else if ((num > max(df1$rank)) | (num < min(df1$rank))) {
    return(c(NA, state))
}
```

```
## Error: object 'num' not found
```

```r

```




```r
`?`(tapply)
```
