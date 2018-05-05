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
  us <- x
  us[] <- NA_real_
  us[which(x >= -1 & x != 0 & x <= 1)] <- -100 / x[which(x >= -1 & x != 0 & x <= 1)]
  us
}
