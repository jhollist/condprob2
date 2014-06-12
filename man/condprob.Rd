\name{condprob}
\alias{condprob}
\title{Function condprob}
\usage{
condprob(xX, xY, xImpair, ProbComp = c("gt", "lt"), Exceed = c("gte",
  "lte"), ci = FALSE, alpha = 0.05, R = 100, xW = rep(1, length(xX)))
}
\arguments{
  \item{xX}{}

  \item{xY}{}

  \item{xImpair}{}

  \item{ProbComp}{}

  \item{Exceed}{}

  \item{ci}{}

  \item{alpha}{}

  \item{R}{}

  \item{xW}{}
}
\description{
This function calculates a conditional probability analysis
}
\examples{
data(jeqdata_wq)
ept<-jeqdata_wq$EPT.RICH
pct_fn<-jeqdata_wq$PCT.FN
cpa1<-condprob(pct_fn,ept,9,"lt","gte",T,R=1000)
}

