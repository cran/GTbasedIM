#' Predictions Function: Generate predictions using classifiers from RWeka
#'
#' @description
#' This function trains three different classifiers—Random Forest (RF), Support Vector Machine (SVM), and Logistic Regression (LR)—on the input dataset and returns their predictions.
#'
#' @param Xdata Matrix. A dataset where rows represent observations and columns represent features.
#' @param Ydata Vector. The actual response variable associated with each row in `Xdata`.
#'
#' @return A list containing predictions from the three models:
#' \describe{
#'   \item{`predictionRF`}{Predictions from the Random Forest (RF) model.}
#'   \item{`predictionSVM`}{Predictions from the Support Vector Machine (SVM) model.}
#'   \item{`predictionLR`}{Predictions from the Logistic Regression (LR) model.}
#' }
#'
#' @details
#' The function utilizes the RWeka package to build three different classifiers:
#' Random Forest (RF), Support Vector Machine (SVM), and Logistic Regression (LR). It then
#' predicts the response variable for the input data using each of these models.
#'
#' @import RWeka
#' @import stats
#'
#' @export
#'
#' @examples
#' # Example usage:
#'
#' X <- matrix(rnorm(100), ncol=5)
#' Y <- sample(0:1, 20, replace=TRUE)
#' predictions(X, Y)
#'
#' @references
#' Davila-Pena, L., Saavedra-Nieves, A., & Casas-Méndez, B. (2024). *On the influence of dependent features in classification problems: a game-theoretic perspective*. arXiv preprint. \doi{10.48550/arXiv.2408.02481}.
#'


predictions<-function(Xdata,Ydata){

  data0<-as.data.frame(cbind(Xdata,Ydata))

  for (i in 1:(ncol(Xdata)+1)){
    data0[,i]<-as.factor(data0[,i])
  }

  RF <- make_Weka_classifier("weka/classifiers/trees/RandomForest")
  model_rf <- RF(data0$Ydata ~ ., data = data0)

  SVM <- make_Weka_classifier("weka/classifiers/functions/SMO")
  model_svm <- SVM(data0$Ydata ~ ., data = data0)

  LR <- make_Weka_classifier("weka/classifiers/functions/Logistic")
  model_lr <- LR(data0$Ydata ~ ., data = data0)

  predictionRF<-predict(model_rf, newdata=data0[,1:ncol(Xdata)], type = c("class"))
  predictionSVM<-predict(model_svm, newdata=data0[,1:ncol(Xdata)], type = c("class"))
  predictionLR<-predict(model_lr, newdata=data0[,1:ncol(Xdata)], type = c("class"))

  return(list(predictionRF=predictionRF,
              predictionSVM=predictionSVM,
              predictionLR=predictionLR))
}

