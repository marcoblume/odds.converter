#' Convert Malaysian odds to Probabilities
#'
#' @param x A vector of Malaysian odds
#'
#' @return A vector of Probabilities
#'
#'@export
#'
#' @examples
#' odds.malay2prob(c(1.93,2.05))
odds.malay2prob <- function (x) {
  prob <- rep(NA_real_, length(x))
  prob[x >= -1 & x <= 1] <- odds.us2prob(-100 / x[x >= -1 & x <= 1])
  prob
}
