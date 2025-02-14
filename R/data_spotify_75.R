#' Spotify 75 Dataset
#'
#' This dataset contains data on musical tastes in Spotify considering only
#' the 75 most listened-to artists from the dataset `spotify_original`.
#' Details about such artists are available in Davila-Pena et al. (2024)
#' (Section 6.2, Table 11).
#'
#' @format A dataframe with 1226 rows (users) and 76 columns, one corresponding to the index number
#' (first column, `X`) and the remaining 75 corresponding to different artists.
#'
#' @docType data
#'
#' @usage data(spotify_75)
#'
#' @source
#' Item-item collaborative filtering with binary or unitary data, <https://medium.com/radon-dev/item-item-collaborative-filtering-with-binary-or-unary-data-e8f0b465b2c3>. Accessed: 02 October 2024
#'
#' @examples
#' data(spotify_75)
#' head(spotify_75)
#'
"spotify_75"
