#' Convert Probabilities to Decimal odds
#'
#' @param x A vector of Probabilities
#'
#' @return A vector of Decimal odds
#'
#'@export
#'
#' @examples
#' odds.prob2dec(c(0.5,0.6))
odds.prob2dec <- function (x) {
  dec <- rep(NA_real_, length(x))
  dec[x > 0 & x < 1] <- 1 / x[x > 0 & x < 1]
  dec
}
