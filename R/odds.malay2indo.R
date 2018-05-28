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
  indo <- x
  indo[] <- NA_real_
  indo[which(x >= -1 & x != 0 & x <= 1)] <- -1 / x[which(x >= -1 & x != 0 & x <= 1)]
  indo
}
