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
  prob <- rep(NA_real_, length(x))
  prob[x <= -100] <- 1 + 100 / (x[x <= -100] - 100)
  prob[x >= 100] <- 100 / (100 + x[x >= 100])
  prob
}
