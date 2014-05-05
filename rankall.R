rankall  <- function(outcome, num = "best") {
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  df <- read.csv("./outcome-of-care-measures.csv", 
                 colClasses = c(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack = "character", 
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
  }else if (outcome == "heart failure") {
    df1 <- df[, c(2, 7, 17)]
  } else if (outcome == "pneumonia") {
    df1 <- df[, c(2, 7, 23)]
  }
  
  #Rename Column name of Hospital name to Hospital
  names(df1)[1]  <- "hospital"
  names(df1)[2]  <- "state"
  names(df1)[3]  <- "Rate"
  
  # Remove rows where Ratings are not known.
  df1 <- df1[!is.na(df1$Rate), ]
  #head(df1)
  
  library(data.table)
  dt <- as.data.table(df1[,c("hospital","state","Rate")])
  #head(dt)
  # Add ranking to the table
  dt1  <- dt[,list(hospital, rank = rank(Rate,ties.method = "random")), by = state]
  
  #=======================
  if (num == "best") {
    dt2  <- dt1[,list(rank = 1),by = state]
  } else if (num == "worst") {
    dt2  <- dt1[,list(rank = max(rank)),by = state]
  } else {
    dt2  <- dt1[,list(rank = num),by = state]
  }
  #=======================
  setkey(dt2,state,rank)
  setkey(dt1,state,rank)
  return(as.data.frame(dt1[dt2,][,list(hospital, state)]))
}