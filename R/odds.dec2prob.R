#' Convert Decimal Odds to Probabilities
#'
#' @param x A vector of Decimal odds
#'
#' @return A vector of Probabilities
#'
#'@export
#'
#' @examples
#' odds.dec2prob(c(1.93,2.05))
odds.dec2prob <- function (x) {
  prob <- rep(NA_real_, length(x))
  names(prob) <- names(x)
  prob[which(x > 1)] <- 1 / x[which(x > 1)]
  prob
}
