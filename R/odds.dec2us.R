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
  us <- x
  us[] <- NA_real_  
  us[which(x > 1)] <- -100 / (x[which(x > 1)] - 1)
  us[which(x > 2)] <- 100 * (x[which(x > 2)] - 1)
  us
}
