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
  dec <- x
  dec[] <- NA_real_
  dec[which(x > 0)] <- x[which(x > 0)] + 1
  dec
}
