best  <- function(state, outcome) {
  ## Read outcome data 
  df  <- read.csv('./outcome-of-care-measures.csv',
                  colClasses=c('Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack'='character',
                               'Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure'='character',
                               'Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia'='character',
                               'Hospital.Name'='character'))
  ## Check that state and outome are valid
  outcomes   <- c("heart attack","heart failure","pneumonia")
  if (!(state %in% df$State)) {
    stop("invalid state")
  }
  
  if (!(outcome %in% outcomes)) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death 
  ## rate
  df1  <- df[df$State == state,]
  if (outcome == "heart attack") {
    return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,na.rm = T), 2]))
  }
  
  if (outcome == "heart failure") {
    return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,na.rm = T), 2]))
  }
  
  if (outcome == "pneumonia") {
    return(min(df1[df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(df1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,na.rm = T), 2]))
  }
  
}