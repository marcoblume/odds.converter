#' Convert Hong Kong Odds to Indonesian Odds
#'
#' @param x A vector of Hong Kong odds
#'
#' @return A vector of Indonesian odds
#'
#'@export
#'
#' @examples
#' odds.hk2indo(c(1.93,0.05))
odds.hk2indo <- function (x) {
  indo <- rep(NA_real_, length(x))
  dim(indo) <- dim(x)
  names(indo) <- names(x)
  indo[which(x > 0)] <- odds.hk2us(x[which(x > 0)]) / 100
  indo
}
