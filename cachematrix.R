#........................................................................................
#The following program consists of two functions.
# 1. makeCacheMatrix which takes a matrix as an input and creates a special matrix object
# that can cache the inverse of the given matrix using super assignment.
# 2. cacheSolve which returns the inverse of a given matrix.
#........................................................................................

##takes invertible matrix as input and outputs a list of a functions
m <- matrix()
#allows user to manually reset input matrix without explicitly calling makeCacheMatrix
set <- function(y = matrix()) {
  X <<- y
  m <<- matrix()
}
#returns the input matrix
get <- function() X

#allows user to manually set the inverse of the input matrix
setinverse <- function(inverse = matrix()){
  m <<- inverse
}

#returns the cached inverse of input matrix
getinverse <- function() m
list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)

}

#calculates the inverse of a given matrix and then caches the calculation; If inverse
#has already been calculated, then returns the cached calculation.
cacheSolve <- function(X, ...) {
  m <- X$getinverse()
  if (!is.na(m[1,1])) {
    message("getting cached data")
    return(m)
  }
  data <- X$get()
  m <- solve(data)
  X$setinverse(m)
  m
}