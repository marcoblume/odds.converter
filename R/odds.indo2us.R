#' Convert Indonesian odds to US odds
#'
#' @param x A vector of Indonesian odds
#'
#' @return A vector of US odds
#'
#'@export
#'
#' @examples
#' odds.indo2us(c(1.93,2.05))
odds.indo2us <- function (x) {
  us <- rep(NA_real_, length(x))
  us[x <= -1 | x >= 1] <- 100 * x[x <= -1 | x >= 1]
  us
}
