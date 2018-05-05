#' Convert US odds to Hong Kong odds
#'
#' @param x A vector of US odds
#'
#' @return A vector of Hong Kong odds
#'
#'@export
#'
#' @examples
#' odds.us2hk(c(-200,150))
odds.us2hk <- function (x){
  hk <- x
  hk[] <- NA_real_
  hk[which(x <= -100)] <- -100 / x[which(x <= -100)]
  hk[which(x >= 100)] <- x[which(x >= 100)] / 100
  hk
}
