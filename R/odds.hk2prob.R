#' Convert Hong Kong Odds to Probabilities
#'
#' @param x A vector of Hong Kong odds
#'
#' @return A vector of Probabilities
#'
#'@export
#'
#' @examples
#' odds.hk2us(c(1.93,0.05))
odds.hk2prob<- function (x) {
  prob <- rep(NA_real_, length(x))
  dim(prob) <- dim(x)
  names(prob) <- names(x)
  prob[which(x > 0)] <- 1 / (x[which(x > 0)] + 1)
  prob
}
