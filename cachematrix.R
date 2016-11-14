## function makeCacheMatrix #####
## create a special object(list of functions) that can cache a matrix and cache the inverse of this matrix
## returns a list of functions
### Example Usage
# makeCacheMatrix(x) ## assuming that x is a invertible matrix
# source("cachematrix.R")   #Source the file containing the accessories functions
# m <- makeCacheMatrix(matrix(rnorm(25), 5, 5)) #set a invertible matrix to be cached 
# cacheSolve(m)   #get the chached of inverse matrix if already cached then or set and get the inverse 
# m$get()   #get the cached matrix
# m$getInverse()   #get the cached inverse matrix or NULL if not already cached
# m$set(matrix(rnorm(16), 4, 4))   #set a new invertible matrix 
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setInverse <- function(i) inverse <<- i
    getInverse <- function() inverse
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## function cacheSolve #####
## computes, cache and returns the inverse of a special matrix 
## returns the chached matrix if already cached or computes and return the matrix inversed
### Example Usage
# cacheSolve(x) ## assuming that x is a special list object made by makeCacheMatrix function
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    matrixInverse <- x$getInverse()
    if(!is.null(matrixInverse)) {
        message("getting matrix inverse cached data")
        return(matrixInverse)
    }
    matrixCached <- x$get()
    matrixInverse <- solve(matrixCached)
    ## cache inverse
    x$setInverse(matrixInverse)
    
    matrixInverse
}
