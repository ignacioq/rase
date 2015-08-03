\name{bm_ase}

\alias{bm_ase}

\title{
Bayesian Ancestral State Estimation with Points
}

\description{
Performs a bayesian two-dimensional ancestral state estimation with single values as input (contrast with \code{\link{rase}}) according to a Brownian Motion model of trait evolution (or dispersal for phylogeography).  It uses Gibbs sampling to approximate the posterior distribution.
}

\usage{
bm_ase(tree, values, niter = 1e3, logevery = 10, 
		sigma2_scale = 0.05, screenlog = TRUE, params0 = NA)
}

\arguments{
  \item{tree}{
	phylogenetic tree of class \code{"phylo"}.
	}
  \item{values}{
	2-dimensional trait values (e.g., coordinates for phylogeography). Should be a \code{data.frame} with two columns named \code{x} & \code{y}, or a \code{list} with two elements named \code{x} & \code{y}.
	}
  \item{niter}{
	number of MCMC iterations. By default \code{niter = 1000}.
	}
  \item{logevery}{
	iteration cycle to print current iteration. By default \code{logevery = 10}.
	}
  \item{sigma2_scale}{
	optional. Window proposal for sigma2x & sigma2y.
	}
  \item{screenlog}{
	if \code{TRUE} (default), prints current iteration every \code{logevery} to the screen.
	}
  \item{params0}{
	optional. A vector of initial parameter values in the following order: x ancestors, y ancestors, sigma2x and sigma2y. If \code{params0 = NA} (default), an initial Maximum Likelihood optimization using \code{\link[ape]{ace}} provides the starting parameter values.
	}
}


\value{
returns a matrix where every column represents one parameter. The first columns (i.e., \code{nX_x}) give the ancestral locations for trait x in the order of nodes in the tree (see the \code{phylo} class for details), followed by the ancestral locations of trait y (i.e., \code{nX_y}), and the rate parameter in x (\code{sigma2x}) and y (\code{sigma2y}).
}

\references{
Quintero, I., Keil, P., Jetz, W., Crawford, F. W. 2015 Historical Biogeography Using Species Geographical Ranges. \emph{Systematic Biology}.
}

\author{
Forrest Crawford, Ignacio Quintero
}

\seealso{
For the maximum likelihood version see \code{\link{point.like.bm}}; for the incorporation of polygon uncertainty see \code{\link{rase}}. For post-mcmc handling see \code{\link{post.mcmc}}.
}

\examples{

### Create some data to be analyzed

# Number of taxa
ntaxa = 10

# Known parameters
mean_x = 0
mean_y = 0
sigma_x = 1 
sigma_y = 1

# Create a random tree
tree = pbtree(n = ntaxa)

# Create random data according to tree structure
x_locs = as.numeric(rmvnorm(1, rep(mean_x,ntaxa), sigma=sigma_x*vcv(tree)))
y_locs = as.numeric(rmvnorm(1, rep(mean_y,ntaxa), sigma=sigma_y*vcv(tree)))
values = list(x = x_locs, y = y_locs)
\dontrun{
# run bm_ase
bm_results = bm_ase(tree, values)}
}

