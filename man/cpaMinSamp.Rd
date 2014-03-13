\name{cpaMinSamp}
\alias{cpaMinSamp}
\title{Estimate min sample size for calculating probability}
\usage{
cpaMinSamp(x, R = 100, n = 5, alpha = 0.05)
}
\arguments{
  \item{x}{a vector of values to find minimum sample size
  for.  The values should be 1 and 0.}

  \item{R}{the number of bootstrap iterations. Defaults to
  100.}

  \item{n}{the minimum sample size to start testing from.
  Defaults to 5.}

  \item{alpha}{the alpha level for determining confidence
  intervals.  Default is 0.05 and this return the quantiles
  at 0.025 and 0.975.}
}
\value{
an interger value indicating the minimum sample size.
}
\description{
This function takes a brute force approach to estimating
the minimum sample size for calculating a probability given
a binary vector of data.  This is used to set the upper
bounds on a conditional probability analysis.  In this
function the original vector is sampled with replacement,
the probability is calculated and stored.  This is done R
number of times and this distrubution of proabilities is
saved
}
\details{
Starting with a sample size of a given minimum value, the
original data is bootstrapped for that sample size, the
probability is calculated and saved.  The distribution of
probabilities is tested against the original distribution
to check for differences.  The smalles sample size that
returns a similar distribution is the minimum sample size
}
\examples{
bivec<-rbinom(100,1,0.5)
cpaMinSamp(bivec,alpha=0.01)
data(binCutoff)
cpaMinSamp(binCutoff,alpha=0.001,n=10)
}

