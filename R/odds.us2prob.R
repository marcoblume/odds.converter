#' Convert US odds to Probabilities
#'
#' @param x A vector of US odds
#'
#' @return A vector of Probabilities
#'
#'@export
#'
#' @examples
#' odds.us2prob(c(-200,150))
odds.us2prob <- function (x) {
  prob <- x
  prob[] <- NA_real_
  prob[which(x <= -100)] <- 1 / (1 - 100 / x[which(x <= -100)])
  prob[which(x >= 100)] <- 1 / (1 + x[which(x >= 100)] / 100)
  prob
}
