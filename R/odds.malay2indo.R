#' Convert Malaysian odds to Indonesian odds
#'
#' @param x A vector of Malaysian odds
#'
#' @return A vector of Indonesian odds
#'
#'@export
#'
#' @examples
#' odds.malay2indo(c(1.93,2.05))
odds.malay2indo <- function (x) {
  indo <- rep(NA_real_, length(x))
  indo[x >= -1 & x <= 1] <- -1 / x[x >= -1 & x <= 1]
  indo
}
