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
  dim(us) <- dim(x)
  names(us) <- names(x)
  us[which(x <= -1 | x >= 1)] <- 100 * x[which(x <= -1 | x >= 1)]
  us
}
