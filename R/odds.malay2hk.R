#' Convert Malaysian odds to Hong Kong odds
#'
#' @param x A vector of Malaysian odds
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.malay2hk(c(1.93,2.05))
odds.malay2hk <- function (x) {
  hk <- rep(NA_real_, length(x))
  hk[x >= -1 & x <= 1] <- odds.us2hk(-100 / x[x >= -1 & x <= 1])
  hk
}
