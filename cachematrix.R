## Programming Assignment 2: Lexical Scoping 

## Assignment goal: write a pair of functions to cache the inverse of a matrix.

## Two functions shown in this script are used to cache the inverse of a matrix.

## (1) makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
##     The input of makeCacheMatrix: A matrix object
##     The output of makeCacheMatrix: A list that have the four functions:
##                                    get(), set(), getinverse(), and setinverse().
##     Usage example of makeCacheMatrix:
##       v <- makeCacheMatrix (matrix(1:4, nrow=2, ncol=2))
##       v$set()             # set the value of a matrix
##       v$get()             # retrieve the value of the matrix
##       v$setinverse()      # set the value of inverse of the matrix
##       v$getinverse()      # retrieve the value of inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
  # Set initial value of inverse of the matrix to NULL
  inv <- NULL 
  
  # Define function to set the value of the matrix.
  set <- function(y) 
  { 
    x <<- y      # Set the value of the matrix
    inv <<- NULL # Clear the cache of inverse value of the matrix
  }
  
  # Define function to get the value of the matrix
  get <- function(){
    x
  }
  
  # Define function to set the value of inverse of the matrix
  setinverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Define function to retrieve  the value of inverse of the matrix
  getinverse <- function() {
    inv
  }
  
  # Return a list containing the above four functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## (2) cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##     The input of cacheSolve:  The output of makeCacheMatrix.
##     The output of cacheSolve: The value of inverse of the matrix which is set by makeCacheMatrix. 
##     Usage example of cacheSolve:
##       v <- makeCacheMatrix (matrix(1:4, nrow=2, ncol=2))
##       cacheSolve(v)        # return the value of inverse of the matrix
##       [,1] [,2]
##       [1,]   -2  1.5
##       [2,]    1 -0.5
##       v$getinverse()       # retrieve the value of inverse of the matrix directly, now that it has been cached.
##       cacheSolve(v)        # execute cacheSolve in the second run
##       getting cached data
##       [,1] [,2]
##       [1,]   -2  1.5
##       [2,]    1 -0.5

cacheSolve <- function(x, ...) {
  # Get the current value of the inverse of the matrix.
  inv <- x$getinverse()
  # Check if the inverse has already been computed. 
  # If yes, it shows the message "getting cached data" and returns the current value of the inverse.
  # If not, it computes the inverse, sets the value in the cache by setinverse function.
  if(!is.null(inv)) 
  {message("getting cached data")
    return(inv)
  }
  
  data <- x$get()           # Get the value of the matrix
  inv <- solve(data, ...)   # Calculate the value of inverse of the matrix
  x$setinverse(inv)         # Cache the result
  inv                       # Return the value of inverse of the matrix
}
