rankhospital  <- function(state, outcome, num) {
  # Read the file outcome-of-care-measures.csv
  df  <- read.csv('./outcome-of-care-measures.csv',
                  colClasses=c('Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'='character',
                               'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'='character',
                               'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'='character',
                               'Hospital.Name'='character'))
  
  df[,11]  <- suppressWarnings(as.numeric(df[,11]))
  df[,17]  <- suppressWarnings(as.numeric(df[,17]))
  df[,23]  <- suppressWarnings(as.numeric(df[,23]))
  
  outcomes  <- c("heart attack", "heart failure", "pneumonia")
  
  if (!(state %in% df$State)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  
  if(outcome == "heart attack") {
    df1  <- df[df$State == state,c(2,11)]
    names(df1)[2]  <- "Rate"
  }
  
  if(outcome == "heart failure") {
    df1  <- df[df$State == state,c(2,17)]
    names(df1)[2]  <- "Rate"
  }
  
  
  if(outcome == "pneumonia") {
    df1  <- df[df$State == state,c(2,23)]
    names(df1)[2]  <- "Rate"
  }
  # Remove rows where Ratings are not known.
  df1  <- df1[!is.na(df1$Rate),]
  # Order the dataframe by Names to help in Ranking
  df1  <- df1[order(df1[1]),]
  #head(df1)
  #tail(df1)
  
  # Set Rank 
  df1$rank  <- rank(df1$Rate,ties.method="first")
  
  # Return the values based on data provided
  if (num == "best") {
    return (df1[df1$rank == min(df1$rank),1])
  } else if (num == "worst") {
    return (df1[df1$rank == max(df1$rank),1])
  } else if ((num <= max(df1$rank)) & (num >= min(df1$rank))) {
    return (df1[df1$rank == num,1])
  } else if ((num > max(df1$rank)) | (num < min(df1$rank))){
    return(NA)
  } 
}