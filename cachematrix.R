## Using caching to store repeatedly used data for better efficiency

## Returns a list of functions Set, get, setinvm, getinvm

makeCacheMatrix <- function(x = matrix()) {
       
             
        invm = NULL
        set = function(y) {
                x <<- y
                inv_m <<- NULL
        }
        get = function() x
        setinvm = function(m) invm <<- m 
        getinvm = function() invm
        list(set=set, get=get, setinvm=setinvm, getinvm=getinvm)
}


## Gets the inverse of a supplied matrix, but first checked to see if 
## the data has first been cached

cacheSolve <- function(x, ...) {
        
        invmatrix <- x$getinvm()
        ##If it is cached
        if (!is.null(invmatrix)){
               
                return(invmatrix)
        }
        # if not cached Created the cached version.
        mdata <- x$get()
        invmatrix <- solve(mdata)
                
        x$setinvm(invmatrix)
        
        return(invmatrix)
}
