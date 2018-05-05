#' Convert US odds to Indonesian odds
#'
#' @param x A vector of US odds
#'
#' @return A vector of Indonesian odds
#'
#'@export
#'
#' @examples
#' odds.us2indo(c(-200,150))
odds.us2indo <- function (x) {
  indo <- x
  indo[] <- NA_real_
  indo[which(x <= -100 | x >= 100)] <- x[which(x <= -100 | x >= 100)] / 100
  indo
}
