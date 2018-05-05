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
  indo <- x
  indo[] <- NA_real_
  indo[which(x > 0 & x < 1)] <- 1 / x[which(x > 0 & x < 1)] - 1
  indo[which(x > 0.5 & x < 1)] <- 1 / (1 - 1 / x[which(x > 0.5 & x < 1)])
  indo
}
