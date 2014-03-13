#' Estimate min sample size for calculating probability
#' 
#' This function takes a brute force approach to estimating the minimum sample
#' size for calculating a probability given a binary vector of data.  This is used
#' to set the upper bounds on a conditional probability analysis.  In this 
#' function the original vector is sampled with replacement, the probability is
#' calculated and stored.  This is done R number of times and and the upper and
#' lower CIs for those bootstrap iterations are determined.  This provides the 
#' range of expected values for the probability.  
#' 
#' Starting with a sample size of a given minimum value, the original data is 
#' bootstrapped for that sample size, the CIs determined and compared with the
#' original CIs.  The sample size that has CIs that overlap the original is returned
#' as the minimu sample size.
#' 
#' 
#' @param x a vector of values to find minimum sample size for.  The values
#'        should be 1 and 0.
#' @param R the number of bootstrap iterations. Defaults to 100.
#' @param n the minimum sample size to start testing from.  Defaults to 5.
#' @param alpha the alpha level for determining confidence intervals.  Default
#'        is 0.05 and this return the quantiles at 0.025 and 0.975.
#' @export
#' @example
#' bivec<-rbinom(500,1,0.5)
#' cpaMinSamp(bivec)
cpaMinSamp<-function(x,R=100,n=5,alpha=0.05){
  orig<-vector("numeric",length=R)
  for(i in 1:R){
    orig[i]<-sum(sample(x,length(x),TRUE),na.rm=TRUE)/length(x)
  }
  origCI<-quantile(orig,c(alpha/2,1-alpha/2))
  samp<-vector("numeric",length=n)
  for(i in 1:R{
    samp[i]<-sum(sample(x,n,TRUE),na.rm)/n
  }
  
  return(origCI)
}