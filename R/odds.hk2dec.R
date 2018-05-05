#' Convert Hong Kong Odds to Decimal Odds
#'
#' @param x A vector of Hong Kong odds
#'
#' @return A vector of Decimal odds
#'
#'@export
#'
#' @examples
#' odds.hk2dec(c(1.93,0.05))
odds.hk2dec <- function (x) {
  dec <- rep(NA_real_, length(x))
  names(dec) <- names(x)
  dec[which(x > 0)] <- x[which(x > 0)] + 1
  dec
}
