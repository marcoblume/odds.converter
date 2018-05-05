#' Convert Indonesian odds to Decimal odds
#'
#' @param x A vector of Indonesian odds
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.indo2dec(c(1.93,2.05))
odds.indo2dec <- function (x) {
  dec <- x
  dec[] <- NA_real_
  dec[which(x <= -1)] <- -1 / x[which(x <= -1)] + 1
  dec[which(x >= 1)] <- x[which(x >= 1)] + 1
  dec
}
