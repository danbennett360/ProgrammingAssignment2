# Assignment 2
#
# Write a function which will cache a matrix and a function that will use
#    that  cached matrix


# this is monstly a copy from the assignment page
# see https://class.coursera.org/rprog-015/human_grading/view/courses/973496/assessments/3/submissions

# this one does the dirty work.
# save the matrix, and possibly the inverse in local variables
# and create four routines to support operations on this matrix

makeCacheMatrix <- function(x = matrix()) {
  
    # the inverse is the key here
    # if it is null, then it has yet to be calculated
    # otherwise it is the inverse
  
    theInverse <- NULL
    
    # function to set the value
    set <- function(y) {
        x <<- y
	      theInverse <<- NULL
    }
    
    # function to return the current value
    get <- function() {
         x 
    }

    # function to set the inverse value
    setInverse <- function(i) {
        theInverse <<- i
    }

    # function to get the inverse value
    #
    # This follows the assignment and the example but I don't like it
    # it would be much better to compute the inverse here if it does
    # not exist.
    #
    # This would reduce the chance of operator error.
    # The dagner is, someone might call this function before cacheSolve has been called.
    getInverse <- function() {
        theInverse
    }

    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}

# Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  
    myInverse <- x$getInverse()
    
    if (!is.null(myInverse)) {  
         
         # message("returning a cached matrix")
         return(myInverse)
    }

    myInverse = solve(x$get())
    x$setInverse(myInverse)

    myInverse
}