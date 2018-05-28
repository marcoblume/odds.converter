#' Calculate the fair (vigorish free) odds for a vector of vigged odds.
#'
#' @param ... Odds of the format defined in input, the odds can be submitted as a data.frame or as a vector
#' @param input Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds
#' @param output Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds
#' @param Vectorized2wayOutput1stElement This speeds up the calculation as the output is a a vector that contains the FV of the first input. Usefull in dplyr chains.
#'
#'@export
#'
#' @return A vector or a matrix of the fair values of the the given vigged values in the format chosen in output
#'
#' @examples
#' odds.fv(-120,110)
#' odds.fv(2.05,3.12,2.90,input="dec",output="prob")
#' df <- data.frame(Home = c(1.5,1.8,1.9),
#'                 Away = c(2.9,2.2,2.05))
#' odds.fv(df,input = "dec",output = "prob")
#' odds.fv(df$Home,df$Away,input="dec",output="prob")
#' odds.fv(df$Home,df$Away,input="dec",output="prob",Vectorized2wayOutput1stElement = TRUE)
odds.fv <- function(..., input = "us", output = "us", Vectorized2wayOutput1stElement = FALSE) {
  formats <- c("us", "prob", "dec", "malay", "hk", "indo")
  if (!all(is.element(c(input, output), formats))) {
    stop(paste("Valid Oddsformats are:", paste(formats, collapse = ", ")))
  }
  odds <- as.matrix(do.call('cbind', list(...)))
  if (ncol(odds) == 1) {
    odds <- t(odds)
  }
  if (input == "prob") {
    implied.probs <- odds
  } else {
    implied.probs <-
      get(paste0("odds.", input, "2prob"), mode = 'function')(odds)
  }
  implied.probs.sum <- rowSums(implied.probs)
  implied.probs.sum[implied.probs.sum < 1] <- NA_real_
  fair.probs <- implied.probs / implied.probs.sum
  if (output == 'prob') {
    fair.odds <- fair.probs
  } else {
    fair.odds <- get(paste0("odds.prob2", output), mode = 'function')(fair.probs)
  }
  if (Vectorized2wayOutput1stElement) {
    fair.odds[, 1]
  } else {
    if (nrow(fair.odds) == 1) {
      fair.odds[1, ]
    } else {
      fair.odds
    }
  }
}
