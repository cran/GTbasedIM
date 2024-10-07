#' checking Function: Check Specified Rows Within Dataset
#'
#' The `checking` function checks whether a given pair `(Xdata.i.ell, Yell.i)`
#' is present in the dataset `(Xdata, Ydata)` and returns the corresponding indices, if any.
#'
#' @param Xdata Matrix. A dataset where rows represent observations and columns represent features.
#' @param Ydata Vector. The response variable associated with each row in `Xdata`.
#' @param Xdata.i.ell Vector. A vector of feature values, potentially representing a row of `Xdata`.
#' @param Yell.i Integer. The specific response value to check.
#'
#' @return A vector of indices where the match occurs.
#'
#' @import CoopGame
# '
#' @examples
#' # Example usage from Example 5.2 in Davila-Pena et al. (2024):
#'
#' library(CoopGame)
#' n.user <- 16
#' Xdata <- createBitMatrix(4)[,-5]
#' Xdata <- rbind(c(0,0,0,0),Xdata)
#' Ydata <- rep(0,n.user)
#' Ydata[1+c(10,11,13,14,15)] <- 1
#'
#' Xdata.i.ell <- c(1,2,0,1) # obviously, considering `Xdata` is binary, this cannot be present.
#' Yell.i <- 1
#'
#' checking(Xdata, Ydata, Xdata.i.ell, Yell.i)
#'
#' Xdata.i.ell <- c(1,1,0,1)
#' Yell.i <- 0
#'
#' checking(Xdata, Ydata, Xdata.i.ell, Yell.i)
#'
#'
#' @export


checking <-function(Xdata,Ydata,Xdata.i.ell,Yell.i){
  index<-c()
  for (i in 1:nrow(Xdata)){
    if ((sum(Xdata[i,]==Xdata.i.ell)==ncol(Xdata))&(Ydata[i]==Yell.i)){index<-c(index,i)}
  }
  return(index)}
