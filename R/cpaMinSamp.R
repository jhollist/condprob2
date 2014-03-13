#' Estimate min sample size for calculating probability
#' 
#' This function takes a brute force approach to estimating the minimum sample
#' size for calculating a probability given a binary vector of data.  This is used
#' to set the upper bounds on a conditional probability analysis.  In this 
#' function the original vector is sampled with replacement starting with the minimum
#' sample size.  A t-test is done between the original data and the sampled data.  This is
#' repeated R number of iterations.  The stored p-values of these iterations are compared to the
#' alpha.  The sample size where any of the p-values are less than alpha is the returned
#' minimum sample size.  This is a very conservative estimate for the minimum sample size.
#' Oh and this function is a complete hack job.  Not sure it should be used... 
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
#' data(binCutoff)
#' cpaMinSamp(binCutoff,n=200,R=1000,alpha=0.001)
cpaMinSamp<-function(x,R=100,n=5,alpha=0.05){
  orig<-vector("numeric",length=R)
  for(i in 1:R){
    orig[i]<-sum(sample(orig,length(x),TRUE))/length(x)
  }
  test<-TRUE
  while(test){
    samp<-vector("numeric",length=R)
    for(i in 1:R){
      samp[i]<-sum(sample(x,n,TRUE))/n
    }
    test<-sum(samp<alpha)<5
    n<-n-1
    print(paste(n,alpha,mean(samp)))
  }
  return(n)
}