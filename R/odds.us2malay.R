#' Convert US odds to Malaysian odds
#'
#' @param x A vector of US odds
#'
#' @return A vector of Malaysian odds
#'
#'@export
#'
#' @examples
#' odds.us2malay(c(-200,150))
odds.us2malay <- function (x) {
  malay <- rep(NA_real_, length(x))
  dim(malay) <- dim(x)
  names(malay) <- names(x)
  malay[which(x <= -100 | x >= 100)] <- -100 / x[which(x <= -100 | x >= 100)]
  malay
}
