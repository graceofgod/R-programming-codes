##The rankall.R file creates a function called rankall that takes two arguments: an outcome name and a hospital ranking. 
##The rankall function reads the outcome-of-care-measures.csv ﬁle and returns a data frame that shows each state and 
##its corresponding hospital at a specified rank. The outcome name needs to be one of heart attack, heart failure, or pneumonia.
##The num argument can be best, worst, or an integer indicating the ranking. 
## Examples
##source("rankall.R")
##head(rankall("heart attack", 20))
##                              hospital state
##AK                                <NA>  <NA>
##AL      D W MCMILLAN MEMORIAL HOSPITAL    AL
##AR   ARKANSAS METHODIST MEDICAL CENTER    AR
##AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
##CA               SHERMAN OAKS HOSPITAL    CA
##CO            SKY RIDGE MEDICAL CENTER    CO

rankall <- function(outcome, num="best") {
  #read data from outcome-of-care-measures.csv 
  directory <- "./rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
  data <- read.csv(directory, colClasses="character") # read the data as character 
  
  # If an invalid outcome value is passed to best, the function will throw an error via the stop function with the exact message of invalid outcome. 
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  
  #The 2nd  column of data is Hospital.Name
  #The 7th  column of data is State
  #The 11th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  #The 17th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  #The 23th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  #Assign an index to be 11 if outcome is "heart attack"
  #                      17               "heart failure"
  #                      23               "pneumonia"  
  index <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
  # change data type of the specified mortality rate from character to numeric and suppress warnings
  data[,index] <- suppressWarnings(as.numeric(data[,index]))
  data <- data[!is.na(data[,index]),]# delete the rows in data that the specified mortality rate has NaN values
  #Sort the data by the specified mortality rate and hospital name and
  #only select three columns of hospital name, state, and the specified mortality rate
  selected_data <- data[order(data[,index], data[,2], na.last=TRUE),c(2,7,index)]
 
  #sort all unique state names
  states <- sort(unique(data[,7]))
  
  #Define a function returns the hospital name for the given state at the specified rank.
  find_ranked_hospital <- function(state) {
    #select data with the specified sate
    slice <- subset(selected_data, State==state)
    #set num to be 1                             if we want to find the hosiptal with the lowest mortality rate
    #set num to be the total row number of slice if we want to find the hosiptal with the highest mortality rate
    #set num to be a number                      if we want to find the hosiptal with a specified rank  
    num <- ifelse(num == "best", 1, ifelse(num == "worst", nrow(slice), as.numeric(num)))
    slice <- slice[num,c(1,2)]
    return (slice) #return a hospital nama and state at the specidied rank.
  }
  hospital_state<-lapply(states, find_ranked_hospital)#hospital_state is a list. Each element in a list shows a hospital nama and state at the specidied rank  
  hospital_state<- do.call(rbind, hospital_state) #convert a list to a dataframe
  hospital_state<-as.data.frame(hospital_state, row.names=states)#set the index of the dataframe to be the unique states
  colnames(hospital_state) <- c("hospital", "state")# rename the column names 
  return (hospital_state) #return a dataframe that has a 2-column data containing the hospital in each state that has the ranking speciﬁed in num.
}
