#' Convert Decimal Odds to Hong Kong odds
#'
#' @param x A vector of Decimal odds
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.dec2hk(c(1.93,2.05))
odds.dec2hk <- function (x) {
  hk <- x
  hk[] <- NA_real_
  hk[which(x > 1)] <- x[which(x > 1)] - 1
  hk
}
