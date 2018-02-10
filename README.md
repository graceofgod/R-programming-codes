Corresponding # R-programming-codes

### cachematrix.R <br /> 
This file created a pair of functions to cache the inverse of a matrix.<br /> 

### outcome-of-care-measures.csv <br /> 
The csv data is download for Programming Assignment from the Coursera web site.  It has information about 30-day mortality rate for heart attacks, heart failure, and pneumonia for more than 4,000 hospitals. <br /> 

### best.R <br /> 
The best.R file creates a function called best. The best function takes two arguments: a state name and an outcome name. The outcome name needs to be one of “heart attack”, “heart failure”, or “pneumonia”.
The best function reads the outcome-of-care-measures.csv ﬁle and returns the hospital name with the best (i.e. lowest) 30-day mortality rate for a speciﬁed outcome in a specified state.<br /> 
Examples:<br /> 
best("TX", "heart attack")<br /> 
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"<br /> 

### rankhospital.R <br /> 
This file creates a function called rankhospital that takes three arguments: a state name, an outcome name, and the ranking of a hospital in a speciﬁed state for a speciﬁed outcome. 
The rankhospital function reads the outcome-of-care-measures.csv ﬁle and returns the hospital name at a specified rank in a specified state. 
The num argument can be best, worst, or an integer indicating the ranking. <br /> 
Examples:<br /> 
source("rankhospital.R")  <br /> 
rankhospital("TX", "heart failure", 4)<br /> 
[1] "DETAR HOSPITAL NAVARRO".<br /> 

### rankall.R <br /> 
The rankall.R file creates a function called rankall that takes two arguments: an outcome name and a hospital ranking.
The rankall function reads the outcome-of-care-measures.csv ﬁle and returns a data frame that shows each state and its corresponding hospital at a specified rank. The outcome name needs to be one of heart attack, heart failure, or pneumonia
TThe num argument can be best, worst, or an integer indicating the ranking. <br />
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
