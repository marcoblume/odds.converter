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
  malay <- rep(NA_real_, length(x))
  malay[x > 0 & x < 1] <- -100 / odds.prob2us(x[x > 0 & x < 1])
  malay
}
