## This script demonstrates the functionality of functions 
## 'makeCacheMatrix' and 'cacheSolve' that are in R script 'cachematrix.R'.
## Run this script with 'cachematrix.R' in the working directory.
source("cachematrix.R")
mfun <- makeCacheMatrix(matrix(rnorm(36, 5, 1), 6, 6))     # initialize
mfun$get()                    # get the matrix m
cacheSolve(mfun)              # calculate & retrun the inverse matrix 
cacheSolve(mfun)              # when is called back use the cached inverse matrix  
cacheSolve(mfun) %*% mfun$get() # inverse matrix * original matrix == I

# Show you can run again creating a different function list, mfun2
mfun2 <- makeCacheMatrix(matrix(rnorm(25, 50, 3), 5, 5))     # initialize
mfun2$get()                    # get the matrix m
cacheSolve(mfun2)              # calculate & retrun the inverse matrix 
cacheSolve(mfun2)              # when is called back use the cached inverse matrix  
cacheSolve(mfun2) %*% mfun2$get() # inverse matrix * original matrix == I

# Show you can still work with the first input matrix cashed when mfun was created.
mfun$get()                    # get the original input matrix
cacheSolve(mfun)              # when is called back use the cached inverse matrix  
