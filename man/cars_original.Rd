% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_cars_original.R
\docType{data}
\name{cars_original}
\alias{cars_original}
\title{Cars Original Dataset}
\format{
A dataframe with 17565 rows (representing individuals) and 16 columns, one corresponding to the index number
(first column, \code{X}) and the remaining ones corresponding to different variables. For details, please refer
to the source below.
}
\source{
This dataset contains data on car crash fatalities from the nassCDS dataset
via the "DAAG" R package (\doi{10.32614/CRAN.package.DAAG})
from Maindonald & Braun (2021).
}
\usage{
data(cars_original)
}
\description{
This dataset contains data on car crash fatalities.
}
\examples{
data(cars_original)
head(cars_original)

}
\references{
Maindonald, J. H. & Braun W. J. (2021). \emph{Data analysis and graphics using R. An example-based approach (3rd edition)}. Cambridge University Press, Cambridge. The DAAG package was created to support this text. \url{https://CRAN.R-project.org/package=DAAG} (R package version 1.25.6.)
}
\keyword{datasets}
