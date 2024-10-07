#' Spotify Original Dataset
#'
#' This dataset contains data on musical tastes in Spotify from the `last.fm` dataset. It informs
#' about which users have listened to which artists. Refer to the source for details.
#'
#' @format A dataframe with 1226 rows (users) and 286 columns, one corresponding to the index number
#' (first column, `X`) and the remaining 285 corresponding to different artists.
#'
#' @docType data
#'
#' @usage data(spotify_original)
#'
#' @source
#' Item-item collaborative filtering with binary or unitary data, <https://medium.com/radon-dev/item-item-collaborative-filtering-with-binary-or-unary-data-e8f0b465b2c3>. Accessed: 02 October 2024
#'
#' @examples
#' data(spotify_original)
#' head(spotify_original)
#'
"spotify_original"
