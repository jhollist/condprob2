#' Estimate min sample size for calculating probability
#' 
#' This function takes a brute force approach to estimating the minimum sample
#' size for calculating a probability given a binary vector of data.  This is used
#' to set the upper bounds on a conditional probability analysis.  In this 
#' function the original vector is sampled with replacement, the probability is
#' calculated and stored.  This is done R number of times and this distrubution of
#' proabilities is saved
#' 
#' Starting with a sample size of a given minimum value, the original data is 
#' bootstrapped for that sample size, the probability is calculated and saved.  The
#' distribution of probabilities is tested against the original distribution to check
#' for differences.  The smalles sample size that returns a similar distribution is the
#' minimum sample size
#' 
#' @return an interger value indicating the minimum sample size.
#'
#' @param x a vector of values to find minimum sample size for.  The values
#'        should be 1 and 0.
#' @param R the number of bootstrap iterations. Defaults to 100.
#' @param n the minimum sample size to start testing from.  Defaults to 5.
#' @param alpha the alpha level for determining confidence intervals.  Default
#'        is 0.05 and this return the quantiles at 0.025 and 0.975.
#' @export
#' @examples
#' bivec<-rbinom(100,1,0.5)
#' cpaMinSamp(bivec,alpha=0.01)
cpaMinSamp<-function(x,R=100,n=5,alpha=0.05){
  
  orig<-vector("numeric",length=R)
  for(i in 1:R){
    orig[i]<-sum(sample(x,length(x),TRUE),na.rm=TRUE)/length(x)
  }
  origCI<-quantile(orig,c(alpha/2,1-alpha/2))
  test<-TRUE
  while(test){
    samp<-vector("numeric",length=n)
    for(i in 1:R){
      samp[i]<-sum(sample(x,n,TRUE),na.rm=TRUE)/n
    }
    sampCI<-quantile(samp,c(alpha/2,1-alpha/2))
    test<-ks.test(orig,samp)$p.value<alpha
    n<-n+1
    if(n==length(x)){
      return(warning("all tested sample sizes resulted in different
                      distributions.  Try reducing alpha (e.g. 0.01)"))
    }
  }
  return(n)
}