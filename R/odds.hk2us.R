#' Convert Hong Kong Odds to US Odds
#'
#' @param x A vector of Hong Kong odds
#'
#' @return A vector of US odds
#'
#'@export
#'
#' @examples
#' odds.hk2us(c(1.93,0.05))
odds.hk2us <- function (x) {
  us <- x
  us[] <- NA_real_
  us[which(x > 0)] <- -100 / x[which(x > 0)]
  us[which(x > 1)] <- 100 * x[which(x > 1)]
  us
}
