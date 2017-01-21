#' Transfer a vector to odds into correct parlay odds
#'
#' @param ... Odds of the format defined in input
#' @param input Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds
#' @param output Default to US Odds. Valid selections are  "us" for US odds,
#' "prob" for Probability ,"dec" for Decimal odds,"malay" for Malaysian odds,
#' "hk" for Hong Kong odds, "indo" for Indonesian odds 
#'
#' @return Parlay odds in desired odds format
#' @export
#'
#' @examples
#' odds.parlay(c(-105,-110),output="dec")
odds.parlay <- function (...,input="us",output="us") {
  
  if ( !is.element(input,c("us","prob","dec","malay","hk","indo")) ||
       !is.element(output,c("us","prob","dec","malay","hk","indo"))){
    stop("Valid Oddsformats are us,prob,dec,malay,hk,indo")}

  
  if(input=="dec"){
    parlay.odds <-  prod(...)
  }
  if (input=="indo"){
    parlay.odds <-  prod(odds.indo2dec(...))
  }
  if (input=="malay"){
    parlay.odds <-  prod(odds.malay2dec(...))
  }
  if (input=="hk"){
    parlay.odds <-  prod(odds.hk2dec(...))
  }
  if (input=="us"){
    parlay.odds <-  prod(odds.us2dec(...))
  }
  if (input=="prob"){
    parlay.odds <-  prod(odds.prob2dec(...)) 
  }
  
  if(output=="dec"){
    print(parlay.odds)
  }
  if (output=="indo"){
    print(odds.dec2indo(parlay.odds))
  }
  if (output=="malay"){
    print(odds.dec2malay(parlay.odds))
  }
  if (output=="hk"){
    print(odds.dec2hk(parlay.odds))
  }
  if (output=="us"){
    print(odds.dec2us(parlay.odds))
  }
  if (output=="prob"){
    print(odds.dec2prob(parlay.odds))
  }
}