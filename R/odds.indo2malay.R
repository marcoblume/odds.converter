#' Convert Indonesian odds to Malaysian odds
#'
#' @param x A vector of Indonesian odds
#'
#' @return A vector of Malaysian odds
#'
#'@export
#'
#' @examples
#' odds.indo2malay(c(1.93,2.05))
odds.indo2malay <- function (x) {
  malay <- rep(NA_real_, length(x))
  names(malay) <- names(x)
  malay[which(x <= -1 | x >= 1)] <- -1 / x[which(x <= -1 | x >= 1)]
  malay
}
