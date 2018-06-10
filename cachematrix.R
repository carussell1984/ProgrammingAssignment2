## makeCacheMatrix first be used to set both the matrix and the inverse of the matrix, and then CacheSolve can be used to retrive either the original matrix or the inverse of the matrix.

# makeCasheMatrix will:
	# set the matrix
	# get the matrix
	# set the inverse of the matrix
	# get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
        set <- function(y) {
        	x <<- y
            inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve will be used to retreive the inverse of the matrix
	
cacheSolve <- function(x, ...) {
             inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv   
}

Example:
> x <- rbind(c(2,4), c(1,3))
> x
     [,1] [,2]
[1,]    2    4
[2,]    1    3

> makeCacheMatrix(x)
$set
function (y) 
{
    x <<- y
    inv <<- NULL
}
<bytecode: 0x1120bbe00>
<environment: 0x110ecbef8>

$get
function () 
x
<bytecode: 0x11212bdc8>
<environment: 0x110ecbef8>

$setinverse
function (inverse) 
inv <<- inverse
<bytecode: 0x1121b23f8>
<environment: 0x110ecbef8>

$getinverse
function () 
inv
<bytecode: 0x10d3a1790>
<environment: 0x110ecbef8>

> y <- makeCacheMatrix(x)
> y$get()
     [,1] [,2]
[1,]    2    4
[2,]    1    3

> cacheSolve(y)
     [,1] [,2]
[1,]  1.5   -2
[2,] -0.5    1