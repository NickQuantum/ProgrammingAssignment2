## This pair of functions together cache the Inverse of a Matrix


## This function creates a special "matrix" list object 
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    
    print(environment())
    m <- NULL
    set <- function(y) {
        print(environment())
        x <<- y
        m <<- NULL
        
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This functon computes the inverse of the special 
## "matrix" object returned  by makeCacheMatrix above


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    print(environment)
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
        
    }
    data <- x$get()
    m <- solve(data,...)
    x$setinverse(m)
    m
}
