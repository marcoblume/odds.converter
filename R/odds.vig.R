#' Calculate the vigorish from a vector of vigged odds.
#'
#' @param ... Odds of the format defined in input, the odds can be submitted as a data.frame or as a vector
#' @param input Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds
#'
#'@export
#'
#' @return A vector of the vigs of the the given vigged odds
#'
#' @examples
#' odds.vig(-120,110)
#' odds.vig(2.05,3.12,2.90,input="dec")
#' df <- data.frame(Home = c(1.5,1.8,1.9),
#'                 Away = c(2.9,2.2,2.05))
#' odds.vig(df,input = "dec")
#' odds.vig(df$Home,df$Away,input="dec")
odds.vig <- function(..., input = "us") {
  formats <- c("us", "prob", "dec", "malay", "hk", "indo")
  if (!is.element(input, formats)) {
    stop(paste("Valid Oddsformats are:", paste(formats, collapse = ", ")))
  }
  odds <- as.matrix(do.call("cbind", list(...)))
  if (ncol(odds) == 1) odds <- t(odds)
  if (input == "prob") {
    implied.probs <- odds
  } else {
    implied.probs <-
      get(paste0("odds.", input, "2prob"), mode = "function")(odds)
  }
  implied.probs.sum <- rowSums(implied.probs)
  implied.probs.sum[implied.probs.sum < 1] <- NA_real_
  1 - 1 / implied.probs.sum
}
