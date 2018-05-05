#' Convert Probabilities to Hong Kong odds
#'
#' @param x A vector of Probabilities
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.prob2hk(c(0.5,0.6))
odds.prob2hk <- function (x) {
  hk <- x
  hk[] <- NA_real_
  hk[which(x > 0 & x < 1)] <- 1 / x[which(x > 0 & x < 1)] - 1
  hk
}
