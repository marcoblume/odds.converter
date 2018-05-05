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
  us <- x
  us[] <- NA_real_
  us[which(x <= -1 | x >= 1)] <- 100 * x[which(x <= -1 | x >= 1)]
  us
}
