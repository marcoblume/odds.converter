#' Convert Decimal Odds to Indonesian odds
#'
#' @param x A vector of Decimal odds
#'
#' @return A vector of Indonesian odds
#'
#'@export
#'
#' @examples
#' odds.dec2indo(c(1.93,2.05))
odds.dec2indo <- function (x) {
  indo <- rep(NA_real_, length(x))
  names(indo) <- names(x)
  indo[which(x > 1)] <- odds.dec2us(x[which(x > 1)]) / 100
  indo
}
