#' Convert Hong Kong Odds to Malaysian Odds
#'
#' @param x A vector of Hong Kong odds
#'
#' @return A vector of Malaysian odds
#'
#'@export
#'
#' @examples
#' odds.hk2malay(c(1.93,0.05))
odds.hk2malay <- function (x) {
  malay <- x
  malay[] <- NA_real_
  malay[which(x > 0)] <- -100 / odds.hk2us(x[which(x > 0)])
  malay
}
