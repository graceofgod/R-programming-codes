
#The best.R file creates a function called best.
#The best function takes two arguments: the 2-character abbreviated name of a state and an outcome name. 
#The outcome name needs to be one of "heart attack", "heart failure", or "pneumonia"

#The best function reads the outcome-of-care-measures.csv ???le and returns the name of the hospital that 
#has the best (i.e. lowest) 30-day mortality for the speci???ed outcome in that state.
#The hospital name is the name provided in the Hospital.Name variable.
#Hospitals that do not have data on a particular outcome will be excluded from the set of hospitals when deciding the rankings.

# Examples:
# best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"

best <- function(state, outcome) {
  
  #read data from outcome-of-care-measures.csv 
  directory <- "./rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv"
  data <- read.csv(directory, colClasses="character") # read the data as character 
  
  #If an invalid outcome value is passed to best, the function will throw an error 
  # via the stop function with the exact message invalid outcome.
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
  #find the hospital with lowest 30-day mortality for the speci???ed outcome in the given state. 
  sorted_hospitals<-select_data[order(select_data[,index], na.last=TRUE),2] # sort selected_data by the outcome column from the smallest to largest
  sorted_hospitals[1] #return a hospital name with the lowest 30-day mortality rate.
}