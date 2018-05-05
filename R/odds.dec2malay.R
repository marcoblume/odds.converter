#' Convert Decimal Odds to Malaysian odds
#'
#' @param x A vector of Decimal odds
#'
#' @return A vector of Malaysian odds
#'
#'@export
#'
#' @examples
#' odds.dec2malay(c(1.93,2.05))
odds.dec2malay <- function (x) {
  malay <- x
  malay[] <- NA_real_
  malay[which(x > 1)] <- odds.us2malay(odds.dec2us(x[which(x > 1)]))
  malay
}
