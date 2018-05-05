#' Convert Probabilities to Malaysian odds
#'
#' @param x A vector of Probabilities
#'
#' @return A vector of Malaysian odds
#'
#'@export
#'
#' @examples
#' odds.prob2malay(c(0.5,0.6))
odds.prob2malay <- function (x) {
  malay <- x
  malay[] <- NA_real_
  malay[which(x > 0 & x < 1)] <- 1 / (1 - 1 / x[which(x > 0 & x < 1)])
  malay[which(x > 0.5 & x < 1)] <- 1 / x[which(x > 0.5 & x < 1)] - 1
  malay
}
