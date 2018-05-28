#' Convert Indonesian odds to Hong Kong odds
#'
#' @param x A vector of Indonesian odds
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.indo2hk(c(1.93,2.05))
odds.indo2hk <- function (x) {
  hk <- x
  hk[] <- NA_real_
  hk[which(x <= -1)] <- -1 / x[which(x <= -1)]
  hk[which(x >= 1)] <- x[which(x >= 1)]
  hk
}
