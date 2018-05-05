#' Convert Indonesian odds to Probabilities
#'
#' @param x A vector of Indonesian odds
#'
#' @return A vector of Probabilities
#'
#'@export
#'
#' @examples
#' odds.indo2hk(c(1.93,2.05))
odds.indo2prob <- function(x) {
  prob <- x
  prob[] <- NA_real_
  prob[which(x <= -1)] <- 1 + 1 / (x[which(x <= -1)] - 1)
  prob[which(x >= 1)] <- 1 / (1 + x[which(x >= 1)])
  prob
}
