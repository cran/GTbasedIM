#' IM_dep Function: Calculate Influence Measure with Dependent Features
#'
#' The `IM_dep` function calculates the influence measure of equation (2) in Davila-Pena et al. (2024).
#' The features are grouped into unions based on the `index` vector.
#'
#' @param Xdata Matrix. A dataset where rows represent observations and columns represent features.
#' @param Ydata Vector. The response variable associated with each row in `Xdata`.
#' @param index Vector. A grouping vector that assigns each feature in `Xdata` to a specific union. E.g., if we
#'                      have the partition set P=\{\{1\},\{2,4\},\{3\}\}, then index=c(1,2,3,2).
#'
#' @return A vector of influences for each feature.
#'
#' @details
#' The `IM_dep` function calculates the weighted average of the number of times a change in
#' the value of a feature associated to a specific union influences the response value.
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
#' # Scenario 1:
#' IM_dep(Xdata,Ydata,index = c(1,2,3,4))
#' # Scenario 9:
#' IM_dep(Xdata,Ydata,index = c(1,2,1,2))
#'
#' @references
#' Davila-Pena, L., Saavedra-Nieves, A., & Casas-Méndez, B. (2024). *On the influence of dependent features in classification problems: a game-theoretic perspective*. arXiv preprint. \doi{10.48550/arXiv.2408.02481}.
#'
#' @export


IM_dep<-function(Xdata,Ydata,index){

  chi<-rep(0,ncol(Xdata))
  for (ell in 1:ncol(Xdata)){
    Aell<-as.numeric(names(table(Xdata[,ell])))
    B<-c(0,1)

    M.t<-Mell(Xdata,Ydata,index,ell)
    Xdata.t<-M.t[[1]]
    Ydata.t<-M.t[[2]]
    n.user.t<-M.t[[3]]


    for (i in 1:n.user.t){
      Y.i<-Ydata.t[i]
      Xdata.i<-Xdata.t[i,]
      for (j in 1:length(Aell)){
        if (Aell[j]!=Xdata.i[ell]){
          Xdata.i.ell<-Xdata.i
          Xdata.i.ell[ell]<-Aell[j]
          for (k in 1:length(B)){
            ii<-checking(Xdata.t,Ydata.t,Xdata.i.ell,B[k])
            if (is.null(ii)==F){chi[ell]<-chi[ell]+length(ii)*sum(abs(B[k]-Y.i))}
          }
        }
      }
    }
    chi[ell] <- chi[ell]/n.user.t
  }
  return(chi)}
