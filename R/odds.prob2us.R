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
  us <- rep(NA_real_, length(x))
  us[x > 0 & x < 1] <- 100 * (1 / x[x > 0 & x < 1] - 1)
  us[x > 0.5 & x < 1] <- -100 / (1 / x[x > 0.5 & x < 1] - 1)
  us
}
