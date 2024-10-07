#' Mell Function: Subset Data Based on Group Index Conditions
#'
#' The `Mell` function computes equation (1) in page 9 of Davila-Pena et al. (2024)
#' when the dependency is positive and features are binary. It filters rows from `Xdata` and `Ydata` based on specific conditions
#' of features' dependency as defined by `index`. It selects rows where the values
#' of features within the same union, except for those in union `ell`, coincide.
#'
#' @param Xdata Matrix. A dataset where rows represent observations and columns represent features.
#' @param Ydata Vector. The response variable associated with each row in `Xdata`.
#' @param index Vector. A grouping vector that assigns each feature in `Xdata` to a specific union. E.g., if we
#'                      have the partition set P=\{\{1\},\{2,4\},\{3\}\}, then index=c(1,2,3,2).
#' @param ell Integer. The index of the union to exclude from the comparison.
#'
#' @return A list containing the following components:
#' \describe{
#'   \item{Xdata.ell}{A subset of `Xdata` that meets the specified group conditions.}
#'   \item{Ydata.ell}{The corresponding values from `Ydata` for the selected rows in `Xdata.ell`.}
#'   \item{n.user.ell}{The number of selected rows that meet the group condition.}
#' }
#'
#' @details
#' The `Mell` function iterates through each row of `Xdata` and compares the values of features
#' within predefined unions (determined by `index`). For each union, excluding the one specified
#' by `ell`, the function checks if all feature values in that union coincide.
#' If this condition is satisfied for all unions except `ell`, the row is selected.
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
#' Mell(Xdata = Xdata, Ydata = Ydata, index = c(1,2,3,4), ell = 3)
#' # Scenario 9:
#' Mell(Xdata = Xdata, Ydata = Ydata, index = c(1,2,1,2), ell = 2)
#'
#' @references
#' Davila-Pena, L., Saavedra-Nieves, A., & Casas-Méndez, B. (2024). *On the influence of dependent features in classification problems: a game-theoretic perspective*. arXiv preprint. \doi{10.48550/arXiv.2408.02481}.
#'
#' @export



Mell<-function(Xdata,Ydata,index,ell){

  ii<-c()
  for (i in 1:nrow(Xdata)){
    Xdata.i<-Xdata[i,]
    M<-max(index)

    cont<-0
    for (m in 1:M){
      if (m!=index[ell]){
        features.m<-which(index==m)
        if (sum(Xdata.i[features.m]==min(Xdata.i[features.m]))==length(features.m)){
          cont<-cont+1
        }
      }
    }

    if (cont==(M-1)){ii<-c(ii,i)}
  }
  Xdata.ell<-Xdata[ii,]
  Ydata.ell<-Ydata[ii]
  n.user.ell<-nrow(Xdata.ell)

  return(list(Xdata.ell,Ydata.ell,n.user.ell))
}


