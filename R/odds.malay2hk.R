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
  hk <- x
  hk[] <- NA_real_
  hk[which(x > 0 & x <= 1)] <- x[which(x > 0 & x <= 1)]
  hk[which(x >= -1 & x < 0)] <- -1 / x[which(x >= -1 & x < 0)]
  hk
}
