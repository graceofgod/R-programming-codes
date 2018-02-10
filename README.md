# R-programming-codes

### cachematrix.R <br /> 
Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.  I wrote a pair of functions to cache the inverse of a matrix.<br /> 

### outcome-of-care-measures.csv <br /> 
The csv data is download for Programming Assignment from the Coursera web site.  It Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals. <br /> 

### best.R <br /> 
The best.R file creates a function called best. The best function takes two arguments: the 2-character abbreviated name of a state and an outcome name. The outcome name needs to be one of “heart attack”, “heart failure”, or “pneumonia”.
The best function reads the outcome-of-care-measures.csv ﬁle and returns the name of the hospital that has the best (i.e. lowest) 30-day mortality for the speciﬁed outcome in that state.<br /> 
Examples:<br /> 
best("TX", "heart attack")<br /> 
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"<br /> 

### rankhospital.R <br /> 
This file creates a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). 
The rankhospital function reads the outcome-of-care-measures.csv ﬁle and returns a character vector with the name of the hospital that has the ranking speciﬁed by the num argument. The outcome name needs to be one of heart attack, heart failure, or pneumonia
The num argument can take values best, worst, or an integer indicating the ranking (smaller numbers are better). <br /> 
Examples:<br /> 
source("rankhospital.R")  <br /> 
rankhospital("TX", "heart failure", 4)<br /> 
[1] "DETAR HOSPITAL NAVARRO".<br /> 

### rankall.R <br /> 
The rankall.R file creates a function called rankall that takes two arguments: an outcome name (outcome) and a hospital ranking (num).
The rankall function reads the outcome-of-care-measures.csv ﬁle and returns a 2-column data frame containing the hospital in each state that has the ranking speciﬁed in num. The outcome name needs to be one of heart attack, heart failure, or pneumonia
The num argument can take values best, worst, or an integer indicating the ranking (smaller numbers are better). 
If the number given by num is larger than the number of hospitals in that state, then the function should return NA. <br /> 
Examples<br /> 
source("rankall.R")<br /> 
head(rankall("heart attack", 20))<br /> 
                              hospital state<br /> 
AK                                <NA>  <NA><br /> 
AL      D W MCMILLAN MEMORIAL HOSPITAL    AL<br /> 
AR   ARKANSAS METHODIST MEDICAL CENTER    AR<br /> 
AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ<br /> 
CA               SHERMAN OAKS HOSPITAL    CA<br /> 
CO            SKY RIDGE MEDICAL CENTER    CO<br /> 
