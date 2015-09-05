#' Calculate the fair ( vigorish free) odds for a vector of vigged odds. 
#'
#' @param a Odds of the format defined in input
#' @param b Odds of the format defined in input
#' @param ... Odds of the format defined in input
#' @param input Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds
#' @param output Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds 
#'
#' @return A vector of the fair value of the the given vigged values in the format chosen in output
#'
#' @examples
#' odds.fv(-120,110)
#' odds.fv(2.05,3.12,2.90,input="dec",output="prob")
odds.fv <- function (a, b,...,input="us",output="us") {
  if ( !is.element(input,c("us","prob","dec","malay","hk","indo")) ||
       !is.element(output,c("us","prob","dec","malay","hk","indo"))){
    stop("Valid Oddsformats are us,prob,dec,malay,hk,indo")}
  odds <- list(a,b,...)
  if(input=="dec"){
    vig.prob.odds <- sapply(odds,odds.dec2prob)
  }
  if (input=="indo"){
    vig.prob.odds <- sapply(odds,odds.indo2prob)
  }
  if (input=="malay"){
    vig.prob.odds <- sapply(odds,odds.malay2prob)
  }
  if (input=="hk"){
    vig.prob.odds <- sapply(odds,odds.hk2prob)
  }
  if (input=="us"){
    vig.prob.odds <- sapply(odds,odds.us2prob)
  }
  vig <- sum(vig.prob.odds)
  if(vig <1){
    stop("Vigorish is below 0%. Can't calculate Fair Values")
  }
  fair.prob.odds <- vig.prob.odds/vig
  if (output=="dec"){
    fair.prob.dec <- sapply(fair.prob.odds,odds.prob2dec)
    return(fair.prob.dec)
  }
  if (output=="indo"){
    fair.prob.indo <- sapply(fair.prob.odds,odds.prob2indo)
    return(fair.prob.indo)
  }
  if (output=="hk"){
    fair.prob.hk <- sapply(fair.prob.odds,odds.prob2hk)
    return(fair.prob.hk)
  }
  if (output=="prob"){
    return(fair.prob.odds)
  }
  if (output=="us"){
    fair.prob.us <- sapply(fair.prob.odds,odds.prob2us)
    return(fair.prob.us)
  }
  if (output=="malay"){
    fair.prob.malay <- sapply(fair.prob.odds,odds.prob2malay)
    return(fair.prob.malay)
  }
}
