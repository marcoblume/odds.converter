#' Convert Probabilities to Indonesian odds
#'
#' @param x A vector of Probabilities
#'
#' @return A vector of Indonesian odds
#'
#'@export
#'
#' @examples
#' odds.prob2indo(c(0.5,0.6))
odds.prob2indo <- function (x) {
  indo <- rep(NA_real_, length(x))
  indo[x > 0 & x < 1] <- odds.prob2us(x[x > 0 & x < 1]) / 100
  indo
}
