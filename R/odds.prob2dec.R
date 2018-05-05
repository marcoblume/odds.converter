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
  dec <- x
  dec[] <- NA_real_
  dec[which(x > 0 & x < 1)] <- 1 / x[which(x > 0 & x < 1)]
  dec
}
