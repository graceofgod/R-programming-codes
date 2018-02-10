
##The rankhospital.R file creates a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). 
#The function reads the outcome-of-care-measures.csv ﬁle and returns a character vector with the name of the hospital that has the ranking speciﬁed by the num argument. 
##The outcome name needs to be one of heart attack, heart failure, or pneumonia

##The num argument can take values best, worst, or an integer indicating the ranking (smaller numbers are better). 
##If the number given by num is larger than the number of hospitals in that state, then the function should return NA. 

## Examples
## source("rankhospital.R")  
## rankhospital("TX", "heart failure", 4)
## [1] "DETAR HOSPITAL NAVARRO"

rankhospital <- function(state, outcome, num="best") {
  #read data from outcome-of-care-measures.csv 
  directory <- "./rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
  data <- read.csv(directory, colClasses="character") # read the data as character 
  
  # If an invalid outcome value is passed to best, the function will throw an error via the stop function with the exact message of invalid outcome. 
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  }
  #If an invalid state value is passed to best, the function will throw an error 
  #via the stop function with the exact message invalid state.
  valid_states <- table(data$State)
  if (!state %in% names(valid_states)) {
    stop("invalid state")
  }
  #The 2nd  column of data is Hospital.Name
  #The 11th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  #The 17th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  #The 23th column of data is Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  #Assign an index to be 11 if outcome is "heart attack"
  #                      17               "heart failure"
  #                      23               "pneumonia"  
  index <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
  # change data type of a given outcome column from character to numeric and suppress warnings
  data[,index] <- suppressWarnings(as.numeric(data[,index]))
  
  select_data <- subset(data, State==state) #select the data that the state is a given state.
  # sort selected_data by the outcome column and hospital name, return the Hospital.Name column
  sorted_hospitals<-select_data[order(select_data[,index], select_data[,2],na.last=TRUE),c(index,2)]
  sorted_hospitals <- na.omit(sorted_hospitals) 
  sorted_hospitals <- sorted_hospitals[, 2] #get a sorted hospital name starting with the lowest value of the outcome column
  
  num <- ifelse(num == "best", 1, ifelse(num == "worst", nrow(sorted_hospitals), as.numeric(num)))
  #Get hospital name for the given rank by its 30-day mortality rate.
  sorted_hospitals[num]
}