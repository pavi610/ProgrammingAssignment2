## Caching the Inverse of a Matrix:
## A pair of functions are shown that are used to create a special object which stores a matrix and caches its inverse
## A special matrix object is created by this function that can cache its invese.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}
## This function computes the inverse of the special matrix.
## If the inverse is already calculated then it should retrieve the inverse from the cache.

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
matrix <- x$get() 
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
