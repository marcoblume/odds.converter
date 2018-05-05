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
  dec <- x
  dec[] <- NA_real_
  dec[which(x > 0 & x <= 1)] <- x[which(x > 0 & x <= 1)] + 1
  dec[which(x >= -1 & x < 0)] <- -1 / x[which(x >= -1 & x < 0)] + 1
  dec
}
