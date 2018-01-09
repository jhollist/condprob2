library(Rcpp)
cppFunction('NumericVector cpwt_c(NumericVector xX, NumericVector xxY, 
double xxImpair, char xxProbComp, NumericVector xxW, NumericVector xxo) {
  int n = xxo.size();
  NumericVector xxProb(n);
  NumericVector xxNum(n);
  NumericVector xxDenom(n);

  for(int i = 0; i < n; ++i) {
    IntegerVector idx = seq(i,n-1);
    NumericVector xxw(idx.size());
    NumericVector xy(idx.size());

    xy = xxY[idx];
    xxw = xxW[idx];
    xxDenom[i] = sum(xxw)/sum(xxW);
    //if else not working
    if(xxProbComp == "lt"){
      xxw = xxw[xy < xxImpair];
    }else{
      xxw = xxw[xy > xxImpair];
    }
    xxNum[i] = sum(xxw)/sum(xxW);
    xxProb[i] = xxNum[i]/xxDenom[i];
  }
  return xxProb;
}')

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

load("test_cpp/testdata.rda")
microbenchmark::microbenchmark(
cpwt(bootdata1[, 1], bootdata[, 2] - 1, xImpair, ProbComp, bootdata1[, 3], o),
cpwt_c(bootdata1[, 1], bootdata[, 2] - 1, xImpair, ProbComp, bootdata1[, 3], o))
