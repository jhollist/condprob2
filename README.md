# Conditional Probability Analysis with `condprob`

This repository is an R package for running a conditional probability analysis as outlined in [Paul and MacDonald (2005)][1] and [Hollister et al. 2008][2].  This method was originally developed as a way to examine probability of impairment of an ecological resource (e.g. streams or lakes) given a stressor amount. 

# Included Functions

The primary purpose of this package is to serve as a replacement to the deprecated software described in [Hollister et al. 2008][2]. My initial intent is to provide the same functionality.  The following functions are available (or planned).

- condprob: The workhorse function.  Runs a conditional probability analysis and returns an output data frame of the class "condprob"
- plot.condprob: Default plotting function to create a plot of a condprob object

**Experimental Functions**
- condrobMin: This function was an experiment to see if I could use a bootstrapping method to identify a minimum sample size needed to calculate condition probability. Returns a condprobMin object.
- plot.condprobMin: default plotting function for condprobMin objects.

# To install 
Install version 1.0 of `condprob` from CRAN:
Note: Not currently available from CRAN

```
install.packages("condprob")
require(condprob)
```

Install development version of `condprob` from GitHub:

```
install.packages("devtools")
require(devtools)
install_github("jhollist/condprob")
require(condprob)
```


# EPA Disclaimer
The United States Environmental Protection Agency (EPA) GitHub project code is provided on an "as is" basis and the user assumes responsibility for its use.  EPA has relinquished control of the information and no longer has responsibility to protect the integrity , confidentiality, or availability of the information.  Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recomendation or favoring by EPA.  The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity by EPA or the United States Government. 




[1]: http://onlinelibrary.wiley.com/doi/10.1111/j.1752-1688.2005.tb03795.x/abstract "Paul and Macdonald 2005"
[2]: http://jwhollister.com/files/HollisterWalkerPaulCProb_Final.pdf "Hollister et al. 2008"
[3]: http://en.wikipedia.org/wiki/Water_quality#Biological_indicators "EPT Taxa"