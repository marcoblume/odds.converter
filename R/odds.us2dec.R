#' Convert US odds to Decimal odds
#'
#' @param x A vector of US odds
#'
#' @return A vector of Decimal odds
#'
#'@export
#'
#' @examples
#' odds.us2dec(c(-200,150))
odds.us2dec <- function (x) {
  dec <- rep(NA_real_, length(x))
  dim(dec) <- dim(x)
  names(dec) <- names(x)
  dec[which(x <= -100)] <- -100 / x[which(x <= -100)] + 1
  dec[which(x >= 100)] <- x[which(x >= 100)] / 100 + 1
  dec
}
