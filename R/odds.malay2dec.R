#' Convert Malaysian odds to Decimal odds
#'
#' @param x A vector of Malaysian odds
#'
#' @return A vector of Decimal odds
#'
#'@export
#'
#' @examples
#' odds.malay2dec(c(0.5,-0.6))
odds.malay2dec <- function (x) {
  dec <- rep(NA_real_, length(x))
  dec[x >= -1 & x <= 1] <- odds.us2dec(odds.malay2us(x[x >= -1 & x <= 1])))
  dec
}
