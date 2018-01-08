#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector cpwt_c(NumericVector xX, NumericVector xxY, double xxImpair, 
                     char xxProbComp, NumericVector xxW, NumericVector xxo) {
  int n = xxo.size();
  NumericVector xxProb = 0;
  for(int i = 0; i < n; ++i) 
    xxProb[i] = R::sum(xX);
  return xxProb;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
load("testdata.rda")

cpwt <- function(xX, xxY, xxImpair, xxProbComp = c("gt", "lt"), 
                 xxW = rep(1, length(xX)), xxo) {
# pre-allocate
  xxNum <- vector("numeric", length(xxo))
  xxDenom <- vector("numeric", length(xxo))
  xxProb <- vector("numeric", length(xxo))
  
# Calculates Conditional Probability
  for (i in xxo) {
    if(xxProbComp == "gt"){
      xxNum[i] <- sum(xxW[i:length(xxo)][xxY[i:length(xxo)] > xxImpair])/sum(xxW)
    } else if(xxProbComp == "lt"){
      xxNum[i] <- sum(xxW[i:length(xxo)][xxY[i:length(xxo)] < xxImpair])/sum(xxW)
    }
    xxDenom[i] <- sum(xxW[i:length(xxo)])/sum(xxW)
      xxProb[i] <- xxNum[i]/xxDenom[i]
  }
  xxProb
}

microbenchmark::microbenchmark(cpwt(bootdata1[, 1], bootdata[, 2] - 1, xImpair, 
                                    ProbComp, bootdata1[, 3], o),
                               cpwt_c(bootdata1[, 1], bootdata[, 2] - 1, xImpair, 
                                    ProbComp, bootdata1[, 3], o))
*/
