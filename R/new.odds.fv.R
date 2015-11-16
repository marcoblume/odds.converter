new.odds.fv <- function (...,input="us",output="us") {
  
  if ( !is.element(input,c("us","prob","dec","malay","hk","indo")) ||
       !is.element(output,c("us","prob","dec","malay","hk","indo"))){
    stop("Valid Oddsformats are us,prob,dec,malay,hk,indo")}
  
  
  odds <- data.frame(...)
  
  if(ncol(odds)==1){
    odds <- t(odds)
  }
  
  if(input=="dec"){
    vig.prob.odds <-  mapply(odds.dec2prob, odds )
  }
  if (input=="indo"){
    vig.prob.odds <-  mapply(odds.indo2prob, odds )
  }
  if (input=="malay"){
    vig.prob.odds <-  mapply(odds.malay2prob, odds )
  }
  if (input=="hk"){
    vig.prob.odds <-  mapply(odds.hk2prob, odds )
  }
  if (input=="us"){
    vig.prob.odds <-  mapply(odds.us2prob, odds )
  }
  if (input=="prob"){
    vig.prob.odds <-  odds 
  }
  if(inherits(vig.prob.odds,"matrix")){
  vig <- rowSums(vig.prob.odds)
  }else{
    vig <- sum(vig.prob.odds) 
  }
  
  fair.prob.odds <- vig.prob.odds/vig
  
  if (output=="prob"){
    return(fair.prob.odds)
  }

  if (output=="dec"){
    fair.prob.dec <- odds.prob2dec(fair.prob.odds)
    return(fair.prob.dec)
  }
  if (output=="indo"){
    fair.prob.indo <- odds.prob2indo(fair.prob.odds)
    return(fair.prob.indo)
  }
  if (output=="hk"){
    fair.prob.hk <- odds.prob2hk(fair.prob.odds)
    return(fair.prob.hk)
  }
  if (output=="prob"){
    return(fair.prob.odds)
  }
  if (output=="us"){
    fair.prob.us <- odds.prob2us(fair.prob.odds)
    return(fair.prob.us)
  }
  if (output=="malay"){
    fair.prob.malay <- odds.prob2malay(fair.prob.odds)
    return(fair.prob.malay)
  }
}


