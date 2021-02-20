## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function is used to create a special object that stores
## a matrix and caches the inverse.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set,
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}

## Write a short comment describing this function
## This function calucate the inverse of the special matrix
## returned by makeCacheMatrix above. if the inverse has been calculated
## then cacheSolve would retrieve the inverse from the cache.
CM <- matrix(c(3,4,3,5), 2, 2)
CM <- matrix(c(9,3,7,5), 2, 2)
CM2 <- makeCacheMatrix(CM)

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)){
    message("getting cached data")
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
  
        }

