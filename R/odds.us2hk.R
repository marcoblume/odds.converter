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
  hk <- rep(NA_real_, length(x))
  hk[x <= -100] <- -100 / x[x <= -100]
  hk[x >= 100] <- x[x >= 100] / 100
  hk
}
