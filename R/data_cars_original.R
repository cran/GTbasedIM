#' Cars Original Dataset
#'
#' This dataset contains data on car crash fatalities.
#'
#' @format A dataframe with 17565 rows (representing individuals) and 16 columns, one corresponding to the index number
#' (first column, `X`) and the remaining ones corresponding to different variables. For details, please refer
#' to the source below.
#'
#' @docType data
#'
#' @usage data(cars_original)
#'
#' @source
#' This dataset contains data on car crash fatalities from the nassCDS dataset
#' via the "DAAG" R package (\doi{10.32614/CRAN.package.DAAG})
#' from Maindonald & Braun (2021).
#'
#' @references
#' Maindonald, J. H. & Braun W. J. (2021). *Data analysis and graphics using R. An example-based approach (3rd edition)*. Cambridge University Press, Cambridge. The DAAG package was created to support this text. <https://CRAN.R-project.org/package=DAAG> (R package version 1.25.6.)
#'
#' @examples
#' data(cars_original)
#' head(cars_original)
#'
"cars_original"
