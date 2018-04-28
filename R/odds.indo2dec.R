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
  dec <- rep(NA_real_, length(x))
  dec[x <= -1 | x >= 1] <- odds.us2dec(100 * x[x <= -1 | x >= 1])
  dec
}
