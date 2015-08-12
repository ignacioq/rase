\name{post.mcmc}

\alias{post.mcmc}

\title{
Post-MCMC Handling
}

\description{
Takes the result from an mcmc run (e.g., output from \code{\link{rase}}) and applies a burnin and a thinning.  Optionally it can be transformed into a \code{\link[ggmcmc]{ggs}} object that the ggmcmc package can use (for mcmc visualization).
}

\usage{
post.mcmc(res, burnin = 1000, thin = 10, as.ggmcmc = TRUE)
}

\arguments{
  \item{res}{
  		The output from any mcmc run in (e.g., output from \code{\link{rase}}). It is effectively a matrix where each column is a different parameter and each row is one iteration of the mcmc sampler.
  }
  \item{burnin}{
		Number of iterations to disregard as burnin.
}
  \item{thin}{
		Sample every ith iteration. If no iterations are to be discarted, it should be \code{thin = 1}. Note that if \code{thin = 0}, then no iteration is saved at all.
}
  \item{as.ggmcmc}{
	If \code{TRUE} (default), the object will be transformed into a \code{\link[ggmcmc]{ggs}} object.
	}
}

\value{
	If \code{as.ggmcmc = TRUE} (the default), the function returns a \code{\link[ggmcmc]{ggs}} object. This can be used as input to the \code{ggs_*} functions in the ggmcmc package.
	If \code{as.ggmcmc = FALSE}, the function returns a matrix where each column is a different parameter and each row is one iteration of the mcmc sampler.
}

\author{
Ignacio Quintero
}

\seealso{
\code{\link{rase}}, \code{\link{bm_ase}}, \code{\link[ggmcmc]{ggs}}
}

\examples{
#attach the data
data(rase_data, package = 'rase')
	
\dontrun{
# Explore the data
str(mcmc)

# discard the first 200 iterations as burnin 
#and keep every 10th iteration.
gg_dat <- post.mcmc(mcmc, burnin=200, thin = 10, as.ggmcmc = TRUE)

# density using ggmcmc for dispersal rates (sigma).
require(ggmcmc)
ggs_density(gg_dat, family = 'sigma')
}
}

