#' Convert Malaysian odds to US odds
#'
#' @param x A vector of Malaysian odds
#'
#' @return A vector of US odds
#'
#'@export
#'
#' @examples
#' odds.malay2us(c(0.5,-0.6))
odds.malay2us <- function (x) {
  us <- rep(NA_real_, length(x))
  us[x >= -1 & x <= 1] <- -100 / x[x >= -1 & x <= 1]
  us
}
