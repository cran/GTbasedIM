#' Cars Binary Dataset
#'
#' This dataset contains data on car crash fatalities after transforming the original
#' categorical variables of the dataset `cars_original` into binary variables. Details
#' about such transformations are available in Davila-Pena et al. (2024).
#' (Section 6.1, Table 5).
#'
#' @format A dataframe with 17565 rows (representing individuals) and 12 columns, one corresponding to the index number
#' (first column, `X`), one to the binary response (last column, `deceased`), and the remaining 10 representing the following binary features:
#'
#' \describe{
#'   \item{`dvcat`}{Binary variable indicating whether the vehicle, at the moment of the accident, was traveling at a speed higher than 55 km/h (1) or not (0).}
#'   \item{`airbag`}{Binary variable indicating whether the vehicle had an airbag system (1) or not (0).}
#'   \item{`seatbelt`}{Binary variable indicating whether the person involved was wearing a seat belt (1) or not (0).}
#'   \item{`frontal`}{Binary variable indicating whether the vehicle crash was frontal (1) or nonfrontal (0).}
#'   \item{`sex`}{Binary variable indicating the sex of the person involved: 1 for male and 0 for female.}
#'   \item{`abcat`}{Binary variable indicating airbag activation: 1 if one or more airbags in the vehicle were activated (even if not deployed) and 0 if none were deployed (either due to malfunction or being disabled).}
#'   \item{`occRole`}{Binary variable indicating whether the person involved was the driver (1) or a passenger (0) of the vehicle.}
#'   \item{`deploy`}{Binary variable indicating whether the airbag functioned correctly (1) or was unavailable or not functioning (0).}
#'   \item{`ageOFocc`}{Binary variable indicating whether the person was 30 years old or less (1) or over 30 years old (0).}
#'   \item{`age`}{Binary variable indicating whether the vehicle was 10 years old or more (1) or less than 10 years old (0).}
#' }
#'
#' @docType data
#'
#' @usage data(cars_binary)
#'
#' @source Generated data for illustrative purposes, see:
#' Davila-Pena, L., Saavedra-Nieves, A., & Casas-Méndez, B. (2024). *On the influence of dependent features in classification problems: a game-theoretic perspective*. arXiv preprint. \doi{10.48550/arXiv.2408.02481}.
#'
#' @examples
#' data(cars_binary)
#' head(cars_binary)
#'
"cars_binary"
