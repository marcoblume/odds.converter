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
  prob <- x
  prob[] <- NA_real_
  prob[which(x > 0 & x <= 1)] <- 1 / (1 + x[which(x > 0 & x <= 1)])
  prob[which(x >= -1 & x < 0)] <- 1 / (1 - 1 / x[which(x >= -1 & x < 0)])
  prob
}
