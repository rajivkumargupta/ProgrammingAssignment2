## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##The first function,makeCacheMatrix,  creates a special "matrix", which is really a list containing a function to
##1.set the value of the matrix
##2.get the value of the matrix
##3.set the value of the inverse
##4.get the value of the inverse




makeCacheMatrix <- function(x = matrix()) {
i<-NULL
##below helps to modify original matrix using set function
set <- function(y) {
                x <<- y
                i <<- NULL
        }
##Provides current matrix
get<-function(){x}

## Use cacheSolve function to find inverse of modified matrix 

setinverse<-function(inverse) {i<<-inverse}

## use cacheSolve function to get inverse of current matrix

getinverse<-function(){i}

##Create a list object

list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function
##The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse ##has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		    i<-x$getinverse()
    if(!is.null(i)){
              message("getting cached inverse")
              return(i)
    }
## Return inverse 
    data<-x$get()
    i<-solve(data,...)
    x$setinverse(i)
    i
    }