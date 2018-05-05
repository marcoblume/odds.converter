#' Convert Probabilities to US odds
#'
#' @param x A vector of Probabilities
#'
#' @return A vector of US odds
#'
#'@export
#'
#' @examples
#' odds.prob2us(c(0.5,0.6))
odds.prob2us <- function (x) {
  us <- x
  us[] <- NA_real_
  us[which(x > 0 & x < 1)] <- 100 * (1 / x[which(x > 0 & x < 1)] - 1)
  us[which(x > 0.5 & x < 1)] <- 100 / (1 - 1 / x[which(x > 0.5 & x < 1)])
  us
}
