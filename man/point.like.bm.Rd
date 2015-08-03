\name{point.like.bm}

\alias{point.like.bm}

\title{
	n-dimensional Maximum Likelihood of Point Brownian Motion
}

\description{
	Estimates Most Recent Common Ancestor (MRCA) states and the Brownian rate according to a Brownian Motion model of trait evolution using Maximum Likelihood.  It can be used for several dimensions simultaneously.  For 1-dimensional traits, we recommend the more stable \code{\link[ape]{ace}} function.
}

\usage{
	point.like.bm(tree, values, start_values = NA, dimen = NA)
}

\arguments{
  \item{tree}{
		phylogenetic tree of class \code{"phylo"}.
	}
  \item{values}{
 		a list, with each element being one-dimensional values fora  trait.
 	}
  \item{start_values}{
		Optional. A vector of starting values for the Maximum Likelihood optimization. The funtion only estimates the MRCA and the rates for each trait, and that should be the order of the input starting values. 
	}
  \item{dimen}{
		Optional. Number of dimensions (number of traits being analyzed). If \code{dimen = NA}, dimensions are obtained from \code{values}.
	}
}

\value{
	
Returns a list with the following components:
	\item{mrcas}{
		Most recent common ancestor estimates for each trait
	}
	\item{rates}{
		Brownian motion rate parameters for each trait.
	}
	\item{nlm.details}{
		A list with the results from nlm optimization. For details see \code{\link[stats]{nlm}}.
	}
}

\references{
	Schluter, D., et al. 1997 Likelihood of ancestor states in adaptive radiation. \emph{Evolution}: 1699-1711.
}
\author{
Ignacio Quintero
}


\seealso{
\code{\link[ape]{ace}}, ML taking into account ranges \code{\link{ranges.like.bm}}.
}
\examples{
# Number of taxa to simulate tree
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
values = list(x_locs,y_locs)

\dontrun{
# run point.like.bm
bm_results = point.like.bm(tree, values)}
}