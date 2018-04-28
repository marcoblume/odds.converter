#' Convert Decimal Odds to US Odds
#'
#' @param x A vector of Decimal odds
#'
#' @return A vector of US odds
#'
#'@export
#'
#' @examples
#' odds.dec2us(c(1.93,2.05))
odds.dec2us <- function (x) {
  us <- rep(NA_real_, length(x))
  us[x > 1] <- -100 / (x[x > 1] - 1)
  us[x > 2] <- 100 * (x[x > 2] - 1)
  us
}
